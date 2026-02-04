#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPDATE_SCRIPT="$SCRIPT_DIR/_updatePublisher.sh"

if [[ ! -x "$UPDATE_SCRIPT" ]]; then
  echo "Error: _updatePublisher.sh not found or not executable at $UPDATE_SCRIPT" >&2
  exit 1
fi

cd "$SCRIPT_DIR"
exec "$UPDATE_SCRIPT" "$@"