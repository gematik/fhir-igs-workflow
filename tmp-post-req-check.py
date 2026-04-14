#!/usr/bin/env python3
"""Temporary QA check for requirement detail codes vs gematik-api error codes.

Usage:
  ./tmp-post-req-check.py --ig core
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path


DETAILS_CODE_PATTERN = re.compile(
    r"<th>\s*Details\s+Code\s*</th>\s*<td>\s*([^<\s][^<]*)\s*</td>",
    re.IGNORECASE | re.DOTALL,
)
ERROR_CODE_PATTERN = re.compile(
    r'"errorCode"\s*,\s*"valueString"\s*:\s*"([^"]+)"',
    re.IGNORECASE,
)
OPERATION_ID_PATTERN = re.compile(
    r'data-api-operation-id="([^"]+)"',
    re.IGNORECASE,
)
RESOURCE_TYPE_PATTERN = re.compile(
    r'data-api-fhir-resource-type="([^"]+)"',
    re.IGNORECASE,
)
CAPABILITY_JSON_PATTERN = re.compile(
    r'<div\s+id="CapabilityStatement"[^>]*>\s*<pre>\s*(\{.*?\})\s*</pre>',
    re.IGNORECASE | re.DOTALL,
)
API_DIV_PATTERN = re.compile(
    r"<div\s+([^>]*class=\"[^\"]*gematik-api(?:doc)?[^\"]*\"[^>]*)>",
    re.IGNORECASE,
)
ATTRIBUTE_PATTERN = re.compile(r'([\w-]+)="([^"]*)"')


def get_ig_choices(repo_root: Path) -> list[str]:
    igs_dir = repo_root / "igs"
    if not igs_dir.exists():
        return []
    return sorted(p.name for p in igs_dir.iterdir() if p.is_dir())


def unique_preserve_order(items: list[str]) -> list[str]:
    seen: set[str] = set()
    out: list[str] = []
    for item in items:
        if item not in seen:
            seen.add(item)
            out.append(item)
    return out


def extract_details_codes(req_fd_file: Path) -> list[str]:
    text = req_fd_file.read_text(encoding="utf-8", errors="replace")
    return unique_preserve_order([m.strip() for m in DETAILS_CODE_PATTERN.findall(text)])


def extract_gematik_api_error_codes(target_file: Path) -> list[str]:
    text = target_file.read_text(encoding="utf-8", errors="replace")

    selectors_operation: list[tuple[str | None, str]] = []
    selectors_interaction: list[tuple[str | None, str]] = []
    for div_attrs in API_DIV_PATTERN.findall(text):
        attr_map = {k.lower(): v for k, v in ATTRIBUTE_PATTERN.findall(div_attrs)}
        op_id = attr_map.get("data-api-operation-id")
        interaction = attr_map.get("data-api-fhir-interaction")
        resource_type = attr_map.get("data-api-fhir-resource-type")

        if op_id:
            selectors_operation.append((resource_type, op_id.removesuffix("Operation").lower()))
        if interaction:
            selectors_interaction.append((resource_type, interaction.lower()))

    capability_strings = CAPABILITY_JSON_PATTERN.findall(text)
    capabilities: list[dict] = []
    for capability_string in capability_strings:
        try:
            capabilities.append(json.loads(capability_string))
        except json.JSONDecodeError:
            continue

    def collect_codes_from_extensions(extensions: list[dict]) -> list[str]:
        out: list[str] = []
        for ext in extensions:
            for nested in ext.get("extension", []):
                if nested.get("url") == "errorCode" and isinstance(nested.get("valueString"), str):
                    out.append(nested["valueString"].strip())
        return out

    codes: list[str] = []
    for capability in capabilities:
        for rest in capability.get("rest", []):
            for resource in rest.get("resource", []):
                resource_name = resource.get("type")

                for expected_resource, operation_name in selectors_operation:
                    if expected_resource and resource_name != expected_resource:
                        continue
                    for operation in resource.get("operation", []):
                        if str(operation.get("name", "")).lower() == operation_name:
                            codes.extend(
                                collect_codes_from_extensions(operation.get("extension", []))
                            )

                for expected_resource, interaction_name in selectors_interaction:
                    if expected_resource and resource_name != expected_resource:
                        continue
                    for interaction in resource.get("interaction", []):
                        if str(interaction.get("code", "")).lower() == interaction_name:
                            codes.extend(
                                collect_codes_from_extensions(interaction.get("extension", []))
                            )

    if codes:
        return unique_preserve_order(codes)

    return unique_preserve_order([m.strip() for m in ERROR_CODE_PATTERN.findall(text)])


def build_parser(repo_root: Path) -> argparse.ArgumentParser:
    choices = get_ig_choices(repo_root)
    parser = argparse.ArgumentParser(
        description=(
            "Check that all Details Code values from *-req-fd files are present "
            "1:1 in gematik-api error codes of the paired page."
        )
    )
    parser.add_argument(
        "--ig",
        required=True,
        choices=choices,
        help="IG folder name under igs/",
    )
    return parser


def main() -> int:
    repo_root = Path(__file__).resolve().parent
    args = build_parser(repo_root).parse_args()

    output_dir = repo_root / "igs" / args.ig / "output"
    if not output_dir.exists():
        print(f"ERROR: output folder not found: {output_dir}")
        return 2

    req_candidates = sorted(output_dir.glob("*-req-fd.html")) + sorted(
        output_dir.glob("*-req-fd.md")
    )
    req_by_logical_name: dict[str, Path] = {}
    for candidate in req_candidates:
        logical_name = candidate.name.replace(".html", "").replace(".md", "")
        selected = req_by_logical_name.get(logical_name)
        if selected is None:
            req_by_logical_name[logical_name] = candidate
        elif selected.suffix != ".html" and candidate.suffix == ".html":
            req_by_logical_name[logical_name] = candidate

    req_fd_files = sorted(req_by_logical_name.values())
    if not req_fd_files:
        print(f"No *-req-fd.(html|md) files found in {output_dir}")
        return 0

    checked = 0
    failed = 0

    for req_fd_file in req_fd_files:
        target_base_name = req_fd_file.name.replace("-req-fd", "")
        target_file = req_fd_file.with_name(target_base_name)
        if not target_file.exists() and req_fd_file.suffix == ".md":
            target_file = req_fd_file.with_name(target_base_name.replace(".md", ".html"))
        if not target_file.exists():
            failed += 1
            print(f"FAIL {req_fd_file.name}: paired file missing ({target_file.name})")
            continue

        req_codes = extract_details_codes(req_fd_file)
        api_codes = extract_gematik_api_error_codes(target_file)

        req_set = set(req_codes)
        api_set = set(api_codes)

        missing_in_api = sorted(req_set - api_set)
        extra_in_api = sorted(api_set - req_set)

        checked += 1
        if missing_in_api or extra_in_api:
            failed += 1
            print(f"FAIL {req_fd_file.name} <-> {target_file.name}")
            if missing_in_api:
                print("  Missing in gematik-api:")
                for code in missing_in_api:
                    print(f"    - {code}")
            if extra_in_api:
                print("  Extra in gematik-api:")
                for code in extra_in_api:
                    print(f"    - {code}")
        else:
            print(f"OK   {req_fd_file.name} <-> {target_file.name}")

    print()
    print(
        "Summary: "
        f"checked={checked}, failed={failed}, "
        f"source-files={len(req_fd_files)}"
    )

    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
