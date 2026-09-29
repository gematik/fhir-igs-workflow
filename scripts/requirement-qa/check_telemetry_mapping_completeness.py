#!/usr/bin/env python3
"""Validate telemetry ConceptMaps against OperationOutcomeDetails ValueSets.

Check required mappings, reject codes absent from the defining ValueSet (or JSON
error tables), and reject duplicate telemetry target codes across IGs.
Only the CSV report is written; FSH resources are never modified.

Exit codes:
    0 - No findings.
    1 - One or more validation findings.
"""

from __future__ import annotations

import argparse
import csv
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Set


# Regex to extract code definitions from a FSH CodeSystem file.
# Matches lines like: * #TIFLOW_SECRET_MISMATCH "display" "description"
CS_CODE_RE = re.compile(r"^\* #(\S+)\s+\"", re.MULTILINE)

# Regex to extract individually included codes from a FSH ValueSet file.
# Matches lines like: * include $ti-oo#SVC_IDENTITY_MISMATCH "display"
# and:              * include TIOperationOutcomeDetailsCS#SVC_INACTIVE_CODE
# Group 1: system reference (without leading $), Group 2: code
VS_INCLUDE_CODE_RE = re.compile(
    r"^\*\s+include\s+\$?(\S+)#(\S+)(?:\s+\"[^\"]*\")?\s*$",
    re.MULTILINE,
)
VS_INCLUDE_SYSTEM_RE = re.compile(
    r"^\*\s+include\s+codes\s+from\s+system\s+\$?(\S+)\s*$", re.MULTILINE
)

# Regex to extract alias definitions from a FSH aliases file.
# Matches lines like: Alias: $ti-oo = https://gematik.de/fhir/ti/CodeSystem/...
ALIAS_RE = re.compile(r"^Alias:\s+\$(\S+)\s*=\s*(\S+)", re.MULTILINE)

# Regex to extract Error Code values from error-code-json HTML tables in markdown files.
# Matches the <td> content after a <th>Error Code</th> row.
JSON_ERROR_CODE_RE = re.compile(
    r'<table\s+id="error-code-json"[^>]*>.*?'
    r"<th>Error Code</th>\s*<td>([^<]+)</td>",
    re.DOTALL,
)

# Regexes to extract element and target mappings from the ConceptMap FSH file.
# The parser accepts both legacy numeric paths and FSH's append syntax.
CM_ELEMENT_CODE_RE = re.compile(
    r"^\s*\*\s+group\[.*?\]\.element\[(?:\d+|\+|=)\]\.code\s*=\s*#(\S+)",
    re.MULTILINE,
)

CM_TARGET_CODE_RE = re.compile(
    r"^\s*\*\s+group\[.*?\]\.element\[(?:\d+|\+|=)\]\.target\[(?:\d+|\+|=)\]\.code\s*=\s*#(\S+)",
    re.MULTILINE,
)
CM_ELEMENT_START_RE = re.compile(
    r"^\s*\*\s+group\[.*?\]\.element\[(?:\d+|\+|=)\]\s*$"
)
CM_TARGET_START_RE = re.compile(r"^\s*\*\s+target\[(?:\d+|\+|=)\]\s*$")
CM_NESTED_CODE_RE = re.compile(r"^\s*\*\s+code\s*=\s*#(\S+)")

@dataclass
class Finding:
    type: str
    codesystem_file: str
    code: str
    message: str


# Regex to extract the CodeSystem Id from a FSH CodeSystem file.
# Matches lines like: Id: tiflow-operation-outcome-details-cs
CS_ID_RE = re.compile(r"^Id:\s*(\S+)", re.MULTILINE)

# Regex to extract the CodeSystem name from a FSH CodeSystem file.
# Matches lines like: CodeSystem: TIFLOWOperationOutcomeDetailsCS
CS_NAME_RE = re.compile(r"^CodeSystem:\s*(\S+)", re.MULTILINE)

