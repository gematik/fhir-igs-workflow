#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Warning: ./scripts/build-ig.sh is deprecated. Use 'fhirscripts build pipeline' from the IG directory."

# Keep backwards compatibility for callers that still invoke build-ig.sh directly.
exec "$SCRIPT_DIR/post-build.sh"
