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
from typing import Dict, Iterable, List, Sequence, Tuple

REQ_BLOCK_RE = re.compile(
    r"(?P<comment><!--(?P<comment_body>.*?)-->\s*)?"
    r"<requirement\b(?P<attrs>[^>]*)>(?P<body>.*?)</requirement>",
    re.DOTALL,
)
OLD_REQ_RE = re.compile(r"A_\d+(?:-\d+)?")
ACTOR_RE = re.compile(r"<actor\b[^>]*\bname=\"([^\"]+)\"[^>]*>", re.DOTALL)


@dataclass
class Occurrence:
    file_path: Path
    line: int
    actors: Tuple[str, ...]


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


def actor_signature(actors: Tuple[str, ...]) -> str:
    return ";".join(actors) if actors else "(no actor)"


def collect_occurrences(files: Iterable[Path]) -> Dict[str, List[Occurrence]]:
    occurrences: Dict[str, List[Occurrence]] = {}

    for file_path in files:
        content = file_path.read_text(encoding="utf-8")
        for block_match in REQ_BLOCK_RE.finditer(content):
            comment_body = block_match.group("comment_body") or ""
            old_reqs = OLD_REQ_RE.findall(comment_body)
            if not old_reqs:
                continue

            line = line_for_offset(content, block_match.start())
            actor_names = tuple(sorted(set(ACTOR_RE.findall(block_match.group("body") or ""))))
            for old_req in old_reqs:
                occurrences.setdefault(old_req, []).append(
                    Occurrence(file_path=file_path, line=line, actors=actor_names)
                )

    return occurrences


def write_csv(
    output_csv: Path,
    duplicate_groups: List[Tuple[str, Tuple[str, ...], List[Occurrence]]],
) -> None:
    output_csv.parent.mkdir(parents=True, exist_ok=True)

    with output_csv.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["old_req", "actors", "occurrences", "locations"])

        for old_req, actors, occs in duplicate_groups:
            actor_sig = actor_signature(actors)
            locations = ";".join(f"{occ.file_path}:{occ.line}" for occ in occs)
            writer.writerow([old_req, actor_sig, len(occs), locations])


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

    grouped: Dict[Tuple[str, Tuple[str, ...]], List[Occurrence]] = {}
    for old_req, occs in occurrences.items():
        for occ in occs:
            grouped.setdefault((old_req, occ.actors), []).append(occ)

    duplicate_groups: List[Tuple[str, Tuple[str, ...], List[Occurrence]]] = []
    for (old_req, actors), occs in sorted(grouped.items(), key=lambda item: (item[0][0], item[0][1])):
        if len(occs) > 1:
            duplicate_groups.append((old_req, actors, occs))

    output_csv = Path(args.output_csv)
    write_csv(output_csv, duplicate_groups)

    print(
        f"Checked {len(files)} file(s), unique old requirements: {len(occurrences)}, "
        f"duplicates: {len(duplicate_groups)}."
    )
    print(f"CSV report written to: {output_csv}")

    return 1 if duplicate_groups else 0


if __name__ == "__main__":
    raise SystemExit(main())