# Regex to extract explicit URL from CodeSystem FSH (if present).
# Matches lines like: * ^url = "https://..."
CS_URL_RE = re.compile(r"^\*\s+\^url\s*=\s*\"([^\"]+)\"", re.MULTILINE)

# Regex to find the CodeSystem URL used as source in a ConceptMap group.
CM_GROUP_SOURCE_URL_RE = re.compile(
    r"^\s*\*\s+group\[\+\]\.source\s*=\s*\"([^\"]+)\""
    r"|^\s*\*\s+group\[\+\]\s*$\s*^\s*\*\s+source\s*=\s*\"([^\"]+)\"",
    re.MULTILINE,
)

# Discovery patterns for OperationOutcomeDetails artifacts.
CODESYSTEM_DISCOVERY_GLOB = "*CS_OperationOutcomeDetails*.fsh"
VALUESET_DISCOVERY_GLOB = "*VS_OperationOutcomeDetails*.fsh"

# Fallback base URL for CodeSystems when URL is not explicitly declared in FSH.
DEFAULT_CODESYSTEM_URL_BASE = "https://gematik.de/fhir/erp/CodeSystem"

# External system names used in ValueSet includes that are not declared as aliases.
EXTERNAL_SYSTEM_REF_URLS = {
    "TIOperationOutcomeDetailsCS": "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
}


def parse_codesystem_codes(fsh_path: Path) -> Set[str]:
    """Extract all code identifiers from a FSH CodeSystem file."""
    content = fsh_path.read_text(encoding="utf-8")
    return set(CS_CODE_RE.findall(content))


def parse_valueset_individual_codes(fsh_path: Path) -> List[tuple[str, str]]:
    """Extract individually included codes from a FSH ValueSet file.

    Only picks up lines like: * include $alias#CODE "display"
    and * include SystemName#CODE
    (not 'include codes from system' which imports entire CodeSystems).
    Returns a list of (system reference, code) tuples.
    """
    content = fsh_path.read_text(encoding="utf-8")
    return VS_INCLUDE_CODE_RE.findall(content)


def parse_aliases(ig_roots: List[Path]) -> Dict[str, str]:
    """Parse FSH alias definitions from aliases.fsh files.

    Returns a dict mapping alias name (without $) to the resolved URL.
    """
    aliases: Dict[str, str] = {}
    for ig_root in ig_roots:
        for alias_file in ig_root.rglob("aliases.fsh"):
            content = alias_file.read_text(encoding="utf-8")
            for match in ALIAS_RE.finditer(content):
                aliases[match.group(1)] = match.group(2)
    return aliases


def parse_codesystem_id(fsh_path: Path) -> str | None:
    """Extract the CodeSystem Id from a FSH CodeSystem file."""
    content = fsh_path.read_text(encoding="utf-8")
    match = CS_ID_RE.search(content)
    return match.group(1) if match else None


def parse_codesystem_name(fsh_path: Path) -> str | None:
    """Extract the CodeSystem name from a FSH CodeSystem file."""
    content = fsh_path.read_text(encoding="utf-8")
    match = CS_NAME_RE.search(content)
    return match.group(1) if match else None


def _parse_mapping_entries(content: str) -> List[tuple[str, str | None]]:
    # Parse line by line, tracking element code and target code pairs. Both the
    # legacy flat paths and nested FSH rules are accepted.
    result: List[tuple[str, str | None]] = []
    current_element_code: str | None = None
    has_target = False
    nested_element = False
    nested_target = False

    for line in content.splitlines():
        elem_match = CM_ELEMENT_CODE_RE.match(line)
        if elem_match:
            if current_element_code is not None and not has_target:
                result.append((current_element_code, None))
            current_element_code = elem_match.group(1)
            has_target = False
            nested_element = False
            nested_target = False
            continue

        target_match = CM_TARGET_CODE_RE.match(line)
        if target_match:
            if current_element_code is not None:
                result.append((current_element_code, target_match.group(1)))
                has_target = True
            nested_element = False
            nested_target = False
            continue

        if CM_ELEMENT_START_RE.match(line):
            if current_element_code is not None and not has_target:
                result.append((current_element_code, None))
            current_element_code = None
            has_target = False
            nested_element = True
            nested_target = False
            continue

        if CM_TARGET_START_RE.match(line):
            nested_element = False
            nested_target = True
            continue

        nested_code_match = CM_NESTED_CODE_RE.match(line)
        if nested_code_match and nested_element:
            current_element_code = nested_code_match.group(1)
            has_target = False
            nested_element = False
            continue

        if nested_code_match and nested_target:
            if current_element_code is not None:
                result.append((current_element_code, nested_code_match.group(1)))
                has_target = True
            nested_target = False
            continue

    # Handle last element if it had no target
    if current_element_code is not None and not has_target:
        result.append((current_element_code, None))

    return result


