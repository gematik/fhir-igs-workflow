#!/usr/bin/env python3
"""Check that all codes in configured CodeSystems are mapped in the telemetry ConceptMap.

This script parses each IG's FSH CodeSystem files and telemetry ConceptMap to verify that:
1. Every code defined in the CodeSystem(s) has an entry in the ConceptMap.
2. Each mapped entry has a target code (telemetry status code) assigned.

Exit codes:
  0 - All codes are fully mapped.
  1 - One or more codes are missing from the ConceptMap or lack a target code.
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
CM_FLAT_MAPPING_RE = re.compile(
    r"^(?P<indent>\s*)\*\s+group\[(?P<group>[^]]+)\]\.element\[\d+\]\.code\s*=\s*#(?P<code>\S+)\n"
    r"(?P=indent)\*\s+group\[(?P=group)\]\.element\[\d+\]\.target\[\d+\]\.code\s*=\s*#(?P<target>\S+)\n"
    r"(?P=indent)\*\s+group\[(?P=group)\]\.element\[\d+\]\.target\[\d+\]\.equivalence\s*=\s*#(?P<equivalence>\S+)",
    re.MULTILINE,
)

# Regex to extract the source system URL from the ConceptMap group.
# Matches: * group[+].source = "https://..."
CM_GROUP_SOURCE_RE = re.compile(
    r"^\*\s+group\[\+\]\.source\s*=\s*\"([^\"]+)\"", re.MULTILINE
)


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

# Range for auto-assigned telemetry target codes.
TARGET_CODE_RANGE_START = 79200
TARGET_CODE_RANGE_END = 79999

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


def _parse_mappings(content: str) -> Dict[str, str | None]:
    # Parse line by line, tracking element code and target code pairs. Both the
    # legacy flat paths and nested FSH rules are accepted.
    result: Dict[str, str | None] = {}
    current_element_code: str | None = None
    nested_element = False
    nested_target = False

    for line in content.splitlines():
        elem_match = CM_ELEMENT_CODE_RE.match(line)
        if elem_match:
            if current_element_code is not None and current_element_code not in result:
                result[current_element_code] = None
            current_element_code = elem_match.group(1)
            nested_element = False
            nested_target = False
            continue

        target_match = CM_TARGET_CODE_RE.match(line)
        if target_match:
            if current_element_code is not None:
                result[current_element_code] = target_match.group(1)
                current_element_code = None
            nested_element = False
            nested_target = False
            continue

        if CM_ELEMENT_START_RE.match(line):
            if current_element_code is not None and current_element_code not in result:
                result[current_element_code] = None
            current_element_code = None
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
            nested_element = False
            continue

        if nested_code_match and nested_target:
            if current_element_code is not None:
                result[current_element_code] = nested_code_match.group(1)
                current_element_code = None
            nested_target = False
            continue

    # Handle last element if it had no target
    if current_element_code is not None and current_element_code not in result:
        result[current_element_code] = None

    return result


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

    Prefer explicit * ^url if available. Otherwise fallback to DEFAULT_CODESYSTEM_URL_BASE + Id.
    """
    content = fsh_path.read_text(encoding="utf-8")
    url_match = CS_URL_RE.search(content)
    if url_match:
        return url_match.group(1)

    cs_id = parse_codesystem_id(fsh_path)
    if cs_id:
        return f"{DEFAULT_CODESYSTEM_URL_BASE}/{cs_id}"
    return None

# Group source identifier for JSON error codes extracted from markdown requirement tables.
JSON_ERROR_CODES_GROUP_URL = "json-fehlercodes"

# Files to skip when scanning for JSON error code tables.
JSON_ERROR_CODE_SKIP_FILES = {"CHEAT_SHEET.md"}


