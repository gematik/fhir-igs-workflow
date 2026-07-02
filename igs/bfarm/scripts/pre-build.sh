#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
cd "$PROJECT_ROOT"

refresh_special_urls() {
	local refresh_state

	refresh_state="$(python3 "$ROOT_DIR/scripts/refresh-special-urls.py" "$PROJECT_ROOT")"
	if [[ "$refresh_state" == "updated" ]]; then
		echo "special-url list refreshed from fsh-generated/resources; rerunning SUSHI"
		sushi .
	fi
}

source "$ROOT_DIR/scripts/prepare-environment.sh"

refresh_special_urls

# Merge use cases and core includes
if [[ -x "$ROOT_DIR/scripts/merge-use-cases.sh" ]]; then
	"$ROOT_DIR/scripts/merge-use-cases.sh" bfarm
else
	echo "Warning: merge-use-cases.sh not found or not executable"
fi

if [[ -x "$ROOT_DIR/scripts/merge-core-includes.sh" ]]; then
	"$ROOT_DIR/scripts/merge-core-includes.sh" bfarm
else
	echo "Warning: merge-core-includes.sh not found or not executable"
fi
