#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
cd "$PROJECT_ROOT"

# IG-specific extra steps only

# Sync OperationDefinition includes referenced by module pages.
python3 "$ROOT_DIR/scripts/sync_operation_definitions_from_core.py" --igs rx

# Generate Transformed Artifacts by StructureMaps
# if [ -n "$(ls -A input/resources/transformed-kbv-bundles/ 2>/dev/null)" ]; then
#   rm input/resources/transformed-kbv-bundles/*
# fi
# python3 "$SCRIPT_DIR/testscripts/generate-provide-prescription-docs.py"

# Generate Markdown Tables for StructureMaps
./scripts/fml_table.sh
