#!/usr/bin/env python3
"""Cross-check pagecontent files against sushi-config pages entries for each IG.

Reports:
- files present in igs/<ig>/input/pagecontent but missing in sushi-config pages
- files listed in sushi-config pages but missing in input/pagecontent
"""

from __future__ import annotations

import argparse
import csv
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Set

PAGES_HEADER_RE = re.compile(r"^(?P<indent>\s*)pages\s*:\s*(?:#.*)?$")
PAGE_KEY_RE = re.compile(r'^\s*(?P<key>"?[A-Za-z0-9._\-/]+\.md"?)\s*:\s*(?:#.*)?$')


@dataclass
class Finding:
    ig: str
    status: str
    page: str
    detail: str


def parse_sushi_pages_keys(config_path: Path) -> Set[str]:
    text = config_path.read_text(encoding="utf-8")
    lines = text.splitlines()

    pages_indent: int | None = None
    in_pages = False
    keys: Set[str] = set()

    for raw_line in lines:
        # Skip full-line comments and empty lines.
        stripped = raw_line.strip()
        if not stripped or stripped.startswith("#"):
            continue

        if not in_pages:
            m = PAGES_HEADER_RE.match(raw_line)
            if not m:
                continue
            in_pages = True
            pages_indent = len(m.group("indent"))
            continue

        current_indent = len(raw_line) - len(raw_line.lstrip(" "))
        if pages_indent is not None and current_indent <= pages_indent:
            break

        key_match = PAGE_KEY_RE.match(raw_line)
        if not key_match:
            continue

        key = key_match.group("key").strip().strip('"').strip("'")
        if key.endswith(".md"):
            keys.add(Path(key).name)

    return keys


def collect_pagecontent_files(ig_dir: Path) -> Set[str]:
    page_root = ig_dir / "input" / "pagecontent"
    if not page_root.is_dir():
        return set()
    return {path.name for path in page_root.rglob("*.md")}


def write_report(path: Path, findings: List[Finding]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["ig", "status", "page", "detail"])
        for f in findings:
            writer.writerow([f.ig, f.status, f.page, f.detail])


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Cross-check pagecontent markdown files with sushi-config pages entries."
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="Root folder containing IG directories (default: igs)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/sushi-pages-crosscheck.csv",
        help="Output CSV path (default: qa/sushi-pages-crosscheck.csv)",
    )
    args = parser.parse_args()

    root = Path(args.root)
    if not root.is_dir():
        raise FileNotFoundError(f"IG root not found: {root}")

    findings: List[Finding] = []
    ig_dirs = sorted(path for path in root.iterdir() if path.is_dir())

    for ig_dir in ig_dirs:
        ig_name = ig_dir.name
        config_path = ig_dir / "sushi-config.yaml"
        if not config_path.exists():
            findings.append(Finding(ig_name, "config-missing", "", "sushi-config.yaml not found"))
            continue

        page_files = collect_pagecontent_files(ig_dir)
        page_keys = parse_sushi_pages_keys(config_path)

        missing_in_config = sorted(page_files - page_keys)
        missing_in_files = sorted(page_keys - page_files)

        for page in missing_in_config:
            findings.append(
                Finding(
                    ig=ig_name,
                    status="missing-in-config",
                    page=page,
                    detail="exists in input/pagecontent but not listed under pages",
                )
            )

        for page in missing_in_files:
            findings.append(
                Finding(
                    ig=ig_name,
                    status="missing-file",
                    page=page,
                    detail="listed under pages but file not found in input/pagecontent",
                )
            )

    output_csv = Path(args.output_csv)
    write_report(output_csv, findings)

    print(f"Checked {len(ig_dirs)} IG(s), findings: {len(findings)}")
    print(f"CSV report written to: {output_csv}")

    return 1 if findings else 0


if __name__ == "__main__":
    raise SystemExit(main())
