#!/usr/bin/env python3
import argparse
import json
import re
import sys
from pathlib import Path

import yaml

URL_ASSIGNMENT_PATTERN = re.compile(r'^\*\s*\^url\s*=\s*"([^"]+)"\s*$')
SUPPORTED_RESOURCE_TYPES = {
    "StructureDefinition",
    "CodeSystem",
    "ValueSet",
    "OperationDefinition",
}


def get_canonical_url(sushi_config_path: Path) -> str:
    with open(sushi_config_path, encoding="utf-8") as f:
        config = yaml.safe_load(f)
    canonical = config.get("canonical", "")
    if not canonical:
        raise RuntimeError("No 'canonical' URL found in sushi-config.yaml")
    return canonical


def collect_all_resource_urls(resources_dir: Path) -> list[str]:
    urls: set[str] = set()

    if not resources_dir.is_dir():
        return []

    for resource_file in sorted(resources_dir.glob("*.json")):
        try:
            resource = json.loads(resource_file.read_text(encoding="utf-8"))
        except json.JSONDecodeError as exc:
            raise RuntimeError(f"Failed to parse JSON: {resource_file}: {exc}") from exc

        if resource.get("resourceType") not in SUPPORTED_RESOURCE_TYPES:
            continue

        url = resource.get("url")
        if isinstance(url, str):
            urls.add(url)

    return sorted(urls)


def collect_special_urls(all_urls: list[str], canonical_prefix: str) -> list[str]:
    special_urls: list[str] = []
    for url in all_urls:
        if not url.startswith(canonical_prefix):
            special_urls.append(url)
    return special_urls


def find_parameters_block(lines: list[str]) -> tuple[int, int]:
    parameters_start = None
    for index, line in enumerate(lines):
        if line.startswith("parameters:"):
            parameters_start = index
            break

    if parameters_start is None:
        raise RuntimeError("Could not find top-level 'parameters:' block in sushi-config.yaml")

    parameters_end = len(lines)
    for index in range(parameters_start + 1, len(lines)):
        line = lines[index]
        stripped = line.strip()
        if not stripped:
            continue
        if stripped.startswith("#"):
            continue
        if not line.startswith((" ", "\t")):
            parameters_end = index
            break

    return parameters_start, parameters_end


def remove_special_url_block(block_lines: list[str]) -> list[str]:
    result: list[str] = []
    index = 0

    while index < len(block_lines):
        line = block_lines[index]
        if line.startswith("  special-url:"):
            index += 1
            while index < len(block_lines):
                current = block_lines[index]
                stripped = current.strip()
                if not stripped:
                    index += 1
                    continue
                if stripped.startswith("#") and current.startswith("    "):
                    index += 1
                    continue
                if current.startswith("    "):
                    index += 1
                    continue
                break
            continue

        result.append(line)
        index += 1

    return result


def insert_special_url_block(block_lines: list[str], urls: list[str]) -> list[str]:
    if not urls:
        return block_lines

    insert_at = 0
    for index, line in enumerate(block_lines):
        if line.startswith("  shownav:"):
            insert_at = index + 1
            break

    new_block = ["  special-url:\n"]
    new_block.extend(f"    - {url}\n" for url in urls)

    return block_lines[:insert_at] + new_block + block_lines[insert_at:]


def refresh_sushi_config(sushi_config_path: Path, urls: list[str]) -> bool:
    original_text = sushi_config_path.read_text(encoding="utf-8")
    lines = original_text.splitlines(keepends=True)

    parameters_start, parameters_end = find_parameters_block(lines)
    parameter_block = lines[parameters_start + 1 : parameters_end]
    parameter_block = remove_special_url_block(parameter_block)
    parameter_block = insert_special_url_block(parameter_block, urls)

    updated_lines = (
        lines[: parameters_start + 1]
        + parameter_block
        + lines[parameters_end:]
    )
    updated_text = "".join(updated_lines)

    if updated_text == original_text:
        return False

    sushi_config_path.write_text(updated_text, encoding="utf-8")
    return True


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("ig_dir", type=Path)
    args = parser.parse_args()

    ig_dir = args.ig_dir.resolve()
    sushi_config_path = ig_dir / "sushi-config.yaml"
    resources_dir = ig_dir / "fsh-generated" / "resources"

    if not sushi_config_path.is_file():
        raise RuntimeError(f"Missing sushi-config.yaml: {sushi_config_path}")

    canonical_url = get_canonical_url(sushi_config_path)
    all_urls = collect_all_resource_urls(resources_dir)
    special_urls = collect_special_urls(all_urls, canonical_url)
    changed = refresh_sushi_config(sushi_config_path, special_urls)

    print("updated" if changed else "unchanged")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except RuntimeError as exc:
        print(f"Error: {exc}", file=sys.stderr)
        raise SystemExit(1)
