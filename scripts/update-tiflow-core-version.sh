#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <ig-directory>" >&2
  exit 1
fi

IG_DIR="$(cd "$1" && pwd)"
SUSHI_CONFIG_FILE="$IG_DIR/sushi-config.yaml"
CONSTANTS_FILE="$IG_DIR/input/data/constants.yaml"

if [[ ! -f "$SUSHI_CONFIG_FILE" ]]; then
  echo "Error: sushi-config.yaml not found: $SUSHI_CONFIG_FILE" >&2
  exit 1
fi

if ! command -v yq >/dev/null 2>&1; then
  echo "Error: required command not found: yq" >&2
  exit 1
fi

version="$(yq -r '.dependencies."de.gematik.tiflow" // ""' "$SUSHI_CONFIG_FILE")"

if [[ -z "$version" ]]; then
  version="$(yq -r 'select(.id == "de.gematik.tiflow") | .version // ""' "$SUSHI_CONFIG_FILE")"
fi

if [[ -z "$version" || "$version" == "null" ]]; then
  echo "No de.gematik.tiflow dependency found for $IG_DIR; constants unchanged"
  exit 0
fi

mkdir -p "$(dirname "$CONSTANTS_FILE")"
touch "$CONSTANTS_FILE"
TIFLOW_CORE_VERSION="$version" yq -i '.tiflow_core_version = strenv(TIFLOW_CORE_VERSION)' "$CONSTANTS_FILE"

echo "Updated tiflow_core_version to $version in $CONSTANTS_FILE"