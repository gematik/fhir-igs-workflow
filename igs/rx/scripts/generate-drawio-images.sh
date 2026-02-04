#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

DRAWIO_SOURCE_DIR="${DRAWIO_SOURCE_DIR:-input/images-source}"
DRAWIO_OUTPUT_DIR="${DRAWIO_OUTPUT_DIR:-input/images}"
DRAWIO_APP="${DRAWIO_APP:-/Applications/draw.io.app/Contents/MacOS/draw.io}"

if [ ! -x "$DRAWIO_APP" ]; then
  echo "draw.io app not found at $DRAWIO_APP. Set DRAWIO_APP to a valid executable." >&2
  exit 1
fi

mkdir -p "$DRAWIO_OUTPUT_DIR"

# Gather input diagrams and export them via the desktop app.
setopt null_glob
drawio_files=("$DRAWIO_SOURCE_DIR"/*.drawio)
unsetopt null_glob

if [ ${#drawio_files[@]} -eq 0 ]; then
  echo "No .drawio files found in $DRAWIO_SOURCE_DIR."
  exit 0
fi

for src in "${drawio_files[@]}"; do
  base_name="${src##*/}"
  base_name="${base_name%.drawio}"
  "$DRAWIO_APP" --export --format png --output "$DRAWIO_OUTPUT_DIR/$base_name.png" "$src"
  echo "Exported $base_name.png"
done
