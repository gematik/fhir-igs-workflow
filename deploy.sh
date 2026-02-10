#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$ROOT_DIR/scripts/ig-common.sh"

usage() {
  echo "Usage: $0 --ig <name> [--env DEV|BALLOT|PROD] [--bucket DEV|BALLOT|PROD] [--build]"
  echo "Example: $0 --ig erpchrg --env DEV"
  echo "         $0 --ig erpchrg --env DEV --build"
  echo "         $0 --ig erpchrg --env DEV --bucket DEV"
}

IG_SHORT=""
IG_COUNT=0
DO_BUILD=false
ENVIRONMENT="${ENVIRONMENT:-}"
BUCKET_ENV="PROD"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --ig)
      shift
      IG_SHORT="${1:-}"
      if [[ -z "$IG_SHORT" ]]; then
        echo "Error: --ig requires a value" >&2
        usage
        exit 1
      fi
      IG_COUNT=$((IG_COUNT + 1))
      shift
      ;;
    --build)
      DO_BUILD=true
      shift
      ;;
    --env)
      shift
      ENVIRONMENT="${1:-}"
      if [[ -z "$ENVIRONMENT" ]]; then
        echo "Error: --env requires a value" >&2
        usage
        exit 1
      fi
      shift
      ;;
    --bucket)
      shift
      BUCKET_ENV="${1:-}"
      if [[ -z "$BUCKET_ENV" ]]; then
        echo "Error: --bucket requires a value" >&2
        usage
        exit 1
      fi
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$IG_SHORT" ]]; then
  usage
  exit 1
fi

if [[ "$IG_COUNT" -gt 1 ]]; then
  echo "Error: --ig can only be specified once." >&2
  usage
  exit 1
fi

load_ig_config "$IG_SHORT"

if [[ -z "$ENVIRONMENT" ]]; then
  echo "Error: ENVIRONMENT not set. Use --env DEV|BALLOT|PROD or set ENVIRONMENT." >&2
  exit 1
fi

ENVIRONMENT="$(printf '%s' "$ENVIRONMENT" | tr '[:lower:]' '[:upper:]')"
BUCKET_ENV="$(printf '%s' "$BUCKET_ENV" | tr '[:lower:]' '[:upper:]')"

require_command gcloud
require_command gsutil

# Check gcloud authentication
if ! gcloud auth list --filter=status:ACTIVE --format="value(account)" | grep -q .; then
  echo "No valid gcloud authentication found. Trying authentication..."
  gcloud auth login
fi

if ! gcloud projects list --limit=1 >/dev/null 2>&1; then
  echo "No accessible projects found. Trying authentication..."
  gcloud auth login
  if ! gcloud projects list --limit=1 >/dev/null 2>&1; then
    echo "Error: gcloud authentication failed or no project access." >&2
    echo "Hint: ensure your account has access to a GCP project." >&2
    exit 1
  fi
fi

BUCKET_NAME=""
BUCKET_PATH=""

if [[ "$ENVIRONMENT" == "DEV" ]]; then
  if [[ "$LABEL" != "ci-build" ]]; then
    echo "Error: For ENVIRONMENT 'DEV', releaseLabel must be 'ci-build'." >&2
    exit 1
  fi
  if [[ ! "$TARGET" =~ -draft$ ]]; then
    echo "Error: For ENVIRONMENT 'DEV', version must end with '-draft'." >&2
    exit 1
  fi
elif [[ "$ENVIRONMENT" == "BALLOT" ]]; then
  if [[ "$LABEL" != "ballot" ]]; then
    echo "Error: For ENVIRONMENT 'BALLOT', releaseLabel must be 'ballot'." >&2
    exit 1
  fi
  if [[ ! "$TARGET" =~ -ballot[0-9]+$ ]]; then
    echo "Error: For ENVIRONMENT 'BALLOT', version must end with '-ballotN'." >&2
    exit 1
  fi
elif [[ "$ENVIRONMENT" == "PROD" ]]; then
  if [[ "$LABEL" != "release" ]]; then
    echo "Error: For ENVIRONMENT 'PROD', releaseLabel must be 'release'." >&2
    exit 1
  fi
  if [[ ! "$TARGET" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: For ENVIRONMENT 'PROD', version must be SemVer like x.y.z." >&2
    exit 1
  fi
else
  echo "Error: ENVIRONMENT must be DEV, BALLOT, or PROD." >&2
  exit 1
fi

if [[ "$BUCKET_ENV" == "DEV" ]]; then
  BUCKET_NAME="$DEV_BUCKET"
  BUCKET_PATH="$DEV_BUCKET_PATH"
elif [[ "$BUCKET_ENV" == "BALLOT" ]]; then
  BUCKET_NAME="$BALLOT_BUCKET"
  BUCKET_PATH="$BALLOT_BUCKET_PATH"
elif [[ "$BUCKET_ENV" == "PROD" ]]; then
  BUCKET_NAME="$PROD_BUCKET"
  BUCKET_PATH="$PROD_BUCKET_PATH"
else
  echo "Error: --bucket must be DEV, BALLOT, or PROD." >&2
  exit 1
fi

echo "Using bucket: ${BUCKET_ENV} (gs://${BUCKET_NAME}${BUCKET_PATH})"

if $DO_BUILD; then
  "$ROOT_DIR/build-all.sh" --ig "$IG_SHORT"
else
  echo "Skipping build step (use --build to run build)."
fi

cd "$IG_DIR"

if gsutil ls "gs://$BUCKET_NAME$BUCKET_PATH/$TARGET" >/dev/null 2>&1; then
  echo "TARGET directory already exists: $TARGET"
  if [[ -n "$PREV" ]]; then
    echo "Moving TARGET to PREV: $PREV"
    gcloud storage mv "gs://$BUCKET_NAME$BUCKET_PATH/$TARGET" "gs://$BUCKET_NAME$BUCKET_PATH/$PREV"
  fi
  echo "Deleting existing TARGET: $TARGET"
  gcloud storage rm --recursive "gs://$BUCKET_NAME$BUCKET_PATH/$TARGET"
else
  echo "TARGET directory does not exist"
fi

echo "Uploading new version to TARGET: ${TARGET}"
if [[ ! -d "$IG_DIR/output" ]]; then
  echo "Error: output directory not found. Run build first." >&2
  exit 1
fi

gsutil -m -h "Cache-Control:no-cache" cp -r "$IG_DIR/output"/* "gs://$BUCKET_NAME$BUCKET_PATH/$TARGET/"

echo "Successfully published on https://gemspec.gematik.de${BUCKET_PATH}/${TARGET}"
if [[ -n "${PUBLISH_URL:-}" ]]; then
  echo "Publish URL: ${PUBLISH_URL}"
fi
