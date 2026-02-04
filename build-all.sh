#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ROOT_DIR/scripts/ig-common.sh"

usage() {
  echo "Usage: $0 [--ig <name> ...]"
  echo "Example: $0 --ig rx erp-eu"
}

declare -a IG_FILTER=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --ig)
      shift
      if [[ $# -eq 0 ]]; then
        echo "Error: --ig requires at least one IG name" >&2
        usage
        exit 1
      fi
      while [[ $# -gt 0 && "$1" != --* ]]; do
        IG_FILTER+=("$1")
        shift
      done
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

run_ig() {
  local ig_short="$1"

  load_ig_config "$ig_short"
  local ig_dir="$IG_DIR"

  echo "Building $ig_short"

  if command -v sushi >/dev/null 2>&1; then
    (cd "$ig_dir" && sushi .)
  else
    echo "Error: sushi not found" >&2
    exit 1
  fi

  if [[ "${BUILD_GENERATE_HEADING_LINKS:-}" == "true" ]]; then
    if [[ -f "$ROOT_DIR/scripts/generate-heading-links-js.sh" ]]; then
      bash "$ROOT_DIR/scripts/generate-heading-links-js.sh" "$ig_short"
    else
      echo "Warning: generate-heading-links-js.sh not found; skipping"
    fi
  fi

  if [[ "${BUILD_USE_IGTOOLS:-}" == "true" ]]; then
    if command -v igtools >/dev/null 2>&1; then
      (cd "$ig_dir" && igtools process)
    else
      echo "Warning: igtools not found; skipping igtools process"
    fi
  fi

  if [[ "${BUILD_GENERATE_DRAWIO_IMAGES:-}" == "true" && -x "$ig_dir/scripts/generate-drawio-images.sh" ]]; then
    (cd "$ig_dir" && "$ig_dir/scripts/generate-drawio-images.sh")
  fi

  if [[ -x "$ig_dir/scripts/build-ig.sh" ]]; then
    (cd "$ig_dir" && "$ig_dir/scripts/build-ig.sh")
  fi

  if [[ -x "$ROOT_DIR/_genonce.sh" ]]; then
    local publisher_src="$ROOT_DIR/input-cache/publisher.jar"
    local publisher_dest_dir="$ig_dir/input-cache"
    if [[ -f "$publisher_src" ]]; then
      mkdir -p "$publisher_dest_dir"
      if [[ ! -f "$publisher_dest_dir/publisher.jar" ]]; then
        cp "$publisher_src" "$publisher_dest_dir/publisher.jar"
      fi
    fi
    if [[ ${#GENONCE_ARGS[@]:-0} -gt 0 ]]; then
      (cd "$ig_dir" && "$ROOT_DIR/_genonce.sh" "${GENONCE_ARGS[@]}")
    else
      (cd "$ig_dir" && "$ROOT_DIR/_genonce.sh")
    fi
  else
    echo "Error: _genonce.sh not found" >&2
    exit 1
  fi
}

if [[ ${#IG_FILTER[@]} -eq 0 ]]; then
  for ig_dir in "$ROOT_DIR"/igs/*; do
    if [[ -d "$ig_dir" && -f "$ig_dir/ig.ini" ]]; then
      run_ig "$(basename "$ig_dir")"
    fi
  done
  exit 0
fi

for ig_short in "${IG_FILTER[@]}"; do
  if [[ ! -d "$ROOT_DIR/igs/$ig_short" ]]; then
    echo "Error: IG not found: $ig_short" >&2
    exit 1
  fi
  run_ig "$ig_short"
done
