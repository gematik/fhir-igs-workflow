#!/usr/bin/env bash

set -euo pipefail

# ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INPUT_CACHE="$ROOT_DIR/input-cache"
VALIDATOR_JAR="$INPUT_CACHE/current_hapi_validator.jar"

VALIDATOR_URL="https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar"

mkdir -p "$INPUT_CACHE"

if [[ -f "$VALIDATOR_JAR" ]]; then
    echo "Validator bereits installiert:"
    echo "  $VALIDATOR_JAR"
    exit 0
fi

echo "Lade Validator herunter..."

curl -fL "$VALIDATOR_URL" -o "$VALIDATOR_JAR"

echo "Validator installiert:"
echo "  $VALIDATOR_JAR"