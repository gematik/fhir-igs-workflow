#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IG_SHORT="${1:-}"

if [[ -z "$IG_SHORT" ]]; then
  echo "Usage: $0 <ig-short>" >&2
  exit 1
fi

if [[ "$IG_SHORT" == "core" ]]; then
  exit 0
fi

MODULE_PAGE_DIR="$ROOT_DIR/igs/$IG_SHORT/input/pagecontent"
MODULE_INCLUDE_DIR="$ROOT_DIR/igs/$IG_SHORT/input/includes"
CORE_PAGE_DIR="$ROOT_DIR/igs/core/input/pagecontent"

if [[ ! -d "$MODULE_PAGE_DIR" ]]; then
  exit 0
fi

if [[ ! -d "$CORE_PAGE_DIR" ]]; then
  echo "Error: core pagecontent directory not found at $CORE_PAGE_DIR" >&2
  exit 1
fi

mkdir -p "$MODULE_INCLUDE_DIR"

include_list_file="$(mktemp)"
trap 'rm -f "$include_list_file"' EXIT

python3 - "$MODULE_PAGE_DIR" <<'PY' > "$include_list_file"
import re
import sys
from pathlib import Path

module_page_dir = Path(sys.argv[1])
include_pattern = re.compile(r"\{\%\s*include\s+([^\s%]+)")

selected = set()

for md_file in module_page_dir.rglob("*.md"):
    text = md_file.read_text(encoding="utf-8")
    for match in include_pattern.finditer(text):
        include_name = match.group(1).strip().strip('"\'')
        if include_name.startswith("core-") and include_name.endswith(".md"):
            selected.add(include_name)

for include_name in sorted(selected):
    print(include_name)
PY

while IFS= read -r include_name; do
  [[ -z "$include_name" ]] && continue

  core_file_name="${include_name#core-}"
  src="$CORE_PAGE_DIR/$core_file_name"
  dest="$MODULE_INCLUDE_DIR/$include_name"

  if [[ ! -f "$src" ]]; then
    echo "Error: missing core include source for '$include_name' at $src" >&2
    exit 1
  fi

  if [[ ! -f "$dest" ]] || ! cmp -s "$src" "$dest"; then
    cp "$src" "$dest"
  fi
done < "$include_list_file"
