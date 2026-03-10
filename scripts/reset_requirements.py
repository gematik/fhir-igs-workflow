#!/usr/bin/env python3
"""Reset requirement numbering state across all IGs.

For each IG under igs/*:
1. Remove all key attributes from <requirement ...> tags in input/pagecontent markdown files.
2. Set current_req_number: 0 in .igtools/config.yaml.
3. Delete all files inside releases/1_0_0.
4. Run ./scripts/run-igtools-process-all.sh (once after all IG updates).
"""

from __future__ import annotations

import argparse
import re
import subprocess
from pathlib import Path
from typing import Iterable, List

REQ_OPEN_RE = re.compile(r"<requirement\b(?P<attrs>[^>]*)>", re.IGNORECASE | re.DOTALL)
KEY_REMOVE_RE = re.compile(r"\s+\bkey\s*=\s*(?:\"[^\"]*\"|'[^']*')", re.IGNORECASE)
CURRENT_REQ_RE = re.compile(r"^current_req_number\s*:\s*.*$", re.MULTILINE)


def ig_dirs(root: Path) -> List[Path]:
    return sorted(path for path in root.iterdir() if path.is_dir())


def markdown_files_for_ig(ig_dir: Path) -> Iterable[Path]:
    pagecontent = ig_dir / "input" / "pagecontent"
    if not pagecontent.is_dir():
        return []
    return sorted(pagecontent.rglob("*.md"))


def remove_keys_from_file(path: Path) -> bool:
    original = path.read_text(encoding="utf-8")

    def replace(match: re.Match[str]) -> str:
        attrs = match.group("attrs")
        new_attrs = KEY_REMOVE_RE.sub("", attrs)
        return f"<requirement{new_attrs}>"

    updated = REQ_OPEN_RE.sub(replace, original)
    if updated != original:
        path.write_text(updated, encoding="utf-8")
        return True
    return False


def reset_current_req_number(config_path: Path) -> bool:
    if not config_path.exists():
        return False

    original = config_path.read_text(encoding="utf-8")
    if CURRENT_REQ_RE.search(original):
        updated = CURRENT_REQ_RE.sub("current_req_number: 0", original, count=1)
    else:
        if original.endswith("\n"):
            updated = original + "current_req_number: 0\n"
        else:
            updated = original + "\ncurrent_req_number: 0\n"

    if updated != original:
        config_path.write_text(updated, encoding="utf-8")
        return True
    return False


def delete_release_files(release_dir: Path) -> int:
    if not release_dir.is_dir():
        return 0

    deleted = 0
    for path in sorted(release_dir.rglob("*"), reverse=True):
        if path.is_file() or path.is_symlink():
            path.unlink()
            deleted += 1
    return deleted


def run_igtools(repo_root: Path) -> None:
    script = repo_root / "scripts" / "run-igtools-process-all.sh"
    if not script.exists():
        raise FileNotFoundError(f"Script not found: {script}")

    subprocess.run([str(script)], cwd=repo_root, check=True)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Reset requirement keys and numbering baseline for all IGs."
    )
    parser.add_argument(
        "--root",
        default="igs",
        help="IG root directory (default: igs)",
    )
    parser.add_argument(
        "--skip-process",
        action="store_true",
        help="Skip final ./scripts/run-igtools-process-all.sh execution",
    )
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parent.parent
    root = repo_root / args.root

    if not root.is_dir():
        raise FileNotFoundError(f"IG root not found: {root}")

    total_md_files = 0
    changed_md_files = 0
    config_updates = 0
    deleted_release_files = 0

    for ig_dir in ig_dirs(root):
        md_files = list(markdown_files_for_ig(ig_dir))
        total_md_files += len(md_files)
        for md_file in md_files:
            if remove_keys_from_file(md_file):
                changed_md_files += 1

        config_path = ig_dir / ".igtools" / "config.yaml"
        if reset_current_req_number(config_path):
            config_updates += 1

        release_dir = ig_dir / "releases" / "1_0_0"
        deleted_release_files += delete_release_files(release_dir)

    print("Reset summary:")
    print(f"- IGs scanned: {len(ig_dirs(root))}")
    print(f"- Markdown files scanned: {total_md_files}")
    print(f"- Markdown files changed (keys removed): {changed_md_files}")
    print(f"- Config files updated: {config_updates}")
    print(f"- Files deleted in releases/1_0_0: {deleted_release_files}")

    if args.skip_process:
        print("Skipped: ./scripts/run-igtools-process-all.sh")
        return 0

    print("Running: ./scripts/run-igtools-process-all.sh")
    run_igtools(repo_root)
    print("Finished: ./scripts/run-igtools-process-all.sh")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
