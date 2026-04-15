#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
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

