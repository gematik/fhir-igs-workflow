#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# IG-specific extra steps only (shared build flow runs in build-all.sh)

# Sync OperationDefinition includes referenced by module pages.
python3 "$ROOT_DIR/scripts/sync_operation_definitions_from_core.py" --igs diga