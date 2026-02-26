#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_DIR="$SCRIPT_DIR/../fsh-generated/resources"
OUTPUT_DIR="$SCRIPT_DIR/../input/includes"
PYTHON_SCRIPT="$SCRIPT_DIR/build-sm-table.py"


# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

echo $INPUT_DIR

shopt -s nullglob  # Makes the loop skip if there are no matches

files=($INPUT_DIR/StructureMap-*)

if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching pattern."
    exit 0
fi

for file in "${files[@]}"; do
    filename=$(basename "$file")
    outputfile="$OUTPUT_DIR/${filename%.json}.md"
    echo "Processing $file -> $outputfile"
    echo "$PYTHON_SCRIPT"
    python3 "$PYTHON_SCRIPT" "$file" > "$outputfile"
done