def _parse_mappings(content: str) -> Dict[str, str | None]:
    return dict(_parse_mapping_entries(content))


def parse_conceptmap_mappings(fsh_path: Path) -> Dict[str, str | None]:
    """Return all source codes and target codes in a ConceptMap."""
    return _parse_mappings(fsh_path.read_text(encoding="utf-8"))


def parse_conceptmap_groups(fsh_path: Path) -> Dict[str, Dict[str, str | None]]:
    """Return mappings keyed by their source CodeSystem URL."""
    content = fsh_path.read_text(encoding="utf-8")
    sources = list(CM_GROUP_SOURCE_URL_RE.finditer(content))
    return {
        (match.group(1) or match.group(2)): _parse_mappings(
            content[match.end():sources[index + 1].start() if index + 1 < len(sources) else len(content)]
        )
        for index, match in enumerate(sources)
    }


def parse_conceptmap_group_entries(fsh_path: Path) -> List[tuple[str, str, str | None]]:
    """Return every source/target pair, including repeated source codes."""
    content = fsh_path.read_text(encoding="utf-8")
    sources = list(CM_GROUP_SOURCE_URL_RE.finditer(content))
    return [
        (match.group(1) or match.group(2), code, target)
        for index, match in enumerate(sources)
        for code, target in _parse_mapping_entries(
            content[match.end():sources[index + 1].start() if index + 1 < len(sources) else len(content)]
        )
    ]


def find_conceptmap_file(ig_root: Path) -> Path:
    """Return an IG's telemetry ConceptMap path."""
    return ig_root / "input" / "fsh" / "conceptmaps" / "TIFLOW_CM_TelemetryDataStatusCodes.fsh"


def discover_codesystem_files(ig_roots: List[Path]) -> List[Path]:
    """Discover all OperationOutcomeDetails CodeSystem files across IG roots."""
    found: List[Path] = []
    for ig_root in ig_roots:
        found.extend(ig_root.rglob(CODESYSTEM_DISCOVERY_GLOB))
    return sorted(found)


def discover_valueset_files(ig_roots: List[Path]) -> List[Path]:
    """Discover all OperationOutcomeDetails ValueSet files across IG roots."""
    found: List[Path] = []
    for ig_root in ig_roots:
        found.extend(ig_root.rglob(VALUESET_DISCOVERY_GLOB))
    return sorted(found)


def parse_codesystem_source_url(fsh_path: Path) -> str | None:
    """Resolve the CodeSystem source URL used in the ConceptMap for a CodeSystem file.

    Prefer explicit * ^url if available. Otherwise use the standard CodeSystem base URL.
    """
    content = fsh_path.read_text(encoding="utf-8")
    url_match = CS_URL_RE.search(content)
    if url_match:
        return url_match.group(1)
    cs_id = parse_codesystem_id(fsh_path)
    return f"{DEFAULT_CODESYSTEM_URL_BASE}/{cs_id}" if cs_id else None


JSON_ERROR_CODES_GROUP_URL = "json-fehlercodes"
JSON_ERROR_CODE_SKIP_FILES = {"CHEAT_SHEET.md"}


