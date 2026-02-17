#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IG_SHORT="${1:-}"

if [[ -z "$IG_SHORT" ]]; then
  echo "Usage: $0 <ig-short>" >&2
  exit 1
fi

CORE_FILE="$ROOT_DIR/igs/core/input/data/use-cases.yaml"
MODULE_GET="$ROOT_DIR/igs/$IG_SHORT/input/data/use-cases-get.yaml"
MODULE_OUT="$ROOT_DIR/igs/$IG_SHORT/input/data/use-cases.yaml"
CORE_IMG_DIR="$ROOT_DIR/igs/core/input/images-source"
MODULE_IMG_DIR="$ROOT_DIR/igs/$IG_SHORT/input/images-source"

if [[ ! -f "$MODULE_GET" ]]; then
  exit 0
fi

rm -f "$MODULE_OUT"

if [[ ! -f "$CORE_FILE" ]]; then
  echo "Error: core use-cases.yaml not found at $CORE_FILE" >&2
  exit 1
fi

if ! command -v yq >/dev/null 2>&1; then
  echo "Error: yq is required to merge use cases" >&2
  exit 1
fi

mkdir -p "$MODULE_IMG_DIR"

core_json="$(mktemp)"
module_json="$(mktemp)"
trap 'rm -f "$core_json" "$module_json"' EXIT

yq -o=json '.' "$CORE_FILE" > "$core_json"
yq -o=json '.' "$MODULE_GET" > "$module_json"

python3 - "$core_json" "$module_json" "$CORE_IMG_DIR" "$MODULE_IMG_DIR" <<'PY' | yq -P -o=yaml > "$MODULE_OUT"
import json
import sys
from copy import deepcopy
from pathlib import Path
import shutil

core_json_path, module_json_path, core_img_dir, module_img_dir = sys.argv[1:5]

core_items = json.loads(Path(core_json_path).read_text(encoding="utf-8"))
module_items = json.loads(Path(module_json_path).read_text(encoding="utf-8"))

core_map = {item.get("id"): item for item in core_items if item.get("id")}
merged = []

core_img_dir = Path(core_img_dir)
module_img_dir = Path(module_img_dir)

for entry in module_items:
    if not isinstance(entry, dict):
        continue
    if "core-uc" in entry:
        core_id = entry.get("core-uc")
        if core_id not in core_map:
            raise SystemExit(f"Unknown core-uc: {core_id}")
        base = deepcopy(core_map[core_id])
        merged_entry = base
        for key, value in entry.items():
            if key == "core-uc":
                continue
            merged_entry[key] = value
    else:
        merged_entry = deepcopy(entry)

    merged.append(merged_entry)

    diagram = merged_entry.get("diagram")
    if diagram:
      src = core_img_dir / f"{diagram}.plantuml"
      dst = module_img_dir / f"{diagram}.plantuml"
      if not src.exists():
        raise SystemExit(f"Missing PlantUML in core: {src}")
      if not dst.exists():
        shutil.copy2(src, dst)

print(json.dumps(merged, ensure_ascii=True))
PY
