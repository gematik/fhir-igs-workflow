"""CLI entry point and pipeline orchestration for error code consistency checks."""

from __future__ import annotations

import argparse
import csv
import sys
from pathlib import Path
from typing import Dict, Iterable, Set

from .checks import (
    check_capabilitystatement_consistency,
    check_cs_vs_consistency,
    check_description_consistency,
    check_module_codesystem_placement,
    check_orphaned_codes,
    check_requirements_missing_keys,
    check_valueset_import_descriptions,
)
from .fixes import (
    fix_capstat,
    fix_cs_vs,
    fix_description_mismatches,
    fix_module_codesystem_placement,
    fix_orphaned_codes,
    fix_valueset_import_descriptions,
)
from .models import Finding
from .parsing import extract_error_codes_from_requirements

MAX_FIX_PASSES = 3


def find_ig_roots(root_dir: Path = Path("igs")) -> Dict[str, Path]:
    """Discover IG directories under root_dir."""
    ig_roots: Dict[str, Path] = {}
    if not root_dir.exists():
        return ig_roots
    for ig_dir in root_dir.iterdir():
        if ig_dir.is_dir() and (ig_dir / "input").exists():
            ig_roots[ig_dir.name] = ig_dir
    return ig_roots


def _find_ig_roots_from_req_files(req_files: list[Path]) -> Dict[str, Path]:
    """Infer IG roots from discovered requirement files.

    Supports absolute target paths where the process cwd is not the repository root.
    """
    ig_roots: Dict[str, Path] = {}
    igs_dirs: set[Path] = set()
    for req_file in req_files:
        parts = req_file.parts
        try:
            idx = parts.index("igs")
        except ValueError:
            continue
        igs_dirs.add(Path(*parts[: idx + 1]))
        if idx + 1 >= len(parts):
            continue
        module = parts[idx + 1]
        ig_root = Path(*parts[: idx + 2])
        if (ig_root / "input").exists():
            ig_roots[module] = ig_root
    # Merge in all sibling IGs under inferred igs directories (e.g. include core when scanning rx only).
    for igs_dir in igs_dirs:
        ig_roots.update(find_ig_roots(igs_dir))
    return ig_roots


def iter_requirement_files(targets: Iterable[str]) -> Iterable[Path]:
    """Yield all relevant pagecontent .md files from the given target paths/globs."""
    if not targets:
        targets = ["igs/*/input/pagecontent"]

    def _is_pagecontent_md(path: Path) -> bool:
        if not path.is_file() or path.suffix.lower() != ".md":
            return False
        parts = path.as_posix().split("/")
        return (
            len(parts) >= 4
            and parts[-2] == "pagecontent"
            and parts[-3] == "input"
        )

    def _yield_pagecontent_md(scan_dir: Path, seen: Set[Path]) -> Iterable[Path]:
        for md_file in scan_dir.rglob("*.md"):
            if not _is_pagecontent_md(md_file):
                continue
            resolved = md_file.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield md_file

    seen: Set[Path] = set()
    for target in targets:
        path = Path(target)

        if any(ch in target for ch in "*?[]"):
            for matched in Path(".").glob(target):
                if _is_pagecontent_md(matched):
                    resolved = matched.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield matched
                elif matched.is_dir():
                    yield from _yield_pagecontent_md(matched, seen)
            continue

        if _is_pagecontent_md(path):
            resolved = path.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield path
            continue

        if path.is_dir():
            scan_dir = (path / "input" / "pagecontent") if (path / "input" / "pagecontent").is_dir() else path
            yield from _yield_pagecontent_md(scan_dir, seen)


def _write_csv(csv_path: Path, findings: list, req_files: list, error_codes: list) -> None:
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", encoding="utf-8", newline="") as fp:
        writer = csv.writer(fp)
        writer.writerow(["type", "ig_module", "file", "line", "code", "requirement_key", "message"])
        for f in findings:
            writer.writerow(
                [f.type, f.ig_module, str(f.file_path), f.line, f.code, f.requirement_key, f.message]
            )
        writer.writerow(
            [
                "SUMMARY", "", "", "", "", "",
                (
                    f"Scanned {len(req_files)} requirement file(s), "
                    f"extracted {len(error_codes)} error code(s), "
                    f"found {len(findings)} issue(s)."
                ),
            ]
        )


