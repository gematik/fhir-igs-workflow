#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IG_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HAPI_VALIDATOR_JAR_PATH="${1:?Usage: run-structuremap-tests.sh <validator-jar>}"

# Packages required by HAPI in addition to the SUSHI dependencies.
# Pin a package by appending its version, e.g. "kbv.ita.erp#1.4.3".
HAPI_VALIDATOR_DEPENDENCIES=(
	"de.gematik.erezept-workflow.r4#1.6.4"
	"kbv.ita.erp#1.4.4"
	"de.gematik.fhir.directory#1.2.0"
	"de.gematik.ti#1.4.0-ballot.2"
	"hl7.fhir.uv.xver-r5.r4#0.1.0"
	"de.gematik.epa.medication#1.3.5"
)

export HAPI_VALIDATOR_IGS="$(printf '%s\n' "${HAPI_VALIDATOR_DEPENDENCIES[@]}")"

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

	find ./fsh-generated/resources -maxdepth 1 -type f -name '*-mapping-bundle.json' | sort | head -n 1
}

if [[ ! -f "$HAPI_VALIDATOR_JAR_PATH" ]]; then
	echo "HAPI validator missing: $HAPI_VALIDATOR_JAR_PATH" >&2
	exit 1
fi

cd "$IG_DIR"
./tests/run-all-tests.sh
./scripts/fml_table.sh

MAPPING_BUNDLE_SOURCE="$(resolve_mapping_bundle_source || true)"
if [[ -z "$MAPPING_BUNDLE_SOURCE" ]]; then
	echo "No mapping bundle source file found for StructureMap transform." >&2
	exit 1
fi

TEMP_IG_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_IG_DIR"' EXIT

find ./fsh-generated/resources -maxdepth 1 -type f \( \
	-name 'StructureMap-*.json' -o -name 'StructureDefinition-*.json' \
\) -exec cp {} "$TEMP_IG_DIR/" \;

VALIDATOR_IG_ARGS=( -ig "$TEMP_IG_DIR" )
for dependency in "${HAPI_VALIDATOR_DEPENDENCIES[@]}"; do
	VALIDATOR_IG_ARGS+=( -ig "$dependency" )
done

java -jar "$HAPI_VALIDATOR_JAR_PATH" \
	"$MAPPING_BUNDLE_SOURCE" \
	-transform "https://gematik.de/fhir/tiflow-bfarm/StructureMap/ERPTPrescriptionStructureMapCarbonCopy" \
	-version 4.0.1 \
	-output "./input/content/Bundle-erp-t-prescription-carbon-copy-actual.json" \
	"${VALIDATOR_IG_ARGS[@]}"