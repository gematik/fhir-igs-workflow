#!/usr/bin/env python3
"""Validate generated carbon copy resources against the BfArM profile."""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Any, Optional

DEFAULT_HAPI_JAR = Path("/Users/gematik/dev/validators/current_hapi_validator.jar")
DEFAULT_PROFILE = "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-carbon-copy"
DEFAULT_FHIR_VERSION = "4.0.1"

# IG dependencies to load into the HAPI validator. Mirrors tests/scripts/transform-bundle.py.
IG_PATHS = [
    "de.gematik.erezept-workflow.r4",
    # "kbv.ita.erp",
    "de.gematik.fhir.directory",
    "de.gematik.ti",
    "hl7.fhir.uv.xver-r5.r4",
    # "de.basisprofil.r4",
    "de.gematik.epa.medication",
]


def load_ig_dependencies(project_root: Path) -> list[str]:
    """Load IG dependencies from package.json, returning `package#version` entries."""
    package_json = project_root / "package.json"
    try:
        data = json.loads(package_json.read_text())
    except (OSError, json.JSONDecodeError):
        return []

    deps = data.get("dependencies", {})
    igs: list[str] = []
    for name, version in deps.items():
        # Core packages are loaded via -version; passing them as -ig can lead to
        # version consistency errors.
        if name in {
            "hl7.fhir.r2.core",
            "hl7.fhir.r3.core",
            "hl7.fhir.r4.core",
            "hl7.fhir.r4b.core",
            "hl7.fhir.r5.core",
        }:
            continue
        if version:
            igs.append(f"{name}#{version}")
        else:
            igs.append(name)
    return igs


def build_command(
    jar_path: Path,
    resource_paths: list[Path],
    profile_url: str,
    fhir_version: str,
    output_bundle: Optional[Path] = None,
) -> list[str]:
    """Construct the validator CLI command."""
    script_dir = Path(__file__).parent
    project_root = script_dir.parent.parent

    ig_dependencies = [
        str(project_root / "fsh-generated" / "resources"),
        *IG_PATHS,
        *load_ig_dependencies(project_root),
    ]

    cmd: list[str] = [
        "java",
        "-jar",
        str(jar_path),
        *[str(p) for p in resource_paths],
        "-profile",
        profile_url,
        "-version",
        fhir_version,
    ]

    if output_bundle is not None:
        cmd.extend(["-output", str(output_bundle)])

    for ig in ig_dependencies:
        cmd.extend(["-ig", ig])

    return cmd


def _read_json(path: Path) -> Any:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def parse_validation_bundle(bundle_path: Path) -> dict[str, dict[str, int | bool]]:
    """Parse the validator output bundle and return results keyed by input file path."""
    data = _read_json(bundle_path)
    if not isinstance(data, dict) or data.get("resourceType") != "Bundle":
        raise ValueError(f"Unexpected validator output (not a Bundle): {bundle_path}")

    results: dict[str, dict[str, int | bool]] = {}
    for entry in data.get("entry", []) or []:
        resource = (entry or {}).get("resource") or {}
        if resource.get("resourceType") != "OperationOutcome":
            continue

        file_path: Optional[str] = None
        for ext in resource.get("extension", []) or []:
            if (ext or {}).get("url") == "http://hl7.org/fhir/StructureDefinition/operationoutcome-file":
                file_path = ext.get("valueString") or ext.get("valueUri") or ext.get("valueUrl")
                break

        issues = resource.get("issue", []) or []
        errors = sum(1 for i in issues if (i or {}).get("severity") in ("fatal", "error"))
        warnings = sum(1 for i in issues if (i or {}).get("severity") == "warning")

        # If we can't determine a file, still keep a record under a synthetic key.
        key = file_path or f"<unknown:{len(results)}>"
        results[key] = {
            "ok": errors == 0,
            "errors": errors,
            "warnings": warnings,
        }

    return results


def run_validator(cmd: list[str], working_dir: Path) -> subprocess.CompletedProcess[str]:
    """Execute the validator command and return the completed process."""
    return subprocess.run(
        cmd,
        cwd=str(working_dir),
        capture_output=True,
        text=True,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("resources", nargs="+", type=Path, help="Path(s) to carbon copy JSON resources")
    parser.add_argument("--profile", default=DEFAULT_PROFILE, help="Canonical profile to validate against")
    parser.add_argument("--hapi-jar", default=str(DEFAULT_HAPI_JAR), help="Path to the HAPI validator JAR")
    parser.add_argument("--fhir-version", default=DEFAULT_FHIR_VERSION, help="FHIR version for validation")
    parser.add_argument(
        "--summary-json",
        type=Path,
        default=None,
        help="Optional path to write per-file validation results as JSON",
    )

    args = parser.parse_args()
    resource_paths: list[Path] = [p.resolve() for p in args.resources]
    jar_path = Path(args.hapi_jar).expanduser().resolve()

    missing = [p for p in resource_paths if not p.exists()]
    if missing:
        for p in missing:
            print(f"❌ Error: Resource not found: {p}")
        return 1

    if not jar_path.exists():
        print(f"❌ Error: HAPI validator not found: {jar_path}")
        return 1

    script_dir = Path(__file__).parent
    project_root = script_dir.parent.parent

    with tempfile.NamedTemporaryFile("w", delete=False, suffix=".json") as tmp:
        output_bundle_path = Path(tmp.name)

    cmd = build_command(
        jar_path,
        resource_paths,
        args.profile,
        args.fhir_version,
        output_bundle=output_bundle_path,
    )

    print("🔍 Validating carbon copy resources against profile…")
    print(f"   Count:    {len(resource_paths)}")
    print(f"   Profile:  {args.profile}\n")

    result = run_validator(cmd, project_root)

    if result.stdout:
        print("📋 STDOUT:")
        print(result.stdout)

    if result.stderr:
        print("\n📋 STDERR:")
        print(result.stderr)

    # Parse output bundle for per-file result mapping.
    try:
        per_file = parse_validation_bundle(output_bundle_path)
    except Exception as exc:  # noqa: BLE001
        print(f"❌ Failed to parse validator output bundle: {exc}")
        return result.returncode or 1
    finally:
        try:
            output_bundle_path.unlink(missing_ok=True)
        except TypeError:
            # Python < 3.8 compatibility
            if output_bundle_path.exists():
                output_bundle_path.unlink()

    any_failed = False
    for p in resource_paths:
        key = str(p)
        info = per_file.get(key)
        if info is None:
            any_failed = True
            print(f"✗ {p.name}: no result returned")
            continue

        if bool(info["ok"]):
            print(f"✓ {p.name}")
        else:
            any_failed = True
            print(f"✗ {p.name} (errors={info['errors']}, warnings={info['warnings']})")

    if args.summary_json is not None:
        args.summary_json.parent.mkdir(parents=True, exist_ok=True)
        args.summary_json.write_text(json.dumps(per_file, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    if not any_failed and result.returncode == 0:
        print("✅ Validation successful")
        return 0

    print("❌ Validation failed")
    return 1


if __name__ == "__main__":
    sys.exit(main())
