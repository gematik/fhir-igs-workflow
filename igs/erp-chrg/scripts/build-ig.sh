#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"

# IG-specific extra steps only (shared build flow runs in build-all.sh)

# Sync OperationDefinition includes referenced by module pages.
python3 "$ROOT_DIR/scripts/sync_operation_definitions_from_core.py" --igs erp-chrg

