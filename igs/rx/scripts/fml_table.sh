#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

INPUT_DIR="$SCRIPT_DIR/../input/resources/structuremaps"
OUTPUT_DIR="$SCRIPT_DIR/../input/pagecontent"
PYTHON_SCRIPT="$SCRIPT_DIR/build-sm-table.py"


# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo "$INPUT_DIR"

if [ ! -d "$INPUT_DIR" ]; then
    echo "No structuremaps directory found at $INPUT_DIR"
    exit 0
fi

setopt null_glob  # Makes the loop skip if there are no matches
files=("$INPUT_DIR"/StructureMap-*.json)
unsetopt null_glob

if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching pattern."
    exit 0
fi

for file in "${files[@]}"; do
    filename=$(basename "$file")
    map_id=$(python3 - "$file" <<'PY'
import json, sys
from pathlib import Path

if len(sys.argv) < 2:
    raise SystemExit("Missing file path")
path = Path(sys.argv[1])
with path.open(encoding="utf-8") as handle:
    data = json.load(handle)
map_id = data.get("id") or data.get("name")
if not map_id:
    raise SystemExit("Missing id/name in StructureMap")
print(map_id)
PY
    )

    if [ -z "$map_id" ]; then
        echo "Skipping $file (no id found)"
        continue
    fi

    outputfile="$OUTPUT_DIR/StructureMap-${map_id}-intro.md"
    echo "Processing $file -> $outputfile"
    echo "$PYTHON_SCRIPT"
    python3 "$PYTHON_SCRIPT" "$file" > "$outputfile"
done