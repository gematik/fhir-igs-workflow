# Run scripts that need artifacts from IG Publisher
./tests/run-all-tests.sh
./scripts/fml_table.sh

download_validator_if_missing() {
    local target_jar="$1"
    local download_url="${FHIR_VALIDATOR_URL:-https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar}"

    if [[ -f "$target_jar" ]]; then
        return 0
    fi

    mkdir -p "$(dirname "$target_jar")"
    echo "HAPI validator jar not found at $target_jar"
    echo "Attempting download from: $download_url"

    local tmp_jar
    tmp_jar="$(mktemp "${target_jar}.tmp.XXXXXX")"

    if command -v curl >/dev/null 2>&1; then
        if ! curl -fsSL "$download_url" -o "$tmp_jar"; then
            rm -f "$tmp_jar"
            return 1
        fi
    elif command -v wget >/dev/null 2>&1; then
        if ! wget -qO "$tmp_jar" "$download_url"; then
            rm -f "$tmp_jar"
            return 1
        fi
    else
        echo "Error: neither curl nor wget is available to download validator_cli.jar"
        rm -f "$tmp_jar"
        return 1
    fi

    mv "$tmp_jar" "$target_jar"
    echo "Downloaded HAPI validator jar to: $target_jar"
    return 0
}

# Resolve HAPI validator JAR path in a portable way.
# Priority: explicit env vars -> ~/.fhir/validators/validator_cli.jar
HAPI_JAR="${FHIR_VALIDATOR_JAR:-${HAPI_VALIDATOR_JAR:-$HOME/.fhir/validators/validator_cli.jar}}"

if ! download_validator_if_missing "$HAPI_JAR"; then
    echo "Error: Unable to download HAPI validator jar: $HAPI_JAR"
    echo "Set FHIR_VALIDATOR_JAR (or HAPI_VALIDATOR_JAR), or place validator_cli.jar at ~/.fhir/validators/validator_cli.jar"
    exit 1
fi

if [[ ! -f "$HAPI_JAR" ]]; then
    echo "Error: HAPI validator jar not found: $HAPI_JAR"
    echo "Set FHIR_VALIDATOR_JAR (or HAPI_VALIDATOR_JAR), or place validator_cli.jar at ~/.fhir/validators/validator_cli.jar"
    exit 1
fi

# Run Transformation of Mapping Bundle
# Create a temporary directory containing only the StructureMaps to avoid loading example bundles
TEMP_IG_DIR=$(mktemp -d)
trap "rm -rf '$TEMP_IG_DIR'" EXIT

for sm_file in ./fsh-generated/resources/StructureMap-*.json; do
    cp "$sm_file" "$TEMP_IG_DIR/"
done

# Use modern HAPI 6.8+ syntax: transform URL input_file
java -jar "$HAPI_JAR" \
    transform https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapCarbonCopy \
    ./fsh-generated/resources/Bundle-Mapping-Bundle.json \
    -version 4.0.1 \
    -output ./input/content/Bundle-erp-t-prescription-carbon-copy-actual.json \
    -ig "$TEMP_IG_DIR" \
    -ig de.gematik.erezept-workflow.r4 \
    -ig kbv.ita.erp \
    -ig de.gematik.ti#1.1.0
