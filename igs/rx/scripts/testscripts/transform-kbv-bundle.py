#!/usr/bin/env python3
"""Transform KBV eRezept Bundles into Provide-Prescription Parameters.

This script wraps the HAPI FHIR validator transformation CLI to execute the
StructureMap `KBVPrErpBundle-to-ProvidePrescriptionParameters` against a given
KBV_PR_ERP_Bundle JSON example. The output is a Parameters resource that can be
used as ERP input for the EPA provide-prescription operation.

Usage:
    python transform-kbv-bundle.py <kbv-bundle.json> <output-file.json>

Optional environment variables:
    HAPI_VALIDATOR_JAR   Override path of the HAPI validator jar
"""
#TODO: set subject manually in MedicationDispense

from __future__ import annotations

import argparse
import os
import subprocess
import sys
from pathlib import Path

DEFAULT_TRANSFORM_URL = (
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpBundleMap"
)
DEFAULT_HAPI_JAR = Path.home() / "dev" / "validators" / "current_hapi_validator.jar"
LEGACY_HAPI_JAR = Path.home() / "dev" / "validators" / "hapi_validator_6_5_26.jar"
FHIR_VERSION = "4.0.1"


def resolve_hapi_jar(explicit: Path | None) -> Path:
    """Return the path to the HAPI validator jar, ensuring it exists."""

    script_path = Path(__file__).resolve()
    ig_root = script_path.parents[2]
    repo_root = script_path.parents[4]
    candidates: list[Path] = []

    if explicit:
        candidates.append(explicit.expanduser())

    env_value = os.environ.get("HAPI_VALIDATOR_JAR")
    if env_value:
        candidates.append(Path(env_value).expanduser())

    candidates.extend(
        [
            # Prefer a pinned validator first because newer releases regress on
            # snapshot generation for some DE Basisprofil artifacts.
            repo_root / "input-cache" / "hapi_validator_6_5_26.jar",
            ig_root / "input-cache" / "hapi_validator_6_5_26.jar",
            LEGACY_HAPI_JAR,
            repo_root / "input-cache" / "current_hapi_validator.jar",
            ig_root / "input-cache" / "current_hapi_validator.jar",
            DEFAULT_HAPI_JAR,
        ]
    )

    for candidate in candidates:
        if candidate and candidate.exists():
            return candidate

    print("❌ Kein HAPI-Validator gefunden. Setze HAPI_VALIDATOR_JAR oder übergebe --hapi-jar.", file=sys.stderr)
    print("   Geprüfte Pfade:", file=sys.stderr)
    for candidate in candidates:
        print(f"   - {candidate}", file=sys.stderr)
    sys.exit(1)


def build_commands(
    hapi_jar: Path,
    kbv_bundle: Path,
    output_file: Path,
    transform_url: str,
    project_root: Path,
) -> tuple[list[str], list[str]]:
    """Construct modern and legacy java commands for transformation."""

    cmd_modern: list[str] = [
        "java",
        "-jar",
        str(hapi_jar),
        "transform",
        transform_url,
        str(kbv_bundle),
        "-version",
        FHIR_VERSION,
        "-output",
        str(output_file),
    ]

    cmd_legacy: list[str] = [
        "java",
        "-jar",
        str(hapi_jar),
        str(kbv_bundle),
        "-transform",
        transform_url,
        "-version",
        FHIR_VERSION,
        "-output",
        str(output_file),
    ]

    local_igs = [
        project_root / "input" / "content" / "structuremaps",
        project_root / "input" / "resources" / "structuremaps",
        project_root / "input" / "resources",
        project_root / "fsh-generated" / "resources",
    ]
    package_igs = [
        "de.gematik.erezept-workflow.r4",
        "kbv.ita.erp",
        "de.gematik.fhir.directory",
        "de.gematik.ti",
        "de.basisprofil.r4#1.5.4",
        "de.gematik.epa.medication",
    ]

    for ig_dir in local_igs:
        if ig_dir.exists():
            cmd_modern.extend(["-ig", str(ig_dir)])
            cmd_legacy.extend(["-ig", str(ig_dir)])

    for package in package_igs:
        cmd_modern.extend(["-ig", package])
        cmd_legacy.extend(["-ig", package])

    return cmd_modern, cmd_legacy


def run_transform(commands: tuple[list[str], list[str]], project_root: Path) -> subprocess.CompletedProcess[str]:
    """Execute transform with modern syntax first and fallback to legacy."""

    cmd_modern, cmd_legacy = commands

    print("🚀 Starte Provide-Prescription-Transformation …")
    print("   Kommando (modern):", " ".join(cmd_modern))
    result = subprocess.run(cmd_modern, capture_output=True, text=True, cwd=str(project_root))
    if result.returncode == 0:
        return result

    print("⚠️ Moderner Transform-Aufruf fehlgeschlagen, versuche Legacy-Syntax …", file=sys.stderr)
    print("   Kommando (legacy):", " ".join(cmd_legacy), file=sys.stderr)
    legacy_result = subprocess.run(cmd_legacy, capture_output=True, text=True, cwd=str(project_root))

    # Keep output from both runs for easier CI troubleshooting.
    combined_stdout = ""
    if result.stdout:
        combined_stdout += "[modern]\n" + result.stdout + "\n"
    if legacy_result.stdout:
        combined_stdout += "[legacy]\n" + legacy_result.stdout

    combined_stderr = ""
    if result.stderr:
        combined_stderr += "[modern]\n" + result.stderr + "\n"
    if legacy_result.stderr:
        combined_stderr += "[legacy]\n" + legacy_result.stderr

    return subprocess.CompletedProcess(
        args=legacy_result.args,
        returncode=legacy_result.returncode,
        stdout=combined_stdout,
        stderr=combined_stderr,
    )


def load_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Transformiert KBV Bundles zu Provide-Prescription-Parameters")
    parser.add_argument("kbv_bundle", type=Path, help="Pfad zur KBV Bundle JSON-Datei")
    parser.add_argument("output", type=Path, help="Zieldatei für die Parameters-Ressource")
    parser.add_argument("--transform", default=DEFAULT_TRANSFORM_URL, help="Canonical URL der StructureMap")
    parser.add_argument("--hapi-jar", type=Path, default=None, help="Pfad zum HAPI Validator Jar")
    return parser.parse_args()


def main() -> int:
    args = load_args()

    kbv_bundle: Path = args.kbv_bundle.resolve()
    output_file: Path = args.output.resolve()

    if not kbv_bundle.exists():
        print(f"❌ KBV-Bundle nicht gefunden: {kbv_bundle}", file=sys.stderr)
        return 1

    output_file.parent.mkdir(parents=True, exist_ok=True)

    project_root = Path(__file__).resolve().parents[2]
    hapi_jar = resolve_hapi_jar(args.hapi_jar)

    commands = build_commands(hapi_jar, kbv_bundle, output_file, args.transform, project_root)
    result = run_transform(commands, project_root)

    if result.stdout:
        print("\n📋 STDOUT:\n", result.stdout)
    if result.stderr:
        print("\n📋 STDERR:\n", result.stderr, file=sys.stderr)

    if result.returncode != 0:
        print(f"❌ Transformation fehlgeschlagen (Exit {result.returncode}).", file=sys.stderr)
        return result.returncode

    if not output_file.exists():
        print("❌ Keine Ausgabedatei erzeugt.", file=sys.stderr)
        return 1

    print(f"\n✅ Erfolg: {output_file} ({output_file.stat().st_size:,} Bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