def _run_all_checks(error_codes, ig_roots, include_extra: bool) -> list:
    findings = []
    findings.extend(check_cs_vs_consistency(error_codes, ig_roots))
    findings.extend(
        check_capabilitystatement_consistency(error_codes, ig_roots, include_extra=include_extra)
    )
    findings.extend(check_description_consistency(ig_roots))
    findings.extend(check_valueset_import_descriptions(ig_roots))
    findings.extend(check_module_codesystem_placement(ig_roots))
    findings.extend(check_orphaned_codes(error_codes, ig_roots))
    return findings


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Check consistency of error codes in requirements, "
            "CodeSystem/ValueSet, and CapabilityStatement."
        )
    )
    parser.add_argument(
        "targets",
        nargs="*",
        help="Files/directories to scan (default: igs/*/input/pagecontent)",
    )
    parser.add_argument(
        "--fix",
        action="store_true",
        help=(
            "Auto-fix MISSING_IN_CS, MISSING_IMPORT, CAPSTAT_ENDPOINT_NOT_MAPPED, "
            "CAPSTAT_MISSING_CODE, DESCRIPTION_MISMATCH, and misplaced module codes"
        ),
    )
    parser.add_argument(
        "--report-capstat-extra",
        action="store_true",
        help="Also report CAPSTAT_EXTRA_CODE findings (off by default to avoid baseline noise)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/error-code-consistency-report.csv",
        help="Write CSV report to this file (default: qa/error-code-consistency-report.csv)",
    )
    args = parser.parse_args()

    req_files = list(iter_requirement_files(args.targets))
    if not req_files:
        print("No requirement files found for the given targets.")
        return 1

    # Gate: abort early if any requirement is missing a key attribute
    missing_key_findings = check_requirements_missing_keys(req_files)
    if missing_key_findings:
        csv_path = Path(args.output_csv)
        csv_path.parent.mkdir(parents=True, exist_ok=True)
        with csv_path.open("w", encoding="utf-8", newline="") as fp:
            writer = csv.writer(fp)
            writer.writerow(["type", "ig_module", "file", "line", "code", "requirement_key", "message"])
            for f in missing_key_findings:
                writer.writerow(
                    [f.type, f.ig_module, str(f.file_path), f.line, f.code, f.requirement_key, f.message]
                )
            writer.writerow(
                [
                    "SUMMARY", "", "", "", "", "",
                    (
                        f"Scanned {len(req_files)} requirement file(s), "
                        f"found {len(missing_key_findings)} missing requirement key(s). "
                        "Aborted before consistency checks."
                    ),
                ]
            )
        print("\n==> Requirement Validation")
        print(f"Scanned: {len(req_files)} requirement file(s)")
        print(f"Errors: {len(missing_key_findings)}")
        print("\nRequirements missing keys:")
        for f in missing_key_findings:
            print(f"  [{f.type}] {f.file_path}:{f.line} - {f.message}")
        print(f"\nCSV report written to: {csv_path}")
        print("\nAborting before consistency checks due to missing requirement keys.")
        return 1

    error_codes = extract_error_codes_from_requirements(req_files)
    if not error_codes:
        print("No error codes found in requirement files.")
        return 0

    ig_roots = find_ig_roots()
    if not ig_roots:
        ig_roots = _find_ig_roots_from_req_files(req_files)
    if not ig_roots:
        print("Warning: No IG roots found in 'igs/' directory.")
        return 1

    findings = _run_all_checks(error_codes, ig_roots, args.report_capstat_extra)

    if args.fix and findings:
        print("\n==> Applying auto-fixes...")
        for _pass in range(MAX_FIX_PASSES):
            applied = 0
            applied += fix_cs_vs(findings, ig_roots, error_codes)
            applied += fix_capstat(findings, ig_roots, error_codes)
            applied += fix_description_mismatches(findings, ig_roots)
            applied += fix_valueset_import_descriptions(findings, ig_roots)
            applied += fix_module_codesystem_placement(findings, ig_roots)
            applied += fix_orphaned_codes(findings, ig_roots)

            print("\nRe-running checks after fixes...")
            findings = _run_all_checks(error_codes, ig_roots, args.report_capstat_extra)

            if not findings or applied == 0:
                break

    csv_path = Path(args.output_csv)
    _write_csv(csv_path, findings, req_files, error_codes)

    print("\n==> Error Code Consistency Check")
    print(f"Scanned: {len(req_files)} requirement file(s)")
    print(f"Extracted: {len(error_codes)} error code(s)")
    print(f"Issues: {len(findings)}")
    if findings:
        print("\nIssues found:")
        for f in findings:
            print(f"  [{f.type}] {f.file_path}:{f.line} {f.requirement_key}: {f.code} - {f.message}")
    print(f"\nCSV report written to: {csv_path}")

    return 1 if findings else 0
