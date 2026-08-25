#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
HAPI_VALIDATOR_JAR_PATH="${HAPI_VALIDATOR_JAR:-$ROOT_DIR/input-cache/current_hapi_validator.jar}"

exec "$SCRIPT_DIR/run-structuremap-tests.sh" "$HAPI_VALIDATOR_JAR_PATH"
