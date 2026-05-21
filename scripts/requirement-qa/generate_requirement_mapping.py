#!/usr/bin/env python3
"""Generate a JSON mapping from old A_ requirements to new requirement keys."""

import argparse
import json
import re
from pathlib import Path
from typing import Dict, List, Set

OLD_REQ_RE = re.compile(r"A_\d+(?:-\d+)?")
REQ_BLOCK_RE = re.compile(
    r"(?P<comment><!--\s*(?P<comment_body>.*?)\s*-->\s*)?"
    r"<requirement\b(?P<attrs>[^>]*)>(?P<body>.*?)</requirement>",
    re.DOTALL,
)
REQ_KEY_RE = re.compile(r'\bkey="([^"]+)"')
REQ_TITLE_RE = re.compile(r'\btitle="([^"]*)"')
ACTOR_RE = re.compile(r'<actor\b[^>]*\bname="([^"]+)"[^>]*>', re.DOTALL)


def collect_markdown_files(root: Path) -> List[Path]:
    return sorted(root.glob("*/input/pagecontent/**/*.md"))


def add_mapping(
    mapping: Dict[str, Dict[str, Set[str]]],
    old_req: str,
    new_req: str,
    ig_name: str,
    rel_path: str,
    title: str,
    actors: Set[str],
) -> None:
    entry = mapping.setdefault(
        old_req,
        {
            "new_req": set(),
            "igs": set(),
            "files": set(),
            "occurrences": set(),
        },
    )
    entry["new_req"].add(new_req)
    entry["igs"].add(ig_name)
    entry["files"].add(rel_path)
    actor_sig = ";".join(sorted(actors))
    entry["occurrences"].add(f"{new_req}\t{title}\t{actor_sig}\t{rel_path}")


def parse_file(path: Path, root: Path, mapping: Dict[str, Dict[str, Set[str]]]) -> None:
    rel_path = path.relative_to(root.parent).as_posix()
    ig_name = path.relative_to(root).parts[0]

    content = path.read_text(encoding="utf-8")
    for block_match in REQ_BLOCK_RE.finditer(content):
        comment_body = block_match.group("comment_body") or ""
        old_reqs = OLD_REQ_RE.findall(comment_body)
        if not old_reqs:
            continue

        attrs = block_match.group("attrs") or ""
        body = block_match.group("body") or ""
        key_match = REQ_KEY_RE.search(attrs)
        if not key_match:
            continue

        title_match = REQ_TITLE_RE.search(attrs)
        title = (title_match.group(1) if title_match else "").strip()
        actors = set(ACTOR_RE.findall(body))
        new_req = key_match.group(1)

        for old_req in old_reqs:
            add_mapping(mapping, old_req, new_req, ig_name, rel_path, title, actors)


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
                "occurrences": [
                    {
                        "new_req": parts[0],
                        "title": parts[1],
                        "actors": [a for a in parts[2].split(";") if a],
                        "file": parts[3],
                    }
                    for parts in (item.split("\t") for item in sorted(entry.get("occurrences", set())))
                ],
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
