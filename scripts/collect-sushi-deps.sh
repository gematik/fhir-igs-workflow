#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v yq >/dev/null 2>&1; then
  echo "Error: yq is required to parse sushi-config.yaml files." >&2
  exit 1
fi

mapfile -t sushi_files < <(find "$repo_root/igs" -name sushi-config.yaml -print)
if [[ ${#sushi_files[@]} -eq 0 ]]; then
  echo "No sushi-config.yaml files found under $repo_root/igs." >&2
  exit 1
fi

all_deps_file="$(mktemp)"
installed_deps_file="$(mktemp)"

cleanup() {
  rm -f "$all_deps_file" "$installed_deps_file"
}
trap cleanup EXIT

for cfg in "${sushi_files[@]}"; do
  yq eval '.dependencies // {} | to_entries | .[] | "\(.key) \(.value)"' "$cfg" >> "$all_deps_file"
done

sort -u -o "$all_deps_file" "$all_deps_file"

python - <<'PY' "$repo_root" "$installed_deps_file"
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
out_path = pathlib.Path(sys.argv[2])
pairs = set()

for path in root.rglob("fhirpkg.lock.json"):
    try:
        data = json.loads(path.read_text())
    except Exception:
        continue
    deps = data.get("dependencies") or {}
    for key, value in deps.items():
        pairs.add(f"{key} {value}")

out_path.write_text("\n".join(sorted(pairs)) + ("\n" if pairs else ""))
PY

sort -u -o "$installed_deps_file" "$installed_deps_file"

installed_list=$(comm -12 "$all_deps_file" "$installed_deps_file" || true)
missing_list=$(comm -23 "$all_deps_file" "$installed_deps_file" || true)

format_list() {
  local input="$1"
  if [[ -z "$input" ]]; then
    echo "  (none)"
    return
  fi
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    local pkg="${line%% *}"
    local ver="${line#* }"
    echo "  - ${pkg}#${ver}"
  done <<< "$input"
}

echo "Already installed (from fhirpkg.lock.json):"
format_list "$installed_list"

echo

echo "To install (from sushi-config.yaml):"
format_list "$missing_list"

if [[ -n "$missing_list" ]]; then
  echo
  read -r -p "Install now (y/n)? " answer
  if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    while IFS= read -r line; do
      [[ -z "$line" ]] && continue
      pkg="${line%% *}"
      ver="${line#* }"
      echo "Installing ${pkg}#${ver}..."
      fhirpkg install "${pkg}#${ver}"
    done <<< "$missing_list"
  else
    echo "Skipping install."
  fi
else
  echo
  echo "No packages to install."
fi
