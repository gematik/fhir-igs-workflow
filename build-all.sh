#!/usr/bin/env bash
set -euo pipefail

# Add Python user bin to PATH for igtools
export PATH="$HOME/.local/bin:$PATH"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ROOT_DIR/scripts/ig-common.sh"

usage() {
  echo "Usage: $0 [--ig <name> ...] [--concurrent] [--from-temp <temp_dir>]"
  echo "Example: $0 --ig rx erp-eu"
  echo "         $0 --concurrent"
  echo "         $0 --concurrent --cleanup"
  echo ""
  echo "Options:"
  echo "  --concurrent         Build IGs in parallel (Terminal windows on macOS, background on other OS)"
  echo "  --cleanup            Remove each temp build directory after its build completes"
  echo "  --from-temp <dir>    Internal: build from isolated temp copy (called by concurrent mode)"
}

declare -a IG_FILTER=()
CONCURRENT=false
CLEANUP=false
FROM_TEMP=""

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
    --concurrent)
      CONCURRENT=true
      shift
      ;;
    --cleanup)
      CLEANUP=true
      shift
      ;;
    --from-temp)
      shift
      if [[ $# -eq 0 ]]; then
        echo "Error: --from-temp requires a directory path" >&2
        usage
        exit 1
      fi
      FROM_TEMP="$1"
      ROOT_DIR="$FROM_TEMP"
      shift
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

ensure_ig_deps() {
  local deps_script="$ROOT_DIR/scripts/collect-sushi-deps.sh"

  if [[ -x "$deps_script" ]]; then
    INSTALL_SUSHI_DEPS=auto "$deps_script"
  elif [[ -f "$deps_script" ]]; then
    INSTALL_SUSHI_DEPS=auto bash "$deps_script"
  else
    echo "Warning: collect-sushi-deps.sh not found; skipping dependency check"
  fi
}

run_ig() {
  local ig_short="$1"

  load_ig_config "$ig_short"
  local ig_dir="$IG_DIR"

  echo "Building $ig_short"

  if [[ -x "$ROOT_DIR/scripts/merge-use-cases.sh" ]]; then
    "$ROOT_DIR/scripts/merge-use-cases.sh" "$ig_short"
  fi

  if [[ -x "$ROOT_DIR/scripts/merge-core-includes.sh" ]]; then
    "$ROOT_DIR/scripts/merge-core-includes.sh" "$ig_short"
  fi

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

  if [[ "${BUILD_GENERATE_DRAWIO_IMAGES:-}" == "true" ]]; then
    if [[ -x "$ROOT_DIR/scripts/generate-drawio-images.sh" ]]; then
      "$ROOT_DIR/scripts/generate-drawio-images.sh" "$ig_short"
    elif [[ -x "$ig_dir/scripts/generate-drawio-images.sh" ]]; then
      (cd "$ig_dir" && "$ig_dir/scripts/generate-drawio-images.sh")
    else
      echo "Warning: draw.io export script not found for $ig_short; skipping"
    fi
  fi

  if [[ -f "$ig_dir/scripts/build-ig.sh" ]]; then
    if [[ -x "$ig_dir/scripts/build-ig.sh" ]]; then
      (cd "$ig_dir" && "$ig_dir/scripts/build-ig.sh")
    else
      (cd "$ig_dir" && bash "$ig_dir/scripts/build-ig.sh")
    fi
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
    if [[ "${GENONCE_ARGS+x}" == "x" && ${#GENONCE_ARGS[@]} -gt 0 ]]; then
      (cd "$ig_dir" && "$ROOT_DIR/_genonce.sh" "${GENONCE_ARGS[@]}")
    else
      (cd "$ig_dir" && "$ROOT_DIR/_genonce.sh")
    fi
  else
    echo "Error: _genonce.sh not found" >&2
    exit 1
  fi
}

run_igs_parallel() {
  local -a igs=("$@")
  local -a pids=()
  local failed=0

  for ig_short in "${igs[@]}"; do
    run_ig "$ig_short" &
    pids+=("$!")
  done

  for pid in "${pids[@]}"; do
    if ! wait "$pid"; then
      failed=1
    fi
  done

  return "$failed"
}

run_igs_macos_terminal() {
  local -a igs=("$@")
  local repo_dir="$ROOT_DIR"
  local temp_parent="$repo_dir/.tmp-build"
  local total="${#igs[@]}"
  local launched=0

  if ! command -v osascript >/dev/null 2>&1; then
    echo "Error: osascript not found; cannot open macOS Terminal windows" >&2
    return 1
  fi

  # Always start from a clean temp workspace.
  rm -rf "$temp_parent"
  mkdir -p "$temp_parent"
  echo "Creating isolated build directories in $temp_parent..."

  if [[ "$total" -eq 0 ]]; then
    return 0
  fi

  for ig_short in "${igs[@]}"; do
    local temp_ig_dir="$temp_parent/$ig_short"
    local child_cmd="mkdir -p '$temp_ig_dir'"
    child_cmd+=" && rsync -a --exclude='.git' --exclude='node_modules' --exclude='igs/*/output' --exclude='igs/*/temp' --exclude='igs/*/.tmp-build' '$repo_dir/' '$temp_ig_dir/'"
    child_cmd+=" && cd '$temp_ig_dir' && ./build-all.sh --ig '$ig_short' --from-temp '$temp_ig_dir'"
    if [[ "$CLEANUP" == "true" ]]; then
      child_cmd+=" --cleanup"
    fi

    # Open Terminal window and build from temp directory.
    osascript -e "tell application \"Terminal\" to do script \"$child_cmd\""

    launched=$((launched + 1))
    printf "\rOpening build terminals, %d of %d started." "$launched" "$total"
  done

  echo
  echo "Terminal windows opened for parallel builds. Check .tmp-build/ for build artifacts."
}

if [[ ${#IG_FILTER[@]} -eq 0 ]]; then
  declare -a all_igs=()
  for ig_dir in "$ROOT_DIR"/igs/*; do
    if [[ -d "$ig_dir" && -f "$ig_dir/ig.ini" ]]; then
      all_igs+=("$(basename "$ig_dir")")
    fi
  done
  if [[ "$CONCURRENT" == "true" ]]; then
    if [[ "$(uname -s)" == "Darwin" ]]; then
      run_igs_macos_terminal "${all_igs[@]}"
    else
      ensure_ig_deps
      run_igs_parallel "${all_igs[@]}"
    fi
  else
    ensure_ig_deps
    for ig_short in "${all_igs[@]}"; do
      run_ig "$ig_short"
    done
  fi
  exit $?
fi

for ig_short in "${IG_FILTER[@]}"; do
  if [[ ! -d "$ROOT_DIR/igs/$ig_short" ]]; then
    echo "Error: IG not found: $ig_short" >&2
    exit 1
  fi
done

# Build handling
BUILD_EXIT_CODE=0

if [[ "$CONCURRENT" == "true" ]]; then
  if [[ "$(uname -s)" == "Darwin" ]]; then
    run_igs_macos_terminal "${IG_FILTER[@]}"
  else
    ensure_ig_deps
    run_igs_parallel "${IG_FILTER[@]}"
  fi
  BUILD_EXIT_CODE=$?
else
  ensure_ig_deps
  for ig_short in "${IG_FILTER[@]}"; do
    run_ig "$ig_short"
    if [[ $? -ne 0 ]]; then
      BUILD_EXIT_CODE=1
    fi
  done
fi

# Cleanup if requested and building from temp (child process)
if [[ "$CLEANUP" == "true" && "$FROM_TEMP" != "" ]]; then
  echo "Cleaning up temporary build directory..."
  rm -rf "$ROOT_DIR"
  echo "Cleanup complete."
fi

exit "$BUILD_EXIT_CODE"
