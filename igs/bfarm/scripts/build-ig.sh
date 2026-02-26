SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"

resolve_hapi_validator_jar() {
	local -a candidates=()

	if [[ -n "${HAPI_VALIDATOR_JAR:-}" ]]; then
		candidates+=("$HAPI_VALIDATOR_JAR")
	fi

	candidates+=(
		"$ROOT_DIR/input-cache/current_hapi_validator.jar"
		"$HOME/dev/validators/current_hapi_validator.jar"
	)

	local candidate
	for candidate in "${candidates[@]}"; do
		if [[ -n "$candidate" && -f "$candidate" ]]; then
			echo "$candidate"
			return 0
		fi
	done

	return 1
}

resolve_mapping_bundle_source() {
	local -a candidates=(
		"./fsh-generated/resources/Bundle-Mapping-Bundle.json"
		"./fsh-generated/resources/example-case-04-mapping-bundle.json"
	)

	local candidate
	for candidate in "${candidates[@]}"; do
		if [[ -f "$candidate" ]]; then
			echo "$candidate"
			return 0
		fi
	done

	local first_generated
	first_generated="$(find ./fsh-generated/resources -maxdepth 1 -type f -name '*-mapping-bundle.json' | sort | head -n 1)"
	if [[ -n "$first_generated" ]]; then
		echo "$first_generated"
		return 0
	fi

	return 1
}

# IG-specific extra steps only

# Run scripts that need artifacts from IG Publisher
./tests/run-all-tests.sh
./scripts/fml_table.sh

# Run Transformation of Mapping Bundle
HAPI_VALIDATOR_JAR_PATH="$(resolve_hapi_validator_jar || true)"

if [[ -z "$HAPI_VALIDATOR_JAR_PATH" ]]; then
	echo "❌ Error: HAPI validator not found." >&2
	echo "Looked in:" >&2
	echo "  - HAPI_VALIDATOR_JAR env var" >&2
	echo "  - $ROOT_DIR/input-cache/current_hapi_validator.jar" >&2
	echo "  - $HOME/dev/validators/current_hapi_validator.jar" >&2
	echo >&2
	echo "Set HAPI_VALIDATOR_JAR to your validator_cli.jar path or place the jar in one of the locations above." >&2
	echo "Download from: https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar" >&2
	exit 1
fi

MAPPING_BUNDLE_SOURCE="$(resolve_mapping_bundle_source || true)"

if [[ -z "$MAPPING_BUNDLE_SOURCE" ]]; then
	echo "❌ Error: No mapping bundle source file found for StructureMap transform." >&2
	echo "Looked in:" >&2
	echo "  - ./fsh-generated/resources/Bundle-Mapping-Bundle.json" >&2
	echo "  - ./fsh-generated/resources/example-case-04-mapping-bundle.json" >&2
	echo "  - ./fsh-generated/resources/*-mapping-bundle.json" >&2
	exit 1
fi

java -jar "$HAPI_VALIDATOR_JAR_PATH" "$MAPPING_BUNDLE_SOURCE" -transform https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapCarbonCopy -version 4.0.1 -ig ./fsh-generated/resources -output ./input/content/Bundle-erp-t-prescription-carbon-copy-actual.json -ig de.gematik.erezept-workflow.r4 -ig kbv.ita.erp -ig de.gematik.ti#1.1.0
