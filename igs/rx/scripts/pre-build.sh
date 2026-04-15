#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
cd "$PROJECT_ROOT"

refresh_special_urls() {
	local status

	status="$(python3 "$ROOT_DIR/scripts/refresh-special-urls.py" "$PROJECT_ROOT")"
	if [[ "$status" == "updated" ]]; then
		echo "special-url list refreshed from fsh-generated/resources; rerunning SUSHI"
		sushi .
	fi
}

refresh_special_urls

# IG-specific extra steps only

# Generate Transformed Artifacts by StructureMaps
# if [ -n "$(ls -A input/resources/transformed-kbv-bundles/ 2>/dev/null)" ]; then
#   rm input/resources/transformed-kbv-bundles/*
# fi
# python3 "$SCRIPT_DIR/testscripts/generate-provide-prescription-docs.py"

# Generate Markdown Tables for StructureMaps
./scripts/fml_table.sh
