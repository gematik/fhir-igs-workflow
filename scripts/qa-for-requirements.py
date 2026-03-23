#!/usr/bin/env python3
"""Run requirement QA pipeline:

1. Check requirement quality.
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
        description="Run requirement QA (quality checks)."
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="Root folder that contains IG folders (default: igs)",
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
    quality_script = scripts_dir / "check_requirement_quality.py"

    print("Running requirements QA pipeline")
    print(f"- Root: {args.root}")

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
    print(f"- Quality CSV: {args.quality_output_csv}")
    if quality_rc != 0 and not args.strict_quality:
        print("- Quality issues were found (non-strict mode, pipeline continued).")


if __name__ == "__main__":
    main()