def parse_json_error_codes_from_markdown(ig_roots: List[Path]) -> Set[str]:
    """Scan markdown files under igs/ for error-code-json tables and extract Error Code values.

    Skips files listed in JSON_ERROR_CODE_SKIP_FILES.
    Returns a set of unique error code strings.
    """
    codes: Set[str] = set()
    for ig_root in ig_roots:
        for md_file in ig_root.rglob("*.md"):
            if md_file.name in JSON_ERROR_CODE_SKIP_FILES:
                continue
            content = md_file.read_text(encoding="utf-8")
            for match in JSON_ERROR_CODE_RE.finditer(content):
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
    """Run the telemetry mapping completeness check.

    Returns a list of findings (empty if all codes are mapped).
    """
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

    # Build system reference -> URL map for ValueSet include lines.
    # Sources: aliases, discovered local CodeSystems, and known external references.
    system_ref_url_map: Dict[str, str] = dict(EXTERNAL_SYSTEM_REF_URLS)
    aliases = parse_aliases(ig_roots)
    system_ref_url_map.update(aliases)
    for cs_path in codesystem_paths:
        cs_name = parse_codesystem_name(cs_path)
        cs_url = parse_codesystem_source_url(cs_path)
        if cs_name and cs_url:
            system_ref_url_map[cs_name] = cs_url

    for cs_path in codesystem_paths:
        cs_codes = parse_codesystem_codes(cs_path)
        cs_filename = cs_path.name
        mapped_codes = mapped_by_ig.get(cs_path.parents[3].name, {}).get(
            parse_codesystem_source_url(cs_path), {}
        )

        for code in sorted(cs_codes):
            if code not in mapped_codes:
                findings.append(Finding(
                    type="MISSING_MAPPING",
                    codesystem_file=cs_filename,
                    code=code,
                    message=f"Code '{code}' is not mapped in the ConceptMap",
                ))
            elif mapped_codes[code] is None:
                findings.append(Finding(
                    type="MISSING_TARGET_CODE",
                    codesystem_file=cs_filename,
                    code=code,
                    message=f"Code '{code}' is mapped but has no target code assigned",
                ))

    # Imported ValueSet codes use their defining IG's map, or the core map for
    # externally defined codes that do not have a local CodeSystem.
    owner_by_url = {
        parse_codesystem_source_url(cs_path): cs_path.parents[3].name
        for cs_path in codesystem_paths
    }
    for vs_path in valueset_paths:
        vs_code_entries = parse_valueset_individual_codes(vs_path)
        for system_ref, code in vs_code_entries:
            resolved_url = system_ref_url_map.get(system_ref)
            source_label = resolved_url if resolved_url else vs_path.name
            mapped_codes = mapped_by_ig.get(owner_by_url.get(resolved_url, "core"), {}).get(
                resolved_url, {}
            )
            if code not in mapped_codes:
                findings.append(Finding(
                    type="MISSING_MAPPING",
                    codesystem_file=source_label,
                    code=code,
                    message=f"Code '{code}' is not mapped in the ConceptMap",
                ))
            elif mapped_codes[code] is None:
                findings.append(Finding(
                    type="MISSING_TARGET_CODE",
                    codesystem_file=source_label,
                    code=code,
                    message=f"Code '{code}' is mapped but has no target code assigned",
                ))

    # Check JSON error codes from markdown requirement tables
    json_codes = parse_json_error_codes_from_markdown(ig_roots)
    mapped_codes = mapped_by_ig.get("core", {}).get(JSON_ERROR_CODES_GROUP_URL, {})
    for code in sorted(json_codes):
        if code not in mapped_codes:
            findings.append(Finding(
                type="MISSING_MAPPING",
                codesystem_file="error-code-json",
                code=code,
                message=f"Code '{code}' is not mapped in the ConceptMap",
            ))
        elif mapped_codes[code] is None:
            findings.append(Finding(
                type="MISSING_TARGET_CODE",
                codesystem_file="error-code-json",
                code=code,
                message=f"Code '{code}' is mapped but has no target code assigned",
            ))

    return findings


def write_csv_report(csv_path: Path, findings: List[Finding], codesystem_paths: List[Path]) -> None:
    """Write findings to a CSV report."""
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", encoding="utf-8", newline="") as fp:
        writer = csv.writer(fp)
        writer.writerow(["type", "codesystem_file", "code", "message"])
        for f in findings:
            writer.writerow([f.type, f.codesystem_file, f.code, f.message])
        writer.writerow([
            "SUMMARY", "", "",
            f"Checked {len(codesystem_paths)} CodeSystem file(s), found {len(findings)} issue(s).",
        ])


