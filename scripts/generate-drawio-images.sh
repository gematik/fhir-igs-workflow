#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$ROOT_DIR/scripts/ig-common.sh"

ig_short="${1:-}"
if [[ -z "$ig_short" ]]; then
  echo "Error: IG short name is required" >&2
  exit 1
fi

load_ig_config "$ig_short"

cd "$IG_DIR"

DRAWIO_SOURCE_DIR="${DRAWIO_SOURCE_DIR:-input/images-source}"
DRAWIO_OUTPUT_DIR="${DRAWIO_OUTPUT_DIR:-input/images}"
DRAWIO_APP="${DRAWIO_APP:-/Applications/draw.io.app/Contents/MacOS/draw.io}"

if [[ ! -x "$DRAWIO_APP" ]]; then
  echo "draw.io app not found at $DRAWIO_APP. Set DRAWIO_APP to a valid executable." >&2
  exit 1
fi

mkdir -p "$DRAWIO_OUTPUT_DIR"

shopt -s nullglob
drawio_files=("$DRAWIO_SOURCE_DIR"/*.drawio)
shopt -u nullglob

if [[ ${#drawio_files[@]} -eq 0 ]]; then
  echo "No .drawio files found in $DRAWIO_SOURCE_DIR."
  exit 0
fi

for src in "${drawio_files[@]}"; do
  base_name="${src##*/}"
  base_name="${base_name%.drawio}"
  "$DRAWIO_APP" --export --format png --output "$DRAWIO_OUTPUT_DIR/$base_name.png" "$src"
  echo "Exported $base_name.png"
done
