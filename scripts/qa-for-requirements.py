#!/usr/bin/env python3
"""Run requirement QA pipeline:

1. Check requirement quality.
2. Check error code consistency.
"""

import argparse
import subprocess
import sys
from pathlib import Path


def run_step(
    title: str,
    command: list[str],
    strict: bool = True,
    cwd: Path | None = None,
) -> int:
    print(f"\n==> {title}")
    if cwd is not None:
        print(f"$ (cd {cwd} && {' '.join(command)})")
    else:
        print("$ " + " ".join(command))
    result = subprocess.run(command, check=False, cwd=cwd)
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
        "--fix",
        action="store_true",
        help="Apply automatic fixes for all issues (implies --quality-fix and fixes error codes/CapabilityStatement)",
    )
    parser.add_argument(
        "--quality-fix",
        action="store_true",
        help="Apply automatic safe fixes during quality checks only",
    )
    parser.add_argument(
        "--strict-quality",
        action="store_true",
        help="Fail the pipeline when quality check reports issues",
    )
    parser.add_argument(
        "--error-code-output-csv",
        default="qa/error-code-consistency-report.csv",
        help="Path to error code consistency CSV report (default: qa/error-code-consistency-report.csv)",
    )
    parser.add_argument(
        "--skip-error-codes",
        action="store_true",
        help="Skip error code consistency checks",
    )
    parser.add_argument(
        "--strict-error-codes",
        action="store_true",
        help="Fail the pipeline when error code check reports issues",
    )
    args = parser.parse_args()

    scripts_dir = Path(__file__).resolve().parent / "requirement-qa"
    repo_root = Path(__file__).resolve().parent.parent
    quality_script = scripts_dir / "check_requirement_quality.py"
    error_code_script = scripts_dir / "check_error_code_consistency.py"

    print("Running requirements QA pipeline")
    print(f"- Root: {args.root}")

    run_step(
        "Run igtools process for all IGs",
        ["./all", "igtools", "process"],
        strict=True,
        cwd=repo_root,
    )

    quality_cmd = [
        sys.executable,
        str(quality_script),
        args.root,
        "--output-csv",
        args.quality_output_csv,
    ]
    if args.quality_fix or args.fix:
        quality_cmd.append("--fix")

    quality_rc = run_step(
        "Check requirement quality",
        quality_cmd,
        strict=args.strict_quality,
    )

    error_code_rc = 0
    if not args.skip_error_codes:
        error_code_cmd = [
            sys.executable,
            str(error_code_script),
            args.root,
            "--output-csv",
            args.error_code_output_csv,
        ]
        if args.fix:
            error_code_cmd.append("--fix")
        error_code_rc = run_step(
            "Check error code consistency",
            error_code_cmd,
            strict=args.strict_error_codes,
        )

    print("\nPipeline summary")
    print(f"- Quality CSV: {args.quality_output_csv}")
    print(f"- Error Code CSV: {args.error_code_output_csv}")
    if quality_rc != 0 and not args.strict_quality:
        print("- Quality issues were found (non-strict mode, pipeline continued)")
    if error_code_rc != 0 and not args.strict_error_codes:
        print("- Error code consistency issues were found (non-strict mode, pipeline continued).")


if __name__ == "__main__":
    main()
