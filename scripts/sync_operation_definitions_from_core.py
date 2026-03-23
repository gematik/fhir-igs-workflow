#!/usr/bin/env python3
"""Sync OperationDefinition include JSON files from core into module IGs.

Workflow:
1. Run SUSHI in igs/core (unless --skip-core-sushi).
2. For each target IG:
   - Optionally remove existing OperationDefinition-*.json from input/includes.
   - Scan op-*.md and query-api*.md pages for OperationDefinition include tags.
   - Copy matching OperationDefinition JSON files from core generated resources.
   - If not found in core and fallback is enabled, copy from module generated resources.

This keeps module includes deterministic and ready for IG Publisher builds.
"""

from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List, Set

INCLUDE_RE = re.compile(r"\{\%\s*include\s+(OperationDefinition-[^\s%]+\.json)\s*\%\}")
PAGE_PATTERNS = ("op-*.md", "query-api*.md")


@dataclass
class IgSyncResult:
    ig: str
    cleaned: int
    needed: int
    copied_from_core: int
    copied_from_local: int
    missing: List[str]


def run_command(cmd: List[str], cwd: Path) -> None:
    proc = subprocess.run(cmd, cwd=str(cwd), check=False)
    if proc.returncode != 0:
        raise RuntimeError(f"Command failed ({proc.returncode}): {' '.join(cmd)}")


def discover_module_igs(igs_root: Path) -> List[str]:
    names: List[str] = []
    for child in sorted(igs_root.iterdir()):
        if not child.is_dir():
            continue
        if child.name == "core":
            continue
        if (child / "ig.ini").exists():
            names.append(child.name)
    return names


def collect_needed_operation_definitions(pagecontent_dir: Path) -> Set[str]:
    needed: Set[str] = set()
    if not pagecontent_dir.is_dir():
        return needed

    for pattern in PAGE_PATTERNS:
        for md_file in sorted(pagecontent_dir.glob(pattern)):
            text = md_file.read_text(encoding="utf-8")
            for match in INCLUDE_RE.finditer(text):
                needed.add(match.group(1))

    return needed


def clean_operation_definitions(include_dir: Path) -> int:
    if not include_dir.exists():
        return 0

    removed = 0
    for path in include_dir.glob("OperationDefinition-*.json"):
        path.unlink()
        removed += 1
    return removed


def ensure_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def sync_ig(
    repo_root: Path,
    ig_name: str,
    clean: bool,
    allow_local_fallback: bool,
) -> IgSyncResult:
    ig_dir = repo_root / "igs" / ig_name
    pagecontent_dir = ig_dir / "input" / "pagecontent"
    include_dir = ig_dir / "input" / "includes"
    core_resources_dir = repo_root / "igs" / "core" / "fsh-generated" / "resources"
    local_resources_dir = ig_dir / "fsh-generated" / "resources"

    ensure_dir(include_dir)

    cleaned = clean_operation_definitions(include_dir) if clean else 0
    needed = sorted(collect_needed_operation_definitions(pagecontent_dir))

    copied_from_core = 0
    copied_from_local = 0
    missing: List[str] = []

    for filename in needed:
        src_core = core_resources_dir / filename
        src_local = local_resources_dir / filename
        dst = include_dir / filename

        if src_core.exists():
            shutil.copy2(src_core, dst)
            copied_from_core += 1
            continue

        if allow_local_fallback and src_local.exists():
            shutil.copy2(src_local, dst)
            copied_from_local += 1
            continue

        missing.append(filename)

    return IgSyncResult(
        ig=ig_name,
        cleaned=cleaned,
        needed=len(needed),
        copied_from_core=copied_from_core,
        copied_from_local=copied_from_local,
        missing=missing,
    )


def parse_args(argv: Iterable[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Run SUSHI for core and sync OperationDefinition includes into module IGs"
        )
    )
    parser.add_argument(
        "--igs",
        nargs="+",
        help="IG short names to process (default: all non-core IGs)",
    )
    parser.add_argument(
        "--skip-core-sushi",
        action="store_true",
        help="Skip running SUSHI in igs/core before syncing",
    )
    parser.add_argument(
        "--no-clean",
        action="store_true",
        help="Do not remove existing OperationDefinition-*.json in module include dirs",
    )
    parser.add_argument(
        "--no-local-fallback",
        action="store_true",
        help=(
            "Do not copy from module fsh-generated/resources when the file is missing in core"
        ),
    )
    return parser.parse_args(list(argv))


def main(argv: Iterable[str]) -> int:
    args = parse_args(argv)

    repo_root = Path(__file__).resolve().parents[1]
    igs_root = repo_root / "igs"

    all_module_igs = discover_module_igs(igs_root)
    target_igs = args.igs if args.igs else all_module_igs

    unknown = sorted(set(target_igs) - set(all_module_igs))
    if unknown:
        print(f"Error: unknown IG(s): {', '.join(unknown)}", file=sys.stderr)
        return 2

    if not args.skip_core_sushi:
        core_dir = igs_root / "core"
        if shutil.which("sushi") is None:
            print("Error: 'sushi' command not found in PATH", file=sys.stderr)
            return 2
        print("Running SUSHI in igs/core ...")
        try:
            run_command(["sushi", "."], core_dir)
        except RuntimeError as exc:
            print(f"Error: {exc}", file=sys.stderr)
            return 1

    clean = not args.no_clean
    allow_local_fallback = not args.no_local_fallback

    results: List[IgSyncResult] = []
    had_missing = False

    for ig in target_igs:
        result = sync_ig(
            repo_root=repo_root,
            ig_name=ig,
            clean=clean,
            allow_local_fallback=allow_local_fallback,
        )
        results.append(result)
        had_missing = had_missing or bool(result.missing)

    for result in results:
        print(
            f"[{result.ig}] cleaned={result.cleaned} needed={result.needed} "
            f"copied_core={result.copied_from_core} copied_local={result.copied_from_local} "
            f"missing={len(result.missing)}"
        )
        if result.missing:
            for name in result.missing:
                print(f"  - missing: {name}")

    if had_missing:
        print(
            "Completed with missing OperationDefinition files. "
            "Check include names or provide missing definitions.",
            file=sys.stderr,
        )
        return 3

    print("Sync completed successfully.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
