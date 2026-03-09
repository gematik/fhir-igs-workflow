#!/usr/bin/env python3
"""Run requirement QA pipeline:

1. Generate requirement mapping.
2. Verify mapping coverage.
3. Check requirement quality.
"""

import argparse
import subprocess
import sys
from pathlib import Path


def run_step(
    title: str,
    command: list[str],
    strict: bool = True,
) -> int:
    print(f"\n==> {title}")
    print("$ " + " ".join(command))
    result = subprocess.run(command, check=False)
    if strict and result.returncode != 0:
        raise subprocess.CalledProcessError(result.returncode, command)
    if result.returncode == 0:
        print(f"[OK] {title}")
    else:
        print(f"[WARN] {title} finished with exit code {result.returncode}")
    return result.returncode


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Run requirement QA (generate + verify + quality checks)."
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="Root folder that contains IG folders (default: igs)",
    )
    parser.add_argument(
        "--xlsx-dir",
        default=".temp",
        help="Directory containing requirement Excel files (default: .temp)",
    )
    parser.add_argument(
        "--mapping",
        default="qa/requirement-mapping.json",
        help="Path to requirement-mapping.json (default: qa/requirement-mapping.json)",
    )
    parser.add_argument(
        "--output-dir",
        default="qa",
        help="Directory to write CSV reports (default: qa)",
    )
    parser.add_argument(
        "--description",
        action="store_true",
        help="Include requirement content/description in output CSV files",
    )
    parser.add_argument(
        "--ptsb",
        action="store_true",
        help="Only use gemProdT*.xlsx files and parse requirements from sheet 'Festlegungen'",
    )
    parser.add_argument(
        "--quality-output-csv",
        default="qa/requirement-quality-report.csv",
        help="Path to quality CSV report (default: qa/requirement-quality-report.csv)",
    )
    parser.add_argument(
        "--quality-fix",
        action="store_true",
        help="Apply automatic safe fixes during quality checks",
    )
    parser.add_argument(
        "--strict-quality",
        action="store_true",
        help="Fail the pipeline when quality check reports issues",
    )
    args = parser.parse_args()

    scripts_dir = Path(__file__).resolve().parent / "requirement-qa"
    generate_script = scripts_dir / "generate_requirement_mapping.py"
    verify_script = scripts_dir / "verify_requirement_mapping.py"
    quality_script = scripts_dir / "check_requirement_quality.py"

    print("Running requirements QA pipeline")
    print(f"- Root: {args.root}")
    print(f"- XLSX dir: {args.xlsx_dir}")
    print(f"- Mode: {'PTSB' if args.ptsb else 'default'}")

    run_step(
        "Generate requirement mapping",
        [
            sys.executable,
            str(generate_script),
            "--root",
            args.root,
            "--output",
            args.mapping,
        ]
    )

    verify_cmd = [
        sys.executable,
        str(verify_script),
        "--xlsx-dir",
        args.xlsx_dir,
        "--mapping",
        args.mapping,
        "--output-dir",
        args.output_dir,
    ]
    if args.description:
        verify_cmd.append("--description")
    if args.ptsb:
        verify_cmd.append("--ptsb")

    run_step("Verify requirement mapping coverage", verify_cmd)

    quality_cmd = [
        sys.executable,
        str(quality_script),
        args.root,
        "--output-csv",
        args.quality_output_csv,
    ]
    if args.quality_fix:
        quality_cmd.append("--fix")

    quality_rc = run_step(
        "Check requirement quality",
        quality_cmd,
        strict=args.strict_quality,
    )

    print("\nPipeline summary")
    print(f"- Mapping JSON: {args.mapping}")
    print(f"- Missing CSV: {Path(args.output_dir) / 'requirement-mapping-missing.csv'}")
    print(f"- Duplicate CSV: {Path(args.output_dir) / 'requirement-mapping-duplicate.csv'}")
    print(f"- Quality CSV: {args.quality_output_csv}")
    if quality_rc != 0 and not args.strict_quality:
        print("- Quality issues were found (non-strict mode, pipeline continued).")


if __name__ == "__main__":
    main()
