#!/usr/bin/env python3
"""Report or remove duplicate requirement key attributes in markdown files.

Scans only: igs/*/input/pagecontent/**/*.md
Behavior:
- First occurrence of a requirement key is kept.
- Later occurrences of the same key are reported.
- With --remove, later occurrences have the key attribute removed.
"""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List

REQ_OPEN_RE = re.compile(r"<requirement\b(?P<attrs>[^>]*)>", re.IGNORECASE | re.DOTALL)
KEY_CAPTURE_RE = re.compile(r"\bkey\s*=\s*(?:\"([^\"]*)\"|'([^']*)')", re.IGNORECASE)
KEY_REMOVE_RE = re.compile(r"\s+\bkey\s*=\s*(?:\"[^\"]*\"|'[^']*')", re.IGNORECASE)


@dataclass
class KeyOccurrence:
    file_path: Path
    line: int


@dataclass
class Removal:
    file_path: Path
    line: int
    key: str
    first_seen: KeyOccurrence


def collect_markdown_files(root: Path) -> List[Path]:
    return sorted(root.glob("*/input/pagecontent/**/*.md"))


def line_for_offset(content: str, offset: int) -> int:
    return content.count("\n", 0, offset) + 1


def process_file(path: Path, seen: Dict[str, KeyOccurrence], remove: bool) -> tuple[str, List[Removal]]:
    content = path.read_text(encoding="utf-8")
    removals: List[Removal] = []

    def replace(match: re.Match[str]) -> str:
        attrs = match.group("attrs")
        key_match = KEY_CAPTURE_RE.search(attrs)
        if not key_match:
            return match.group(0)

        key = key_match.group(1) if key_match.group(1) is not None else key_match.group(2)
        if not key:
            return match.group(0)

        line = line_for_offset(content, match.start())

        if key not in seen:
            seen[key] = KeyOccurrence(file_path=path, line=line)
            return match.group(0)

        removals.append(
            Removal(
                file_path=path,
                line=line,
                key=key,
                first_seen=seen[key],
            )
        )

        if not remove:
            return match.group(0)

        new_attrs = KEY_REMOVE_RE.sub("", attrs, count=1)
        if new_attrs == attrs:
            return match.group(0)
        return f"<requirement{new_attrs}>"

    return REQ_OPEN_RE.sub(replace, content), removals


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "List duplicate requirement keys in igs/*/input/pagecontent markdown files."
        )
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="Root folder that contains IG folders (default: igs)",
    )
    parser.add_argument(
        "--remove",
        action="store_true",
        help="Remove duplicate key attributes in-place (default is report-only)",
    )
    args = parser.parse_args()

    root = Path(args.root)
    if not root.exists():
        raise FileNotFoundError(f"Root folder not found: {root}")

    files = collect_markdown_files(root)
    if not files:
        print("No markdown files found under igs/*/input/pagecontent.")
        return 0

    seen: Dict[str, KeyOccurrence] = {}
    removals: List[Removal] = []
    changed_files = 0

    for file_path in files:
        original = file_path.read_text(encoding="utf-8")
        updated, file_removals = process_file(file_path, seen, remove=args.remove)
        removals.extend(file_removals)
        if updated != original:
            changed_files += 1
            if args.remove:
                file_path.write_text(updated, encoding="utf-8")

    for item in removals:
        print(
            f"[DUPLICATE] {item.file_path}:{item.line} key='{item.key}' "
            f"(first: {item.first_seen.file_path}:{item.first_seen.line})"
        )

    if args.remove:
        print(
            f"Done (remove): scanned {len(files)} file(s), "
            f"duplicate keys removed: {len(removals)}, files changed: {changed_files}."
        )
    else:
        print(
            f"Done (report): scanned {len(files)} file(s), "
            f"duplicate keys found: {len(removals)}."
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