def _collect_all_used_target_codes(conceptmap_path: Path) -> Set[int]:
    """Collect all numeric target codes already used in the ConceptMap."""
    return {
        int(target)
        for mappings in parse_conceptmap_groups(conceptmap_path).values()
        for target in mappings.values()
        if target is not None and target.isdigit()
    }


def _find_group_for_codesystem(
    conceptmap_content: str, codesystem_url: str
) -> str | None:
    """Find the source URL in the ConceptMap that matches the given CodeSystem URL.

    Returns the URL string if found, None otherwise.
    """
    for match in CM_GROUP_SOURCE_URL_RE.finditer(conceptmap_content):
        url = match.group(1) or match.group(2)
        if url == codesystem_url:
            return url
    return None


def fix_missing_mappings(
    findings: List[Finding],
    ig_roots: List[Path],
    codesystem_paths: List[Path] | None = None,
    valueset_paths: List[Path] | None = None,
) -> int:
    """Add missing code mappings to the ConceptMap.

    Assigns target codes from 79200 upward (lowest unused in 79200-79999 range).
    Creates new groups in the ConceptMap for CodeSystems that don't have one yet.
    Returns the number of fixes applied.
    """
    if codesystem_paths is None:
        codesystem_paths = discover_codesystem_files(ig_roots)
    if valueset_paths is None:
        valueset_paths = discover_valueset_files(ig_roots)

    missing_findings = [f for f in findings if f.type == "MISSING_MAPPING"]
    if not missing_findings:
        return 0

    # Allocate codes globally: telemetry identifiers must stay unique after the split.
    used_codes = set().union(*(
        _collect_all_used_target_codes(find_conceptmap_file(root))
        for root in ig_roots if find_conceptmap_file(root).exists()
    ))

    # Build a mapping from codesystem_file identifier -> group URL.
    # For CodeSystems: filename -> URL
    # For JSON error codes: "error-code-json" -> "json-fehlercodes"
    # For ValueSet codes: codesystem_file is already the resolved URL itself.
    cs_url_map: Dict[str, str] = {}
    owner_by_source: Dict[str, Path] = {}
    for cs_path in codesystem_paths:
        source_url = parse_codesystem_source_url(cs_path)
        if source_url:
            cs_url_map[cs_path.name] = source_url
            owner_by_source[source_url] = cs_path.parents[3]
    cs_url_map["error-code-json"] = JSON_ERROR_CODES_GROUP_URL

    # Group findings by codesystem file
    findings_by_cs: Dict[str, List[Finding]] = {}
    for f in missing_findings:
        findings_by_cs.setdefault(f.codesystem_file, []).append(f)

    # Allocate target codes from the bottom of the range upward
    next_target = TARGET_CODE_RANGE_START
    applied = 0
    contents: Dict[Path, str] = {}
    seen_by_source: Dict[str, Set[str]] = {}

    for cs_filename, cs_findings in findings_by_cs.items():
        group_source_url = cs_url_map.get(cs_filename)
        if group_source_url is None:
            # For ValueSet codes, codesystem_file is already the resolved URL
            group_source_url = cs_filename

        owner = owner_by_source.get(group_source_url, next((root for root in ig_roots if root.name == "core"), None))
        if owner is None:
            continue
        conceptmap_path = find_conceptmap_file(owner)
        if not conceptmap_path.exists():
            continue
        conceptmap_content = contents.get(conceptmap_path, conceptmap_path.read_text(encoding="utf-8"))

        # Check if the group already exists in the ConceptMap; create it if not
        existing_url = _find_group_for_codesystem(conceptmap_content, group_source_url)
        if existing_url is None:
            # Append a new group at the end of the file
            group_header = (
                f"\n// {cs_filename}\n"
                "* group[+]\n"
                f"  * source = \"{group_source_url}\"\n"
                "  * target = \"ti-flow-telemetriedaten-statuscodes\"\n"
            )
            conceptmap_content = conceptmap_content.rstrip("\n") + "\n" + group_header
            existing_url = group_source_url

        # Build new lines to append to this group's section
        new_lines: List[str] = []
        for f in sorted(cs_findings, key=lambda x: x.code):
            if f.code in seen_by_source.setdefault(group_source_url, set()):
                continue
            seen_by_source[group_source_url].add(f.code)
            # Find next available target code (lowest unused, counting up)
            while next_target <= TARGET_CODE_RANGE_END and next_target in used_codes:
                next_target += 1
            if next_target > TARGET_CODE_RANGE_END:
                print("  ERROR: No more target codes available in range 79200-79999")
                break

            new_lines.append("* group[=].element[+]")
            new_lines.append(f"  * code = #{f.code}")
            new_lines.append("  * target[+]")
            new_lines.append(f"    * code = #{next_target}")
            new_lines.append("    * equivalence = #equivalent")

            used_codes.add(next_target)
            next_target += 1
            applied += 1

        if new_lines:
            # Find insertion point: end of the group section
            source_pattern = re.compile(
                r"^\s*\*\s+group\[\+\]\.source\s*=\s*\""
                + re.escape(existing_url)
                + r"\"|^\s*\*\s+group\[\+\]\s*$\s*^\s*\*\s+source\s*=\s*\""
                + re.escape(existing_url)
                + r"\"",
                re.MULTILINE,
            )
            source_match = source_pattern.search(conceptmap_content)
            if source_match:
                # Find the next group[+] start or end of file
                next_group = re.search(
                    r"^\s*\*\s+group\[\+\](?:\.source\s*=|\s*$)",
                    conceptmap_content[source_match.end():],
                    re.MULTILINE,
                )
                if next_group:
                    # Back up past any preceding blank lines and comments
                    abs_pos = source_match.end() + next_group.start()
                    while abs_pos > 0 and conceptmap_content[abs_pos - 1] == "\n":
                        abs_pos -= 1
                        # Skip over the preceding line if it's a comment or blank
                        line_start = conceptmap_content.rfind("\n", 0, abs_pos)
                        line_start = line_start + 1 if line_start >= 0 else 0
                        line = conceptmap_content[line_start:abs_pos]
                        if line.strip() == "" or line.strip().startswith("//"):
                            abs_pos = line_start
                        else:
                            abs_pos = abs_pos + 1  # restore the \n we consumed
                            break
                    insert_pos = abs_pos
                    insert_text = "\n".join(new_lines) + "\n\n"
                else:
                    # Append at end of file
                    insert_pos = len(conceptmap_content)
                    insert_text = "\n" + "\n".join(new_lines) + "\n"

                conceptmap_content = (
                    conceptmap_content[:insert_pos]
                    + insert_text
                    + conceptmap_content[insert_pos:]
                )
                contents[conceptmap_path] = conceptmap_content

    for conceptmap_path, content in contents.items():
        conceptmap_path.write_text(content, encoding="utf-8")
    if applied:
        print(f"  Fixed {applied} missing mapping(s) across telemetry ConceptMaps")

    return applied