def parse_json_error_codes_from_markdown(ig_roots: List[Path]) -> Set[str]:
    """Collect JSON error codes from IG requirement tables."""
    codes: Set[str] = set()
    for ig_root in ig_roots:
        for md_file in ig_root.rglob("*.md"):
            if md_file.name in JSON_ERROR_CODE_SKIP_FILES:
                continue
            for match in JSON_ERROR_CODE_RE.finditer(md_file.read_text(encoding="utf-8")):
                code = match.group(1).strip()
                if code and code != "-":
                    codes.add(code)
    return codes


def run_check(
    ig_roots: List[Path],
    codesystem_paths: List[Path] | None = None,
    valueset_paths: List[Path] | None = None,
    output_csv: Path | None = None,
) -> List[Finding]:
    """Check mappings for local CodeSystems, imported ValueSet codes, and JSON errors."""
    if codesystem_paths is None:
        codesystem_paths = discover_codesystem_files(ig_roots)
    if valueset_paths is None:
        valueset_paths = discover_valueset_files(ig_roots)

    findings: List[Finding] = []
    mapped_by_ig: Dict[str, Dict[str, Dict[str, str | None]]] = {}
    for ig_root in ig_roots:
        conceptmap_path = find_conceptmap_file(ig_root)
        if not conceptmap_path.exists():
            findings.append(Finding(
                type="CONCEPTMAP_NOT_FOUND",
                codesystem_file=ig_root.name,
                code="",
                message=f"Telemetry ConceptMap not found in IG '{ig_root.name}'",
            ))
            continue
        mapped_by_ig[ig_root.name] = parse_conceptmap_groups(conceptmap_path)

    system_ref_url_map: Dict[str, str] = dict(EXTERNAL_SYSTEM_REF_URLS)
    system_ref_url_map.update(parse_aliases(ig_roots))
    for cs_path in codesystem_paths:
        cs_name = parse_codesystem_name(cs_path)
        cs_url = parse_codesystem_source_url(cs_path)
        if cs_name and cs_url:
            system_ref_url_map[cs_name] = cs_url

    for cs_path in codesystem_paths:
        mapped_codes = mapped_by_ig.get(cs_path.parents[3].name, {}).get(
            parse_codesystem_source_url(cs_path), {}
        )
        for code in sorted(parse_codesystem_codes(cs_path)):
            if code not in mapped_codes:
                findings.append(Finding(
                    "MISSING_MAPPING", cs_path.name, code,
                    f"Code '{code}' is not mapped in the ConceptMap",
                ))
            elif mapped_codes[code] is None:
                findings.append(Finding(
                    "MISSING_TARGET_CODE", cs_path.name, code,
                    f"Code '{code}' is mapped but has no target code assigned",
                ))

    owner_by_url = {
        parse_codesystem_source_url(cs_path): cs_path.parents[3].name
        for cs_path in codesystem_paths
    }
    for vs_path in valueset_paths:
        for system_ref, code in parse_valueset_individual_codes(vs_path):
            resolved_url = system_ref_url_map.get(system_ref)
            source_label = resolved_url if resolved_url else vs_path.name
            mapped_codes = mapped_by_ig.get(owner_by_url.get(resolved_url, "core"), {}).get(
                resolved_url, {}
            )
            if code not in mapped_codes:
                findings.append(Finding(
                    "MISSING_MAPPING", source_label, code,
                    f"Code '{code}' is not mapped in the ConceptMap",
                ))
            elif mapped_codes[code] is None:
                findings.append(Finding(
                    "MISSING_TARGET_CODE", source_label, code,
                    f"Code '{code}' is mapped but has no target code assigned",
                ))

    mapped_codes = mapped_by_ig.get("core", {}).get(JSON_ERROR_CODES_GROUP_URL, {})
    json_codes = parse_json_error_codes_from_markdown(ig_roots)
    for code in sorted(json_codes):
        if code not in mapped_codes:
            findings.append(Finding(
                "MISSING_MAPPING", "error-code-json", code,
                f"Code '{code}' is not mapped in the ConceptMap",
            ))
        elif mapped_codes[code] is None:
            findings.append(Finding(
                "MISSING_TARGET_CODE", "error-code-json", code,
                f"Code '{code}' is mapped but has no target code assigned",
            ))

    allowed_by_source: Dict[str, Set[str]] = {JSON_ERROR_CODES_GROUP_URL: json_codes}
    cs_by_name = {parse_codesystem_name(path): path for path in codesystem_paths}
    for vs_path in valueset_paths:
        content = vs_path.read_text(encoding="utf-8")
        for system_ref in VS_INCLUDE_SYSTEM_RE.findall(content):
            source_url = system_ref_url_map.get(system_ref)
            if source_url and system_ref in cs_by_name:
                allowed_by_source.setdefault(source_url, set()).update(
                    parse_codesystem_codes(cs_by_name[system_ref])
                )
        for system_ref, code in parse_valueset_individual_codes(vs_path):
            source_url = system_ref_url_map.get(system_ref)
            if source_url:
                allowed_by_source.setdefault(source_url, set()).add(code)

    used_targets: Dict[str, tuple[Path, str, str]] = {}
    for ig_root in ig_roots:
        conceptmap_path = find_conceptmap_file(ig_root)
        if not conceptmap_path.exists():
            continue
        for source_url, code, target in parse_conceptmap_group_entries(conceptmap_path):
            if code not in allowed_by_source.get(source_url, set()):
                findings.append(Finding(
                    "EXTRA_MAPPING", str(conceptmap_path), code,
                    f"Code '{code}' in source '{source_url}' is not in an OperationOutcomeDetails ValueSet or JSON error table",
                ))
            if target is not None:
                if target in used_targets:
                    prior_path, prior_source, prior_code = used_targets[target]
                    findings.append(Finding(
                        "DUPLICATE_TELEMETRY_CODE", str(conceptmap_path), target,
                        f"Telemetry code '{target}' for '{source_url}#{code}' is also used by '{prior_source}#{prior_code}' in {prior_path}",
                    ))
                else:
                    used_targets[target] = (conceptmap_path, source_url, code)
    return findings


