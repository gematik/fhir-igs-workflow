#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v igtools >/dev/null 2>&1; then
  echo "Error: required command not found: igtools" >&2
  exit 1
fi

shopt -s nullglob
ig_configs=("$ROOT_DIR"/igs/*/ig.ini)
shopt -u nullglob

if [[ ${#ig_configs[@]} -eq 0 ]]; then
  echo "No IGs found under $ROOT_DIR/igs (expected igs/<name>/ig.ini)."
  exit 1
fi

failures=0

for ig_ini in "${ig_configs[@]}"; do
  ig_dir="$(dirname "$ig_ini")"
  ig_name="$(basename "$ig_dir")"

  echo "=== Running 'igtools process' in igs/$ig_name ==="
  if (cd "$ig_dir" && igtools process); then
    echo "OK: igs/$ig_name"
  else
    echo "FAILED: igs/$ig_name" >&2
    failures=$((failures + 1))
  fi
  echo

done

if [[ $failures -gt 0 ]]; then
  echo "Completed with $failures failure(s)." >&2
  exit 1
fi

echo "Completed successfully for ${#ig_configs[@]} IG(s)."