def normalize_flat_mappings(conceptmap_path: Path) -> int:
    """Convert legacy numeric mapping triples to nested append-style FSH rules."""
    content = conceptmap_path.read_text(encoding="utf-8")

    def replacement(match: re.Match[str]) -> str:
        indent = match.group("indent")
        group = match.group("group")
        return (
            f"{indent}* group[{group}].element[+]\n"
            f"{indent}  * code = #{match.group('code')}\n"
            f"{indent}  * target[+]\n"
            f"{indent}    * code = #{match.group('target')}\n"
            f"{indent}    * equivalence = #{match.group('equivalence')}"
        )

    normalized_content, normalized = CM_FLAT_MAPPING_RE.subn(replacement, content)
    if normalized:
        conceptmap_path.write_text(normalized_content, encoding="utf-8")
    return normalized


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
    parser.add_argument(
        "--fix",
        action="store_true",
        help="Add missing codes to the ConceptMap with auto-assigned target codes (79200 upward)",
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

    if args.fix:
        print("\n==> Applying auto-fixes...")
        applied = fix_missing_mappings(findings, ig_roots, codesystem_paths, valueset_paths)
        normalized = sum(
            normalize_flat_mappings(path)
            for root in ig_roots
            if (path := find_conceptmap_file(root)).exists()
        )
        if normalized > 0:
            print(f"  Normalized {normalized} legacy mapping(s) across telemetry ConceptMaps")
        if applied > 0 or normalized > 0:
            print("\nRe-running checks after fixes...")
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
