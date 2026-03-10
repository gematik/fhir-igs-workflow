#!/usr/bin/env python3
"""Reset requirement numbering state across IGs.

For each selected IG under igs/*:
1. Remove all key attributes from <requirement ...> tags in input/pagecontent markdown files.
2. Set current_req_number: 0 in .igtools/config.yaml.
3. Delete all files inside .igtools/releases/1_0_0.
4. Run igtools process for selected IGs (or all when no --ig is provided).
"""

from __future__ import annotations

import argparse
import re
import subprocess
from pathlib import Path
from typing import Iterable, List, Optional, Sequence

REQ_OPEN_RE = re.compile(r"<requirement\b(?P<attrs>[^>]*)>", re.IGNORECASE | re.DOTALL)
KEY_REMOVE_RE = re.compile(r"\s+\bkey\s*=\s*(?:\"[^\"]*\"|'[^']*')", re.IGNORECASE)
CURRENT_REQ_RE = re.compile(r"^current_req_number\s*:\s*.*$", re.MULTILINE)


def ig_dirs(root: Path) -> List[Path]:
    return sorted(path for path in root.iterdir() if path.is_dir())


def select_igs(root: Path, requested_igs: Sequence[str]) -> List[Path]:
    all_igs = {path.name: path for path in ig_dirs(root)}
    if not requested_igs:
        return [all_igs[name] for name in sorted(all_igs)]

    missing = [name for name in requested_igs if name not in all_igs]
    if missing:
        missing_list = ", ".join(sorted(missing))
        raise FileNotFoundError(f"Requested IG(s) not found under {root}: {missing_list}")

    # Keep user order while de-duplicating.
    selected: List[Path] = []
    seen: set[str] = set()
    for name in requested_igs:
        if name in seen:
            continue
        selected.append(all_igs[name])
        seen.add(name)
    return selected


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


def run_igtools(repo_root: Path, selected_igs: Sequence[Path]) -> None:
    for ig_dir in selected_igs:
        ig_ini = ig_dir / "ig.ini"
        if not ig_ini.exists():
            raise FileNotFoundError(f"IG config not found: {ig_ini}")

        print(f"=== Running 'igtools process' in igs/{ig_dir.name} ===")
        subprocess.run(["igtools", "process"], cwd=ig_dir, check=True)
        print(f"OK: igs/{ig_dir.name}")


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
        help="Skip final igtools process execution",
    )
    parser.add_argument(
        "--ig",
        action="append",
        default=[],
        help="Run only for this IG folder name (e.g. --ig core). Repeat for multiple IGs.",
    )
    args = parser.parse_args()

    repo_root = Path(__file__).resolve().parent.parent
    root = repo_root / args.root

    if not root.is_dir():
        raise FileNotFoundError(f"IG root not found: {root}")

    selected_igs = select_igs(root, args.ig)

    total_md_files = 0
    changed_md_files = 0
    config_updates = 0
    deleted_release_files = 0

    for ig_dir in selected_igs:
        md_files = list(markdown_files_for_ig(ig_dir))
        total_md_files += len(md_files)
        for md_file in md_files:
            if remove_keys_from_file(md_file):
                changed_md_files += 1

        config_path = ig_dir / ".igtools" / "config.yaml"
        if reset_current_req_number(config_path):
            config_updates += 1

        release_dir = ig_dir / ".igtools" / "releases" / "1_0_0"
        deleted_release_files += delete_release_files(release_dir)

    print("Reset summary:")
    print(f"- IGs scanned: {len(selected_igs)}")
    print(f"- Markdown files scanned: {total_md_files}")
    print(f"- Markdown files changed (keys removed): {changed_md_files}")
    print(f"- Config files updated: {config_updates}")
    print(f"- Files deleted in .igtools/releases/1_0_0: {deleted_release_files}")

    if args.skip_process:
        print("Skipped: igtools process")
        return 0

    print("Running: igtools process")
    run_igtools(repo_root, selected_igs)
    print("Finished: igtools process")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
