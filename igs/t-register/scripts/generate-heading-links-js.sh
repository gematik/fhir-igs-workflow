#!/bin/bash

#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IG_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
IG_SHORT="$(basename "$IG_DIR")"

bash "$ROOT_DIR/scripts/generate-heading-links-js.sh" "$IG_SHORT"