def write_csv_report(csv_path: Path, findings: List[Finding], codesystem_paths: List[Path]) -> None:
    """Write findings to a CSV report."""
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", encoding="utf-8", newline="") as fp:
        writer = csv.writer(fp)
        writer.writerow(["type", "codesystem_file", "code", "message"])
        for finding in findings:
            writer.writerow([finding.type, finding.codesystem_file, finding.code, finding.message])
        writer.writerow([
            "SUMMARY", "", "",
            f"Checked {len(codesystem_paths)} CodeSystem file(s), found {len(findings)} issue(s).",
        ])


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check that all CodeSystem codes are mapped in the telemetry ConceptMap."
    )
    parser.add_argument(
        "root",
        nargs="?",
        default="igs",
        help="Root folder containing IG directories (default: igs)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/telemetry-mapping-report.csv",
        help="Path to CSV report (default: qa/telemetry-mapping-report.csv)",
    )
    args = parser.parse_args()

    root = Path(args.root)
    if not root.exists():
        print(f"ERROR: Root directory '{root}' does not exist.")
        return 1

    # Discover IG roots
    ig_roots: List[Path] = []
    for ig_dir in root.iterdir():
        if ig_dir.is_dir() and (ig_dir / "input").exists():
            ig_roots.append(ig_dir)

    if not ig_roots:
        print(f"ERROR: No IG directories found under '{root}'.")
        return 1

    codesystem_paths = discover_codesystem_files(ig_roots)
    valueset_paths = discover_valueset_files(ig_roots)

    findings = run_check(ig_roots, codesystem_paths, valueset_paths)

    csv_path = Path(args.output_csv)
    write_csv_report(csv_path, findings, codesystem_paths)

    print("\n==> Telemetry Mapping Completeness Check")
    print(f"CodeSystem files checked: {len(codesystem_paths)}")
    print(f"Issues: {len(findings)}")

    if findings:
        print("\nIssues found:")
        for f in findings:
            print(f"  [{f.type}] {f.codesystem_file}: {f.code} - {f.message}")

    print(f"\nCSV report written to: {csv_path}")

    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
