#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

echo "download-publisher.sh moved to $ROOT_DIR/update-publisher"
exec "$ROOT_DIR/update-publisher"
