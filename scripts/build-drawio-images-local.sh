#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DRAWIO_APP="${DRAWIO_APP:-/Applications/draw.io.app/Contents/MacOS/draw.io}"
DRAWIO_SOURCE_REL="input/drawio-source"
DRAWIO_OUTPUT_REL="input/images"

if [[ ! -x "$DRAWIO_APP" ]]; then
  echo "Error: draw.io app not found at $DRAWIO_APP" >&2
  echo "Set DRAWIO_APP to your local draw.io executable path." >&2
  exit 1
fi

echo "Using draw.io app: $DRAWIO_APP"

for ig_dir in "$ROOT_DIR"/igs/*; do
  [[ -d "$ig_dir" ]] || continue

  ig_name="$(basename "$ig_dir")"
  source_dir="$ig_dir/$DRAWIO_SOURCE_REL"
  output_dir="$ig_dir/$DRAWIO_OUTPUT_REL"

  if [[ ! -d "$source_dir" ]]; then
    continue
  fi

  shopt -s nullglob
  drawio_files=("$source_dir"/*.drawio)
  shopt -u nullglob

  if [[ ${#drawio_files[@]} -eq 0 ]]; then
    echo "[$ig_name] No .drawio files found in $DRAWIO_SOURCE_REL"
    continue
  fi

  mkdir -p "$output_dir"
  echo "[$ig_name] Exporting ${#drawio_files[@]} diagram(s) to $DRAWIO_OUTPUT_REL"

  for src in "${drawio_files[@]}"; do
    base_name="${src##*/}"
    base_name="${base_name%.drawio}"
    "$DRAWIO_APP" --export --format svg --embed-svg-images --output "$output_dir/$base_name.svg" "$src"
    echo "[$ig_name] Exported $base_name.svg"
  done
done
