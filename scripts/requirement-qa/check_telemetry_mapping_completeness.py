#!/usr/bin/env python3
"""Check that all codes in configured CodeSystems are mapped in the telemetry ConceptMap.

This script parses FSH CodeSystem files and the TIFLOW_CM_TelemetryDataStatusCodes
ConceptMap to verify that:
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

# Regex to extract element code mappings from the ConceptMap FSH file.
# Matches lines like: * group[=].element[0].code = #TIFLOW_OCSP_BACKEND_ERROR
CM_ELEMENT_CODE_RE = re.compile(
    r"^\*\s+group\[.*?\]\.element\[\d+\]\.code\s*=\s*#(\S+)", re.MULTILINE
)

# Regex to extract target code from ConceptMap FSH file.
# Matches lines like: * group[=].element[0].target[0].code = #79001
CM_TARGET_CODE_RE = re.compile(
    r"^\*\s+group\[.*?\]\.element\[(\d+)\]\.target\[\d+\]\.code\s*=\s*#(\S+)", re.MULTILINE
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

# Range for auto-assigned telemetry target codes.
TARGET_CODE_RANGE_START = 79200
TARGET_CODE_RANGE_END = 79999

# Regex to find ALL numeric target codes in the ConceptMap (for collision detection).
CM_ALL_TARGET_CODES_RE = re.compile(
    r"\.target\[\d+\]\.code\s*=\s*#(\d+)", re.MULTILINE
)

# Regex to find the CodeSystem URL used as source in a ConceptMap group.
CM_GROUP_SOURCE_URL_RE = re.compile(
    r"^\*\s+group\[\+\]\.source\s*=\s*\"([^\"]+)\"", re.MULTILINE
)


def parse_codesystem_codes(fsh_path: Path) -> Set[str]:
    """Extract all code identifiers from a FSH CodeSystem file."""
    content = fsh_path.read_text(encoding="utf-8")
    return set(CS_CODE_RE.findall(content))


def parse_codesystem_id(fsh_path: Path) -> str | None:
    """Extract the CodeSystem Id from a FSH CodeSystem file."""
    content = fsh_path.read_text(encoding="utf-8")
    match = CS_ID_RE.search(content)
    return match.group(1) if match else None


def parse_conceptmap_mappings(fsh_path: Path) -> Dict[str, str | None]:
    """Extract mapped codes and their target values from the ConceptMap FSH file.

    Returns a dict mapping source code -> target code (or None if no target assigned).
    """
    content = fsh_path.read_text(encoding="utf-8")

    # Parse line by line, tracking element code and target code pairs.
    # Element codes and target codes are associated by their position (sequential lines).
    result: Dict[str, str | None] = {}
    current_element_code: str | None = None

    for line in content.splitlines():
        # Match element code line
        elem_match = CM_ELEMENT_CODE_RE.match(line)
        if elem_match:
            # If we had a previous element code without a target, record it
            if current_element_code is not None and current_element_code not in result:
                result[current_element_code] = None
            current_element_code = elem_match.group(1)
            continue

        # Match target code line
        target_match = CM_TARGET_CODE_RE.match(line)
        if target_match:
            target_code = target_match.group(2)
            if current_element_code is not None:
                result[current_element_code] = target_code
                current_element_code = None
            continue

    # Handle last element if it had no target
    if current_element_code is not None and current_element_code not in result:
        result[current_element_code] = None

    return result


def find_conceptmap_file(ig_roots: List[Path]) -> Path | None:
    """Locate the TIFLOW_CM_TelemetryDataStatusCodes.fsh file in known IG roots."""
    for ig_root in ig_roots:
        candidates = list(ig_root.rglob("TIFLOW_CM_TelemetryDataStatusCodes.fsh"))
        if candidates:
            return candidates[0]
    return None


def find_codesystem_files(ig_roots: List[Path], codesystem_entries: List[tuple[str, str]]) -> List[Path]:
    """Locate CodeSystem FSH files by filename in known IG roots."""
    found: List[Path] = []
    for filename, _url in codesystem_entries:
        for ig_root in ig_roots:
            candidates = list(ig_root.rglob(filename))
            found.extend(candidates)
    return found


# Default CodeSystem files to check against the ConceptMap.
# Add new CodeSystem entries here as needed: (filename, CodeSystem URL in ConceptMap).
DEFAULT_CODESYSTEM_FILES = [
    ("TIFLOW_CS_OperationOutcomeDetails.fsh", "https://gematik.de/fhir/erp/CodeSystem/tiflow-operation-outcome-details-cs"),
    ("TIFLOW_CHARGEITEM_CS_OperationOutcomeDetails.fsh", "https://gematik.de/fhir/erp/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs"),
    ("TIFLOW_XBORDER_CS_OperationOutcomeDetails.fsh", "https://gematik.de/fhir/erp/CodeSystem/tiflow-xborder-operation-outcome-details-cs"),
    ("TIFLOW_EREZEPT_CS_OperationOutcomeDetails.fsh", "https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs"),
]


def run_check(
    ig_roots: List[Path],
    codesystem_entries: List[tuple[str, str]] | None = None,
    output_csv: Path | None = None,
) -> List[Finding]:
    """Run the telemetry mapping completeness check.

    Returns a list of findings (empty if all codes are mapped).
    """
    if codesystem_entries is None:
        codesystem_entries = DEFAULT_CODESYSTEM_FILES

    conceptmap_path = find_conceptmap_file(ig_roots)
    if conceptmap_path is None:
        print("ERROR: Could not find TIFLOW_CM_TelemetryDataStatusCodes.fsh")
        return [Finding(
            type="CONCEPTMAP_NOT_FOUND",
            codesystem_file="",
            code="",
            message="TIFLOW_CM_TelemetryDataStatusCodes.fsh not found in any IG root",
        )]

    codesystem_paths = find_codesystem_files(ig_roots, codesystem_entries)
    if not codesystem_paths:
        print("ERROR: No CodeSystem files found")
        return [Finding(
            type="CODESYSTEM_NOT_FOUND",
            codesystem_file=", ".join(f for f, _ in codesystem_entries),
            code="",
            message="No CodeSystem files found in any IG root",
        )]

    # Parse concept map
    mapped_codes = parse_conceptmap_mappings(conceptmap_path)

    findings: List[Finding] = []

    for cs_path in codesystem_paths:
        cs_codes = parse_codesystem_codes(cs_path)
        cs_filename = cs_path.name

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
    content = conceptmap_path.read_text(encoding="utf-8")
    return {int(m) for m in CM_ALL_TARGET_CODES_RE.findall(content)}


def _find_group_for_codesystem(
    conceptmap_content: str, codesystem_url: str
) -> str | None:
    """Find the source URL in the ConceptMap that matches the given CodeSystem URL.

    Returns the URL string if found, None otherwise.
    """
    for match in CM_GROUP_SOURCE_URL_RE.finditer(conceptmap_content):
        url = match.group(1)
        if url == codesystem_url:
            return url
    return None


def _get_max_element_index(conceptmap_content: str, group_source_url: str) -> int:
    """Find the highest element index used in the group with the given source URL.

    Returns -1 if no elements exist for that group.
    """
    # Find the position of the group source line
    source_pattern = re.compile(
        r"^\*\s+group\[\+\]\.source\s*=\s*\""
        + re.escape(group_source_url)
        + r"\"",
        re.MULTILINE,
    )
    source_match = source_pattern.search(conceptmap_content)
    if not source_match:
        return -1

    # Find the next group[+] start (if any) to limit our search scope
    next_group = re.search(
        r"^\*\s+group\[\+\]\.source\s*=",
        conceptmap_content[source_match.end():],
        re.MULTILINE,
    )
    if next_group:
        section = conceptmap_content[source_match.start():source_match.end() + next_group.start()]
    else:
        section = conceptmap_content[source_match.start():]

    # Find all element indices in this section
    indices = [int(m) for m in re.findall(r"element\[(\d+)\]", section)]
    return max(indices) if indices else -1


def fix_missing_mappings(
    findings: List[Finding],
    ig_roots: List[Path],
    codesystem_entries: List[tuple[str, str]],
) -> int:
    """Add missing code mappings to the ConceptMap.

    Assigns target codes from 79200 upward (lowest unused in 79200-79999 range).
    Creates new groups in the ConceptMap for CodeSystems that don't have one yet.
    Returns the number of fixes applied.
    """
    missing_findings = [f for f in findings if f.type == "MISSING_MAPPING"]
    if not missing_findings:
        return 0

    conceptmap_path = find_conceptmap_file(ig_roots)
    if conceptmap_path is None:
        return 0

    # Collect all used target codes in the full range
    used_codes = _collect_all_used_target_codes(conceptmap_path)

    # Build a mapping from codesystem filename -> URL
    cs_url_map: Dict[str, str] = {filename: url for filename, url in codesystem_entries}

    conceptmap_content = conceptmap_path.read_text(encoding="utf-8")

    # Group findings by codesystem file
    findings_by_cs: Dict[str, List[Finding]] = {}
    for f in missing_findings:
        findings_by_cs.setdefault(f.codesystem_file, []).append(f)

    # Allocate target codes from the bottom of the range upward
    next_target = TARGET_CODE_RANGE_START
    applied = 0

    for cs_filename, cs_findings in findings_by_cs.items():
        group_source_url = cs_url_map.get(cs_filename)
        if group_source_url is None:
            print(f"  WARNING: No URL configured for {cs_filename}, skipping")
            continue

        # Check if the group already exists in the ConceptMap; create it if not
        existing_url = _find_group_for_codesystem(conceptmap_content, group_source_url)
        if existing_url is None:
            # Append a new group at the end of the file
            group_header = (
                f"\n// {cs_filename}\n"
                f"* group[+].source = \"{group_source_url}\"\n"
                f"* group[=].target = \"http://telemetry-data-status-codes\"\n"
            )
            conceptmap_content = conceptmap_content.rstrip("\n") + "\n" + group_header
            existing_url = group_source_url

        max_idx = _get_max_element_index(conceptmap_content, existing_url)
        current_idx = max_idx + 1

        # Build new lines to append to this group's section
        new_lines: List[str] = []
        for f in sorted(cs_findings, key=lambda x: x.code):
            # Find next available target code (lowest unused, counting up)
            while next_target <= TARGET_CODE_RANGE_END and next_target in used_codes:
                next_target += 1
            if next_target > TARGET_CODE_RANGE_END:
                print("  ERROR: No more target codes available in range 79200-79999")
                break

            new_lines.append(f"* group[=].element[{current_idx}].code = #{f.code}")
            new_lines.append(f"* group[=].element[{current_idx}].target[0].code = #{next_target}")
            new_lines.append(f"* group[=].element[{current_idx}].target[0].equivalence = #equivalent")

            used_codes.add(next_target)
            next_target += 1
            current_idx += 1
            applied += 1

        if new_lines:
            # Find insertion point: end of the group section
            source_pattern = re.compile(
                r"^\*\s+group\[\+\]\.source\s*=\s*\""
                + re.escape(existing_url)
                + r"\"",
                re.MULTILINE,
            )
            source_match = source_pattern.search(conceptmap_content)
            if source_match:
                # Find the next group[+] start or end of file
                next_group = re.search(
                    r"^\*\s+group\[\+\]\.source\s*=",
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

    if applied > 0:
        conceptmap_path.write_text(conceptmap_content, encoding="utf-8")
        print(f"  Fixed {applied} missing mapping(s) in {conceptmap_path.name}")

    return applied


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

    codesystem_filenames = DEFAULT_CODESYSTEM_FILES
    codesystem_paths = find_codesystem_files(ig_roots, codesystem_filenames)

    findings = run_check(ig_roots, codesystem_filenames)

    if args.fix and findings:
        print("\n==> Applying auto-fixes...")
        applied = fix_missing_mappings(findings, ig_roots, codesystem_filenames)
        if applied > 0:
            print("\nRe-running checks after fixes...")
            findings = run_check(ig_roots, codesystem_filenames)

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
