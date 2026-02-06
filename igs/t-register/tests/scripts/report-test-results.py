#!/usr/bin/env python3
"""Generate a lightweight Markdown table for StructureMap test runs.

For each test case, reports whether:
- mapping bundle generation succeeded
- transform succeeded
- validation succeeded (based on validation summary JSON)

This script is intentionally lightweight: it infers build/transform success from
expected output file existence.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Optional


def load_validation_summary(path: Optional[Path]) -> dict[str, dict]:
    if path is None or not path.exists():
        return {}
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        return {}


def mark(ok: bool) -> str:
    return "✓" if ok else "✗"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--test-cases-dir", type=Path, default=Path(__file__).parent.parent / "test-cases")
    parser.add_argument("--output-dir", type=Path, default=Path(__file__).parent.parent / "output")
    parser.add_argument(
        "--validation-summary",
        type=Path,
        default=None,
        help="Path to validation summary JSON produced by validate-carbon-copy.py --summary-json",
    )
    args = parser.parse_args()

    test_cases_dir: Path = args.test_cases_dir
    output_dir: Path = args.output_dir

    test_cases = sorted([p for p in test_cases_dir.iterdir() if p.is_dir()])
    validation = load_validation_summary(args.validation_summary)

    rows: list[tuple[str, bool, bool, Optional[bool]]] = []
    for case_dir in test_cases:
        name = case_dir.name
        case_out = output_dir / name
        bundle_path = case_out / f"{name}-mapping-bundle.json"
        dd_path = case_out / f"{name}-digitaler-durchschlag.json"

        build_ok = bundle_path.exists()
        transform_ok = dd_path.exists()

        validate_ok: Optional[bool]
        if not validation:
            validate_ok = None
        else:
            info = validation.get(str(dd_path))
            validate_ok = bool(info.get("ok")) if isinstance(info, dict) else False

        rows.append((name, build_ok, transform_ok, validate_ok))

    print("| Testcase | mapping bundle generation | transform | validate |")
    print("|---|---:|---:|---:|")
    for name, build_ok, transform_ok, validate_ok in rows:
        if validate_ok is None:
            validate_cell = "-"
        else:
            validate_cell = mark(validate_ok)

        print(f"| {name} | {mark(build_ok)} | {mark(transform_ok)} | {validate_cell} |")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
