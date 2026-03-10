#!/usr/bin/env python3
"""Report duplicated old A_ requirement references in IG pagecontent files.

Checks only markdown files under: igs/*/input/pagecontent/**/*.md
No automatic fixes are applied.
"""

from __future__ import annotations

import argparse
import csv
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Sequence

COMMENT_RE = re.compile(r"<!--(?P<body>.*?)-->", re.DOTALL)
OLD_REQ_RE = re.compile(r"A_\d+(?:-\d+)?")


@dataclass
class Occurrence:
    file_path: Path
    line: int


def iter_target_files(targets: Sequence[str]) -> Iterable[Path]:
    if not targets:
        targets = ["igs/*/input/pagecontent"]

    seen: set[Path] = set()
    for target in targets:
        path = Path(target)

        if any(ch in target for ch in "*?[]"):
            for matched in Path(".").glob(target):
                if matched.is_file() and matched.suffix.lower() == ".md":
                    resolved = matched.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield matched
                elif matched.is_dir():
                    for md_file in matched.rglob("*.md"):
                        resolved = md_file.resolve()
                        if resolved not in seen:
                            seen.add(resolved)
                            yield md_file
            continue

        if path.is_file() and path.suffix.lower() == ".md":
            resolved = path.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield path
            continue

        if path.is_dir():
            if (path / "input" / "pagecontent").is_dir():
                scan_dir = path / "input" / "pagecontent"
                for md_file in scan_dir.rglob("*.md"):
                    resolved = md_file.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield md_file
                continue

            if path.name == "igs":
                for ig_dir in path.iterdir():
                    if not ig_dir.is_dir():
                        continue
                    scan_dir = ig_dir / "input" / "pagecontent"
                    if not scan_dir.is_dir():
                        continue
                    for md_file in scan_dir.rglob("*.md"):
                        resolved = md_file.resolve()
                        if resolved not in seen:
                            seen.add(resolved)
                            yield md_file
                continue

            for md_file in path.rglob("*.md"):
                resolved = md_file.resolve()
                if resolved not in seen:
                    seen.add(resolved)
                    yield md_file


def line_for_offset(content: str, offset: int) -> int:
    return content.count("\n", 0, offset) + 1


def collect_occurrences(files: Iterable[Path]) -> Dict[str, List[Occurrence]]:
    occurrences: Dict[str, List[Occurrence]] = {}

    for file_path in files:
        content = file_path.read_text(encoding="utf-8")
        for comment_match in COMMENT_RE.finditer(content):
            comment_body = comment_match.group("body")
            line = line_for_offset(content, comment_match.start())
            for old_req in OLD_REQ_RE.findall(comment_body):
                occurrences.setdefault(old_req, []).append(Occurrence(file_path=file_path, line=line))

    return occurrences


def write_csv(output_csv: Path, duplicates: Dict[str, List[Occurrence]]) -> None:
    output_csv.parent.mkdir(parents=True, exist_ok=True)

    with output_csv.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["old_req", "occurrences", "locations"])

        for old_req in sorted(duplicates.keys()):
            occs = duplicates[old_req]
            locations = ";".join(f"{occ.file_path}:{occ.line}" for occ in occs)
            writer.writerow([old_req, len(occs), locations])


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check if old A_ requirement numbers are referenced more than once."
    )
    parser.add_argument(
        "targets",
        nargs="*",
        help="Files/directories/globs to scan (default: igs/*/input/pagecontent)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/requirement-old-req-duplicates.csv",
        help=(
            "CSV report path for duplicated old A_ references "
            "(default: qa/requirement-old-req-duplicates.csv)"
        ),
    )
    args = parser.parse_args()

    files = list(iter_target_files(args.targets))
    occurrences = collect_occurrences(files)

    duplicates = {old_req: occs for old_req, occs in occurrences.items() if len(occs) > 1}
    output_csv = Path(args.output_csv)
    write_csv(output_csv, duplicates)

    print(
        f"Checked {len(files)} file(s), unique old requirements: {len(occurrences)}, "
        f"duplicates: {len(duplicates)}."
    )
    print(f"CSV report written to: {output_csv}")

    return 1 if duplicates else 0


if __name__ == "__main__":
    raise SystemExit(main())
