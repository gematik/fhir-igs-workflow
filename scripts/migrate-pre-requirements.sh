#!/usr/bin/env bash

set -euo pipefail

DIR="${1:-}"

if [ -z "$DIR" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

find "$DIR" -type f -name "IG-PRE-*.yaml" | while read -r file; do
    dir=$(dirname "$file")
    base=$(basename "$file")
    new_base="${base/IG-PRE-/IG-}"

    echo "Renaming: $base -> $new_base"
    mv "$file" "$dir/$new_base"
done