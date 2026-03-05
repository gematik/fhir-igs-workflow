#!/usr/bin/env python3
"""Run requirement QA pipeline: generate mapping first, then verify mapping."""

import argparse
import subprocess
import sys
from pathlib import Path


def run_step(command: list[str]) -> None:
    subprocess.run(command, check=True)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Run requirement QA (generate mapping + verify coverage)."
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
    args = parser.parse_args()

    scripts_dir = Path(__file__).resolve().parent / "requirement-qa"
    generate_script = scripts_dir / "generate_requirement_mapping.py"
    verify_script = scripts_dir / "verify_requirement_mapping.py"

    run_step(
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

    run_step(verify_cmd)


if __name__ == "__main__":
    main()
