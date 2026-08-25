#!/usr/bin/env bash

set -euo pipefail

# ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INPUT_CACHE="$ROOT_DIR/input-cache"
VALIDATOR_JAR="$INPUT_CACHE/current_hapi_validator.jar"
VALIDATOR_VERSION="${HAPI_VALIDATOR_VERSION:-6.5.26}"
VALIDATOR_URL="${HAPI_VALIDATOR_URL:-https://github.com/hapifhir/org.hl7.fhir.core/releases/download/${VALIDATOR_VERSION}/validator_cli.jar}"

mkdir -p "$INPUT_CACHE"

is_validator_archive() {
    [[ -s "$1" ]] \
        && [[ "$(wc -c < "$1")" -gt 1000000 ]] \
        && [[ "$(head -c 2 "$1")" == "PK" ]]
}

if [[ -f "$VALIDATOR_JAR" ]]; then
    if is_validator_archive "$VALIDATOR_JAR"; then
        echo "Validator bereits installiert:"
        echo "  $VALIDATOR_JAR"
        exit 0
    fi

    echo "Entferne ungueltigen Validator-Cache: $VALIDATOR_JAR" >&2
    rm -f "$VALIDATOR_JAR"
fi

echo "Lade HAPI Validator ${VALIDATOR_VERSION} herunter..."

TEMP_VALIDATOR_JAR="$(mktemp "$INPUT_CACHE/validator_cli.XXXXXX.jar")"
trap 'rm -f "$TEMP_VALIDATOR_JAR"' EXIT

curl -fL --retry 3 --retry-delay 2 "$VALIDATOR_URL" -o "$TEMP_VALIDATOR_JAR"

if ! is_validator_archive "$TEMP_VALIDATOR_JAR"; then
    echo "Der heruntergeladene Validator ist keine ausfuehrbare JAR-Datei." >&2
    exit 1
fi

mv "$TEMP_VALIDATOR_JAR" "$VALIDATOR_JAR"
trap - EXIT

echo "Validator installiert:"
echo "  $VALIDATOR_JAR"