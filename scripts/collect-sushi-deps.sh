#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v yq >/dev/null 2>&1; then
  echo "Error: yq is required to parse sushi-config.yaml files." >&2
  exit 1
fi

sushi_files=()
while IFS= read -r cfg; do
  [[ -z "$cfg" ]] && continue
  sushi_files+=("$cfg")
done < <(find "$repo_root/igs" -name sushi-config.yaml -print)
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

package_cache_dir="${FHIR_PACKAGE_CACHE_DIR:-$HOME/.fhir/packages}"
if [[ ! -d "$package_cache_dir" ]]; then
  echo "Warning: package cache directory not found: $package_cache_dir" >&2
  : > "$installed_deps_file"
else
  : > "$installed_deps_file"
  for pkg_dir in "$package_cache_dir"/*; do
    [[ -d "$pkg_dir" ]] || continue
    pkg_version="$(basename "$pkg_dir")"
    pkg="${pkg_version%%#*}"
    ver="${pkg_version#*#}"
    if [[ -z "$pkg" || -z "$ver" || "$pkg" == "$pkg_version" ]]; then
      continue
    fi
    echo "$pkg $ver" >> "$installed_deps_file"
  done
fi

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
      echo "Installing ${pkg} ${ver}..."
      fhir install "${pkg}" "${ver}"
    done <<< "$missing_list"
  else
    echo "Skipping install."
  fi
else
  echo
  echo "No packages to install."
fi
