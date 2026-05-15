#!/usr/bin/env python3
"""Check actor alignment for requirement pages named *-req-<actor>.md.

Scope:
- Scans only markdown files under igs/*/input/pagecontent.
- Evaluates only files with recognized suffixes:
    - -req-fd.md  -> TI-Flow_FD (also accepts Anb_TI-Flow_FD)
  - -req-fdv.md -> eRp_FdV
  - -req-avs.md -> PS_E-Rezept_abgebend
  - -req-pvs.md -> PS_E-Rezept_verordnend
  - -req-ktr.md -> CS_E-Rezept_KTR

Rules:
- If a requirement has exactly one actor, that actor must match the page actor.
- If a requirement has multiple actors, the page actor must be present.

Fix mode:
- Single-actor mismatch: rewrites actor name to expected page actor.
- Multi-actor missing expected: clones first actor tag and inserts expected actor tag.
"""

from __future__ import annotations

import argparse
import csv
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Sequence, Tuple

REQ_BLOCK_RE = re.compile(r'<requirement\b(?P<attrs>[^>]*)>(?P<body>.*?)</requirement>', re.DOTALL)
ACTOR_TAG_RE = re.compile(r'<actor\b[^>]*\bname="([^"]+)"[^>]*>.*?</actor>', re.DOTALL)
KEY_RE = re.compile(r'\bkey="([^"]+)"')
ACTOR_NAME_RE = re.compile(r'(\bname=")([^"]+)(")')

SUFFIX_TO_ALLOWED_ACTORS: Dict[str, Tuple[str, ...]] = {
    "fd": ("TI-Flow_FD", "Anb_TI-Flow_FD"),
    "fdv": ("eRp_FdV",),
    "avs": ("PS_E-Rezept_abgebend",),
    "pvs": ("PS_E-Rezept_verordnend",),
    "ktr": ("CS_E-Rezept_KTR",),
}

FILE_SUFFIX_RE = re.compile(r"-req-(fdv|fd|avs|pvs|ktr)\.md$", re.IGNORECASE)


@dataclass
class Finding:
    file_path: Path
    line: int
    key: str
    expected_actor: str
    found_actors: str
    message: str
    fixed: bool


def iter_target_files(root: Path) -> Iterable[Path]:
    for md_file in sorted(root.glob("*/input/pagecontent/**/*.md")):
        match = FILE_SUFFIX_RE.search(md_file.name)
        if match:
            yield md_file


def line_for_offset(content: str, offset: int) -> int:
    return content.count("\n", 0, offset) + 1


def clone_actor_tag_with_name(actor_tag: str, expected_actor: str) -> str:
    return ACTOR_NAME_RE.sub(rf"\1{expected_actor}\3", actor_tag, count=1)


def process_file(path: Path, allowed_actors: Sequence[str], fix: bool) -> Tuple[List[Finding], bool]:
    content = path.read_text(encoding="utf-8")
    findings: List[Finding] = []
    changed = False
    expected_actor = allowed_actors[0]
    allowed_actor_set = set(allowed_actors)

    out_parts: List[str] = []
    cursor = 0

    for req_match in REQ_BLOCK_RE.finditer(content):
        req_start, req_end = req_match.span()
        attrs = req_match.group("attrs") or ""
        block = req_match.group(0)
        key_match = KEY_RE.search(attrs)
        key = key_match.group(1) if key_match else "(ohne key)"
        line = line_for_offset(content, req_start)

        actor_matches = list(ACTOR_TAG_RE.finditer(block))
        actor_names = [m.group(1) for m in actor_matches]

        new_block = block

        if not actor_names:
            findings.append(
                Finding(
                    file_path=path,
                    line=line,
                    key=key,
                    expected_actor=expected_actor,
                    found_actors="",
                    message="requirement has no actor tag",
                    fixed=False,
                )
            )
        elif len(actor_names) == 1:
            if actor_names[0] not in allowed_actor_set:
                fixed_now = False
                if fix:
                    new_block = ACTOR_NAME_RE.sub(
                        rf"\1{expected_actor}\3",
                        new_block,
                        count=1,
                    )
                    fixed_now = new_block != block
                    changed = changed or fixed_now

                findings.append(
                    Finding(
                        file_path=path,
                        line=line,
                        key=key,
                        expected_actor=expected_actor,
                        found_actors=actor_names[0],
                        message="single actor does not match page actor",
                        fixed=fixed_now,
                    )
                )
        else:
            if not any(actor in allowed_actor_set for actor in actor_names):
                fixed_now = False
                if fix:
                    first_actor_tag = actor_matches[0].group(0)
                    cloned = clone_actor_tag_with_name(first_actor_tag, expected_actor)
                    insert_after = actor_matches[-1].end()
                    new_block = new_block[:insert_after] + "\n" + cloned + new_block[insert_after:]
                    fixed_now = new_block != block
                    changed = changed or fixed_now

                findings.append(
                    Finding(
                        file_path=path,
                        line=line,
                        key=key,
                        expected_actor=expected_actor,
                        found_actors=";".join(actor_names),
                        message="multi-actor requirement is missing page actor",
                        fixed=fixed_now,
                    )
                )

        out_parts.append(content[cursor:req_start])
        out_parts.append(new_block)
        cursor = req_end

    out_parts.append(content[cursor:])

    if fix and changed:
        path.write_text("".join(out_parts), encoding="utf-8")

    return findings, changed


def write_csv(output_csv: Path, findings: List[Finding]) -> None:
    output_csv.parent.mkdir(parents=True, exist_ok=True)
    with output_csv.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow([
            "file",
            "line",
            "key",
            "expected_actor",
            "found_actors",
            "message",
            "fixed",
        ])
        for f in findings:
            writer.writerow([
                str(f.file_path),
                f.line,
                f.key,
                f.expected_actor,
                f.found_actors,
                f.message,
                "yes" if f.fixed else "no",
            ])


def expected_actors_for_file(path: Path) -> Tuple[str, ...] | None:
    match = FILE_SUFFIX_RE.search(path.name)
    if not match:
        return None
    suffix = match.group(1).lower()
    return SUFFIX_TO_ALLOWED_ACTORS.get(suffix)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check/fix requirement actors based on *-req-<actor>.md naming."
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="Root folder that contains IG folders (default: igs)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/requirement-page-actor-alignment.csv",
        help=(
            "CSV output path for findings "
            "(default: qa/requirement-page-actor-alignment.csv)"
        ),
    )
    parser.add_argument(
        "--fix",
        action="store_true",
        help="Apply automatic fixes where possible",
    )
    args = parser.parse_args()

    root = Path(args.root)
    if not root.is_dir():
        raise FileNotFoundError(f"Root folder not found: {root}")

    findings: List[Finding] = []
    changed_files = 0
    scanned_files = 0

    for file_path in iter_target_files(root):
        allowed_actors = expected_actors_for_file(file_path)
        if not allowed_actors:
            continue

        scanned_files += 1
        file_findings, changed = process_file(file_path, allowed_actors, fix=args.fix)
        findings.extend(file_findings)
        if changed:
            changed_files += 1

    write_csv(Path(args.output_csv), findings)

    unresolved = sum(1 for f in findings if not f.fixed)
    fixed = sum(1 for f in findings if f.fixed)

    print(
        f"Checked {scanned_files} file(s), findings: {len(findings)}, "
        f"fixed: {fixed}, unresolved: {unresolved}, changed files: {changed_files}."
    )
    print(f"CSV report written to: {args.output_csv}")

    return 1 if unresolved > 0 else 0


if __name__ == "__main__":
    raise SystemExit(main())
