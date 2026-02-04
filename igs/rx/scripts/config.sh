if [ -n "${BASH_SOURCE:-}" ]; then
	_config_source="${BASH_SOURCE[0]}"
elif [ -n "${ZSH_VERSION:-}" ]; then
	_config_source="${(%):-%N}"
else
	_config_source="$0"
fi
SCRIPT_DIR_L="$(cd "$(dirname "$_config_source")" && pwd)"
SUSHI_CONFIG_FILE="$SCRIPT_DIR_L/../sushi-config.yaml"

TARGET=$(yq '.version' "$SUSHI_CONFIG_FILE")
LABEL=$(yq '.releaseLabel' "$SUSHI_CONFIG_FILE")
ID=$(yq '.id' "$SUSHI_CONFIG_FILE" | awk -F. '{ if (($NF == "eu" || $NF == "r4" ) && NF > 1) print $(NF-1)"-"$NF; else print $NF }')

PUBLISH_URL=https://gematik.de/fhir/$ID/$TARGET
PREV="" # Leave empty to skip moving

DEV_BUCKET_PATH=/ig/fhir/$ID/build
BALLOT_BUCKET_PATH=/ig/fhir/$ID
PROD_BUCKET_PATH=/ig/fhir/$ID
DEV_BUCKET=gematik_gemspec_fhir_dev-0
BALLOT_BUCKET=gematik_gemspec_fhir_dev-0
PROD_BUCKET=gematik_gemspec_fhir_prod-0

# Parameters for Comment Bubbles
GITHUB_REPO=gematik/fhir-profiles-erp
IG_TEMPLATE_NAME=3-BUG-IG-REPORT.yml
LINK_PARAMETER=page-link