#!/usr/bin/env python3
"""Generate a JSON mapping from old A_ requirements to new requirement keys."""

import argparse
import json
import re
from pathlib import Path
from typing import Dict, List, Set

OLD_REQ_RE = re.compile(r"A_\d+(?:-\d+)?")
REQ_KEY_RE = re.compile(r"<requirement\b[^>]*\bkey=\"([^\"]+)\"")


def collect_markdown_files(root: Path) -> List[Path]:
    return sorted(root.glob("*/input/pagecontent/**/*.md"))


def add_mapping(
    mapping: Dict[str, Dict[str, Set[str]]],
    old_req: str,
    new_req: str,
    ig_name: str,
    rel_path: str,
) -> None:
    entry = mapping.setdefault(old_req, {"new_req": set(), "igs": set(), "files": set()})
    entry["new_req"].add(new_req)
    entry["igs"].add(ig_name)
    entry["files"].add(rel_path)


def parse_file(path: Path, root: Path, mapping: Dict[str, Dict[str, Set[str]]]) -> None:
    rel_path = path.relative_to(root.parent).as_posix()
    ig_name = path.relative_to(root).parts[0]

    pending_old: List[str] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        comment_ids = OLD_REQ_RE.findall(line)
        if comment_ids:
            pending_old = comment_ids

        key_match = REQ_KEY_RE.search(line)
        if key_match and pending_old:
            for old_req in pending_old:
                add_mapping(mapping, old_req, key_match.group(1), ig_name, rel_path)
            pending_old = []


def build_output(mapping: Dict[str, Dict[str, Set[str]]]) -> Dict[str, List[Dict[str, List[str]]]]:
    output = []
    for old_req in sorted(mapping.keys()):
        entry = mapping[old_req]
        output.append(
            {
                "old_req": old_req,
                "new_req": sorted(entry["new_req"]),
                "igs": sorted(entry["igs"]),
                "files": sorted(entry["files"]),
            }
        )
    return {"requirement_mapping": output}


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate mapping from HTML comment A_ IDs to requirement keys."
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="Root folder that contains IG folders (default: igs)",
    )
    parser.add_argument(
        "--output",
        default="qa/requirement-mapping.json",
        help="Output JSON file path (default: qa/requirement-mapping.json)",
    )
    args = parser.parse_args()

    root = Path(args.root)
    if not root.exists():
        raise FileNotFoundError(f"Root folder not found: {root}")

    mapping: Dict[str, Dict[str, Set[str]]] = {}
    for path in collect_markdown_files(root):
        parse_file(path, root, mapping)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    output = build_output(mapping)
    output_path.write_text(
        json.dumps(output, indent=2, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
