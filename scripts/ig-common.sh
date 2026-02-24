#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

require_command() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: required command not found: $cmd" >&2
    exit 1
  fi
}

load_ig_config() {
  local ig_short="$1"
  if [[ -z "$ig_short" ]]; then
    echo "Error: IG short name is required" >&2
    exit 1
  fi

  IG_SHORT="$ig_short"
  IG_DIR="$ROOT_DIR/igs/$IG_SHORT"
  if [[ ! -d "$IG_DIR" ]]; then
    echo "Error: IG not found: $IG_SHORT (expected $IG_DIR)" >&2
    exit 1
  fi

  SUSHI_CONFIG_FILE="$IG_DIR/sushi-config.yaml"
  if [[ ! -f "$SUSHI_CONFIG_FILE" ]]; then
    echo "Error: sushi-config.yaml not found for IG: $IG_SHORT" >&2
    exit 1
  fi

  require_command yq

  TARGET=$(yq -r '.version // ""' "$SUSHI_CONFIG_FILE")
  LABEL=$(yq -r '.releaseLabel // ""' "$SUSHI_CONFIG_FILE")
  SUSHI_ID=$(yq -r '.id // ""' "$SUSHI_CONFIG_FILE")

  if [[ -z "$SUSHI_ID" ]]; then
    echo "Error: .id is missing in $SUSHI_CONFIG_FILE" >&2
    exit 1
  fi

  ID=$(echo "$SUSHI_ID" | awk -F. '{ if (($NF == "eu" || $NF == "r4" ) && NF > 1) print $(NF-1)"-"$NF; else print $NF }')

  # Common defaults (can be overridden per-IG)
  PUBLISH_URL_BASE="https://gematik.de/fhir"

  # Comment bubble defaults
  GITHUB_REPO="gematik/fhir-profiles-erpchrg"
  IG_TEMPLATE_NAME="3-BUG-IG-REPORT.yml"
  LINK_PARAMETER="page-link"
  IG_TAG_PARAMETER="ig-tag"
  IG_TAG="$IG_SHORT"

  DEV_BUCKET_PATH="/ig/fhir/$ID/build"
  BALLOT_BUCKET_PATH="/ig/fhir/$ID"
  PROD_BUCKET_PATH="/ig/fhir/$ID"
  DEV_BUCKET="gematik_gemspec_fhir_dev-0"
  BALLOT_BUCKET="gematik_gemspec_fhir_dev-0"
  PROD_BUCKET="gematik_gemspec_fhir_prod-0"

  PREV=""

  : "${BUILD_GENERATE_HEADING_LINKS:=true}"
  : "${BUILD_GENERATE_DRAWIO_IMAGES:=true}"
  : "${BUILD_USE_IGTOOLS:=true}"
  if [[ "${GENONCE_ARGS+x}" != "x" ]]; then
    GENONCE_ARGS=("-no-sushi")
  elif [[ ${#GENONCE_ARGS[@]} -eq 0 ]]; then
    GENONCE_ARGS=("-no-sushi")
  fi

  IG_CONFIG_FILE="$ROOT_DIR/scripts/ig-configs/$IG_SHORT.sh"
  if [[ -f "$IG_CONFIG_FILE" ]]; then
    source "$IG_CONFIG_FILE"
  fi

  if [[ -n "${PUBLISH_URL_BASE:-}" ]]; then
    PUBLISH_URL="$PUBLISH_URL_BASE/$ID/$TARGET"
  fi

  PREV="${PREV:-}"
}