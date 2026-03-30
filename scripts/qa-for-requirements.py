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
    parser.add_argument(
        "--errors",
        action="store_true",
        help="Run only the error code consistency routine (skip IG tools and quality checks)",
    )
    parser.add_argument(
        "--errors-fix",
        action="store_true",
        help="Run only the error code consistency routine with --fix (implies --errors)",
    )
    args = parser.parse_args()

    if args.errors_fix:
        args.errors = True
    if args.errors and args.skip_error_codes:
        parser.error("--errors cannot be combined with --skip-error-codes")

    scripts_dir = Path(__file__).resolve().parent / "requirement-qa"
    repo_root = Path(__file__).resolve().parent.parent
    quality_script = scripts_dir / "check_requirement_quality.py"

    root_arg = Path(args.root)
    error_root = str(root_arg if root_arg.is_absolute() else (repo_root / root_arg).resolve())
    error_csv = str((repo_root / args.error_code_output_csv).resolve())

    print("Running requirements QA pipeline")
    print(f"- Root: {args.root}")

    step_results: list[tuple[str, str]] = []

    def run_and_record(
        summary_title: str,
        command_title: str,
        command: list[str],
        *,
        strict: bool,
        cwd: Path | None = None,
    ) -> int:
        try:
            rc = run_step(command_title, command, strict=strict, cwd=cwd)
        except subprocess.CalledProcessError:
            step_results.append(("FAIL", summary_title))
            raise
        step_results.append(("OK" if rc == 0 else "WARN", summary_title))
        return rc

    quality_rc = 0
    error_code_rc = 0

    if args.errors:
        error_code_cmd = [
            sys.executable,
            "-m",
            "error_code_consistency",
            error_root,
            "--output-csv",
            error_csv,
        ]
        if args.errors_fix or args.fix:
            error_code_cmd.append("--fix")
        error_code_rc = run_and_record(
            "Check error code consistency",
            "Check error code consistency",
            error_code_cmd,
            strict=args.strict_error_codes,
            cwd=scripts_dir,
        )
    else:
        run_and_record(
            "Run IG Tools",
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

        quality_rc = run_and_record(
            "Check requirement quality",
            "Check requirement quality",
            quality_cmd,
            strict=args.strict_quality,
        )

        if not args.skip_error_codes:
            error_code_cmd = [
                sys.executable,
                "-m",
                "error_code_consistency",
                error_root,
                "--output-csv",
                error_csv,
            ]
            if args.fix:
                error_code_cmd.append("--fix")
            error_code_rc = run_and_record(
                "Check error code consistency",
                "Check error code consistency",
                error_code_cmd,
                strict=args.strict_error_codes,
                cwd=scripts_dir,
            )
        else:
            step_results.append(("SKIP", "Check error code consistency"))

    print("\nPipeline summary")
    for status, title in step_results:
        print(f"[{status}] {title}")
    print(f"- Quality CSV: {args.quality_output_csv}")
    print(f"- Error Code CSV: {error_csv}")
    if quality_rc != 0 and not args.strict_quality:
        print("- Quality issues were found (non-strict mode, pipeline continued)")
    if error_code_rc != 0 and not args.strict_error_codes:
        print("- Error code consistency issues were found (non-strict mode, pipeline continued).")


if __name__ == "__main__":
    main()
