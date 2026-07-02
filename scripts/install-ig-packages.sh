#!/usr/bin/env bash
set -uo pipefail

REINSTALL=false
CONFIG_FILE="fhir-packages.conf"
INPUT_CACHE_DIR="./input-cache"
FHIR_PACKAGE_CACHE="${FHIR_PACKAGE_CACHE:-$HOME/.fhir/packages}"

for ARG in "$@"; do
  case "$ARG" in
    --reinstall)
      REINSTALL=true
      ;;
    *)
      CONFIG_FILE="$ARG"
      ;;
  esac
done

mkdir -p "$INPUT_CACHE_DIR"

get_package_json_value() {
  local package_path="$1"
  local key="$2"

  tar -xOf "$package_path" package/package.json 2>/dev/null \
    | sed -n "s/.*\"$key\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" \
    | head -n 1
}

is_package_installed() {
  local package_id="$1"
  local package_version="$2"

  [[ -d "$FHIR_PACKAGE_CACHE/${package_id}#${package_version}" ]]
}

while IFS= read -r PACKAGE_URL || [[ -n "$PACKAGE_URL" ]]; do
  PACKAGE_URL="${PACKAGE_URL//$'\r'/}"
  PACKAGE_URL="$(printf '%s' "$PACKAGE_URL" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  [[ -z "$PACKAGE_URL" ]] && continue
  [[ "$PACKAGE_URL" =~ ^# ]] && continue

  VERSION_FROM_URL="$(basename "$(dirname "$PACKAGE_URL")")"
  IG_NAME_FROM_URL="$(basename "$(dirname "$(dirname "$PACKAGE_URL")")")"

  PACKAGE_FILE="${IG_NAME_FROM_URL}-${VERSION_FROM_URL}.tgz"
  PACKAGE_PATH="${INPUT_CACHE_DIR}/${PACKAGE_FILE}"

  echo "Checking ${IG_NAME_FROM_URL}#${VERSION_FROM_URL}"

  DOWNLOADED=false

  if [[ -f "$PACKAGE_PATH" ]]; then
    echo "Already downloaded: ${PACKAGE_FILE}"
  else
    echo "Downloading ${PACKAGE_URL}"

    if ! curl -fsSL "$PACKAGE_URL" -o "$PACKAGE_PATH"; then
      echo "WARNING: Download failed, skipping package: ${PACKAGE_URL}"
      rm -f "$PACKAGE_PATH"
      echo
      continue
    fi

    DOWNLOADED=true
  fi

  PACKAGE_ID="$(get_package_json_value "$PACKAGE_PATH" "name")"
  PACKAGE_VERSION="$(get_package_json_value "$PACKAGE_PATH" "version")"

  if [[ -z "$PACKAGE_ID" || -z "$PACKAGE_VERSION" ]]; then
    echo "WARNING: Could not read package id/version from ${PACKAGE_FILE}"
    echo
    continue
  fi

  echo "Package: ${PACKAGE_ID}#${PACKAGE_VERSION}"

  if is_package_installed "$PACKAGE_ID" "$PACKAGE_VERSION"; then
    echo "Already installed: ${PACKAGE_ID}#${PACKAGE_VERSION}"

    if [[ "$REINSTALL" != "true" ]]; then
      echo
      continue
    fi

    echo "Reinstall requested."
  fi

  if [[ "$DOWNLOADED" == "true" || "$REINSTALL" == "true" ]] || ! is_package_installed "$PACKAGE_ID" "$PACKAGE_VERSION"; then
    echo "Installing ${PACKAGE_FILE}"

    if ! fhir install "$PACKAGE_PATH" --file; then
      echo "WARNING: Install failed, skipping package: ${PACKAGE_FILE}"
      echo
      continue
    fi

    echo "Installed: ${PACKAGE_ID}#${PACKAGE_VERSION}"
  fi

  echo

done < "$CONFIG_FILE"

echo "Finished."