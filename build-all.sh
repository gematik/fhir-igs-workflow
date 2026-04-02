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
    INSTALL_SUSHI_DEPS="${INSTALL_SUSHI_DEPS:-auto}" "$deps_script"
  elif [[ -f "$deps_script" ]]; then
    INSTALL_SUSHI_DEPS="${INSTALL_SUSHI_DEPS:-auto}" bash "$deps_script"
  else
    echo "Warning: collect-sushi-deps.sh not found; skipping dependency check"
  fi
}

list_all_igs() {
  local -a igs=()
  local ig_dir

  for ig_dir in "$ROOT_DIR"/igs/*; do
    if [[ -d "$ig_dir" && -f "$ig_dir/ig.ini" ]]; then
      igs+=("$(basename "$ig_dir")")
    fi
  done

  if [[ ${#igs[@]} -eq 0 ]]; then
    return 0
  fi

  local sorted
  sorted=$(printf '%s\n' "${igs[@]}" | sort -u)
  igs=()
  while IFS= read -r line; do igs+=("$line"); done <<< "$sorted"

  if printf '%s\n' "${igs[@]}" | grep -qx 'core'; then
    printf 'core\n'
    printf '%s\n' "${igs[@]}" | grep -vx 'core'
  else
    printf '%s\n' "${igs[@]}"
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

  # Sync OperationDefinition includes from core into this IG (skip for core itself)
  if [[ "$ig_short" != "core" && -f "$ROOT_DIR/scripts/sync_operation_definitions_from_core.py" ]]; then
    python3 "$ROOT_DIR/scripts/sync_operation_definitions_from_core.py" --igs "$ig_short"
  fi

  # pre-build
  if [[ -f "$ig_dir/scripts/pre-build.sh" ]]; then
    if [[ -x "$ig_dir/scripts/pre-build.sh" ]]; then
      (cd "$ig_dir" && "$ig_dir/scripts/pre-build.sh")
    else
      (cd "$ig_dir" && bash "$ig_dir/scripts/pre-build.sh")
    fi
  fi

  # IG Publisher
  local publisher_jar="$ROOT_DIR/input-cache/publisher.jar"
  if [[ ! -f "$publisher_jar" ]]; then
    echo "Error: publisher.jar not found at $publisher_jar. Run update-publisher.sh first." >&2
    exit 1
  fi

  echo "Checking internet connection..."
  local txoption=""
  if curl -sSf tx.fhir.org > /dev/null 2>&1; then
    echo "Online"
  else
    echo "Offline"
    txoption="-tx n/a"
  fi

  export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

  if [[ "${GENONCE_ARGS+x}" == "x" && ${#GENONCE_ARGS[@]} -gt 0 ]]; then
    (cd "$ig_dir" && java -jar "$publisher_jar" -ig . ${txoption:+"$txoption"} "${GENONCE_ARGS[@]}")
  else
    (cd "$ig_dir" && java -jar "$publisher_jar" -ig . ${txoption:+"$txoption"})
  fi

  # IG Publisher v2.2.x may emit this derived artifact in the IG root.
  # Keep working trees clean by removing it after each build.
  local req_from_narrative="$ig_dir/Requirements-fromNarrative.json"
  if [[ -f "$req_from_narrative" ]]; then
    rm -f "$req_from_narrative"
  fi

  # post-build
  if [[ -f "$ig_dir/scripts/post-build.sh" ]]; then
    if [[ -x "$ig_dir/scripts/post-build.sh" ]]; then
      (cd "$ig_dir" && "$ig_dir/scripts/post-build.sh")
    else
      (cd "$ig_dir" && bash "$ig_dir/scripts/post-build.sh")
    fi
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

# Requirements QA gate — abort before any build work if checks fail
run_requirements_qa() {
  local qa_script="$ROOT_DIR/scripts/qa-for-requirements.py"
  if [[ ! -f "$qa_script" ]]; then
    echo "Warning: qa-for-requirements.py not found; skipping QA check"
    return 0
  fi

  echo "Running requirements QA checks..."
  local qa_output
  if ! qa_output=$(python3 "$qa_script" --strict-quality --strict-error-codes 2>&1); then
    echo ""
    echo "========================================" >&2
    echo "ERROR: Requirements QA checks failed." >&2
    echo "Fix the issues below before building." >&2
    echo "========================================" >&2
    echo "$qa_output" >&2
    echo "" >&2
    echo "Tip: run 'python scripts/qa-for-requirements.py' for details," >&2
    echo "     or 'python scripts/qa-for-requirements.py --fix' to auto-fix." >&2
    return 1
  fi
  echo "$qa_output"
  echo "Requirements QA passed."
}

if [[ ${#IG_FILTER[@]} -eq 0 ]]; then
  declare -a all_igs=()
  while IFS= read -r line; do all_igs+=("$line"); done < <(list_all_igs)
  if [[ "$FROM_TEMP" == "" ]]; then
    run_requirements_qa || exit 1
  fi
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
