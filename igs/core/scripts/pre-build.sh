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

if [[ "${CI:-}" == "true" && "${GITHUB_ACTIONS:-}" == "true" && "${BUILD_GENERATE_DRAWIO_IMAGES:-false}" == "true" ]]; then
	echo "Skipping local draw.io generation in CI (handled by drawio-export-action)"
elif [[ -x "$ROOT_DIR/scripts/generate-drawio-images.sh" ]]; then
	"$ROOT_DIR/scripts/generate-drawio-images.sh" core
else
	echo "Warning: generate-drawio-images.sh not found or not executable"
fi
