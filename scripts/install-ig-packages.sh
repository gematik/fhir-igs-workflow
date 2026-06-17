#!/usr/bin/env bash
set -uo pipefail

REINSTALL=false
CONFIG_FILE="fhir-packages.conf"
INPUT_CACHE_DIR="./input-cache"

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

while IFS= read -r PACKAGE_URL || [[ -n "$PACKAGE_URL" ]]; do
  PACKAGE_URL="${PACKAGE_URL//$'\r'/}"
  PACKAGE_URL="$(printf '%s' "$PACKAGE_URL" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  [[ -z "$PACKAGE_URL" ]] && continue
  [[ "$PACKAGE_URL" =~ ^# ]] && continue

  VERSION="$(basename "$(dirname "$PACKAGE_URL")")"
  IG_NAME="$(basename "$(dirname "$(dirname "$PACKAGE_URL")")")"

  PACKAGE_FILE="${IG_NAME}-${VERSION}.tgz"
  PACKAGE_PATH="${INPUT_CACHE_DIR}/${PACKAGE_FILE}"

  echo "Checking ${IG_NAME}#${VERSION}"

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

  if [[ "$DOWNLOADED" == "true" || "$REINSTALL" == "true" ]]; then
    echo "Installing ${PACKAGE_FILE}"

    if ! fhir install "$PACKAGE_PATH" --file; then
      echo "WARNING: Install failed, skipping package: ${PACKAGE_FILE}"
      echo
      continue
    fi

    echo "Installed: ${PACKAGE_FILE}"
  fi

  echo

done < "$CONFIG_FILE"

echo "Finished."