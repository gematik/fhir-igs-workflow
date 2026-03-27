#!/usr/bin/env python3
"""Check consistency of error codes across requirements, CS/VS, and CapabilityStatement.

Validates that:
1. Error codes in requirement error tables are defined in appropriate CS/VS.
2. Endpoint-specific requirement error codes are represented in CapabilityStatement endpoint RuleSets.

For module IGs, endpoint checks require both:
- module-local requirement codes
- inherited core requirement codes (when module page includes core requirement page)
"""

from __future__ import annotations

import argparse
import csv
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Set, Tuple


ERROR_TABLE_RE = re.compile(r'<table[^>]*id="error-code"[^>]*>.*?</table>', re.DOTALL)
DETAILS_CODE_RE = re.compile(r'<th>Details Code</th>\s*<td>([^<]+)</td>', re.DOTALL)
REQUIREMENT_KEY_RE = re.compile(r'<requirement[^>]*\bkey="([^"]+)"[^>]*>')
INCLUDE_CORE_RE = re.compile(r'{%\s*include\s+core\.([^\s%]+)\s*%}')
ERROR_CODE_LIKE_RE = re.compile(r'^[A-Z0-9][A-Z0-9_\-]*$')

FSH_CODE_DEF_RE = re.compile(r'^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+"([^"]*)"', re.MULTILINE)
FSH_INCLUDE_CODES_RE = re.compile(r'^\s*\*\s+include\s+codes\s+from\s+system\s+(\S+)', re.MULTILINE)
FSH_INCLUDE_EXTERNAL_RE = re.compile(r'^\s*\*\s+include\s+(\$[\w\-]+)#(\w+)\s+"([^"]*)"', re.MULTILINE)

RULESET_START_RE = re.compile(r'^\s*RuleSet:\s*([A-Za-z0-9_\-]+)', re.MULTILINE)
RULESET_INSERT_RE = re.compile(r'^\s*\*\s*(?:rest\.[^\s]+\s+)?insert\s+([A-Za-z0-9_\-]+)\s*$', re.MULTILINE)
RULESET_ERROR_CODE_RE = re.compile(r'extension\[errorCode\]\.valueString\s*=\s*"([^"]+)"')

CAP_RESOURCE_INTERACTION_RE = re.compile(r'^\s*\*\s*insert\s+CapResourceInteraction\(#([a-z\-]+),', re.MULTILINE)
CAP_RESOURCE_OPERATION_RE = re.compile(
    r'^\s*\*\s*insert\s+CapSupportResourceOperation\(([a-z0-9\-]+),\s*([^,]+),',
    re.MULTILINE,
)
CAP_SYSTEM_OPERATION_RE = re.compile(
    r'^\s*\*\s*insert\s+CapSupportSystemOperation\(([a-z0-9\-]+),\s*([^,]+),',
    re.MULTILINE,
)
RULESET_HEADER_RE = re.compile(r'^\s*RuleSet:\s*([A-Za-z0-9_\-]+)Interaction\(expectation\)', re.MULTILINE)


@dataclass
class ErrorCode:
    code: str
    file_path: Path
    line: int
    requirement_key: str
    http_code: str
    severity: str
    code_field: str
    module: str
    endpoint: str


@dataclass
class CodeSystemDef:
    id: str
    file_path: Path
    codes: Set[str]


@dataclass
class ValueSetDef:
    id: str
    file_path: Path
    includes: List[str]


@dataclass
class Finding:
    type: str
    ig_module: str
    file_path: Path
    line: int
    code: str
    requirement_key: str
    message: str


@dataclass
class CodeDescription:
    code: str
    display: str
    description: str
    file_path: Path
    line: int


CODE_CLASSIFICATIONS = {
    "TIFLOW_": ("core", "TIFLOW_CS_OperationOutcomeDetails", "TIFLOW_VS_OperationOutcomeDetails", False),
    "MSG_": ("varies", None, None, True),
    "SVC_": ("varies", None, None, True),
    "TIFLOW_RX_": ("rx", "TIFLOW_RX_CS_OperationOutcomeDetails", "TIFLOW_RX_VS_OperationOutcomeDetails", False),
    "TIFLOW_DIGA_": ("diga", "TIFLOW_DIGA_CS_OperationOutcomeDetails", "TIFLOW_DIGA_VS_OperationOutcomeDetails", False),
    "TIFLOW_ERPCHRG_": ("erp-chrg", "TIFLOW_ERPCHRG_CS_OperationOutcomeDetails", "TIFLOW_ERPCHRG_VS_OperationOutcomeDetails", False),
    "TIFLOW_ERPEU_": ("erp-eu", "TIFLOW_ERPEU_CS_OperationOutcomeDetails", "TIFLOW_ERPEU_VS_OperationOutcomeDetails", False),
    "GEM_ERP": ("core", "GEM_ERP_CS_OperationOutcomeDetails", "GEM_ERP_VS_OperationOutcomeDetails", False),
    "ERPFD_": ("core", "GEM_ERP_CS_OperationOutcomeDetails", "GEM_ERP_VS_OperationOutcomeDetails", False),
}


def module_from_path(file_path: Path) -> str:
    parts = file_path.as_posix().split("/")
    try:
        idx = parts.index("igs")
        return parts[idx + 1]
    except (ValueError, IndexError):
        return "unknown"


def endpoint_from_filename(file_name: str) -> str:
    if file_name.startswith("op-") and "-req-" in file_name:
        op = file_name.split("-req-", 1)[0].replace("op-", "")
        return f"op:{op}"
    if file_name.startswith("query-api-"):
        suffix = file_name.replace("query-api-", "").replace(".md", "")
        return f"query:{suffix}"
    return f"file:{file_name}"


def classify_error_code(code: str) -> Tuple[str, Optional[str], Optional[str], bool]:
    for prefix, value in CODE_CLASSIFICATIONS.items():
        if code.startswith(prefix):
            return value
    if code.startswith("TIFLOW"):
        return "core", "TIFLOW_CS_OperationOutcomeDetails", "TIFLOW_VS_OperationOutcomeDetails", False
    return "unknown", None, None, True


def parse_tables_from_content(content: str, file_path: Path, module: str, endpoint: str) -> List[ErrorCode]:
    found: List[ErrorCode] = []

    for req_match in REQUIREMENT_KEY_RE.finditer(content):
        req_key = req_match.group(1)
        req_start = req_match.start()
        next_req = content.find("<requirement", req_start + 1)
        if next_req == -1:
            next_req = len(content)
        req_section = content[req_start:next_req]

        for table_match in ERROR_TABLE_RE.finditer(req_section):
            table_text = table_match.group()
            code_match = DETAILS_CODE_RE.search(table_text)
            if not code_match:
                continue
            error_code = code_match.group(1).strip()
            # Requirement text sometimes contains element paths in this field; only keep code-like tokens.
            if not ERROR_CODE_LIKE_RE.match(error_code):
                continue
            line_num = content[: req_start + table_match.start()].count("\n") + 1

            http_match = re.search(r"<th>HTTP-Code</th>\s*<td>([^<]+)</td>", table_text)
            severity_match = re.search(r"<th>Severity</th>\s*<td>([^<]+)</td>", table_text)
            code_field_match = re.search(r"<th>Code</th>\s*<td>([^<]+)</td>", table_text)

            found.append(
                ErrorCode(
                    code=error_code,
                    file_path=file_path,
                    line=line_num,
                    requirement_key=req_key,
                    http_code=http_match.group(1).strip() if http_match else "?",
                    severity=severity_match.group(1).strip() if severity_match else "?",
                    code_field=code_field_match.group(1).strip() if code_field_match else "?",
                    module=module,
                    endpoint=endpoint,
                )
            )

    return found


def extract_error_codes_from_requirements(targets: Iterable[Path]) -> List[ErrorCode]:
    all_codes: List[ErrorCode] = []

    for file_path in targets:
        if file_path.suffix.lower() != ".md":
            continue
        content = file_path.read_text(encoding="utf-8")
        module = module_from_path(file_path)
        endpoint = endpoint_from_filename(file_path.name)

        all_codes.extend(parse_tables_from_content(content, file_path, module, endpoint))

        # Module pages may include core requirement pages; include those codes for endpoint coverage.
        if module != "core":
            for inc in INCLUDE_CORE_RE.finditer(content):
                included_name = inc.group(1)
                core_file = Path("igs") / "core" / "input" / "pagecontent" / included_name
                if not core_file.exists():
                    continue
                core_content = core_file.read_text(encoding="utf-8")
                include_line = content[: inc.start()].count("\n") + 1
                inherited = parse_tables_from_content(core_content, file_path, module, endpoint)
                for item in inherited:
                    item.requirement_key = f"INHERITED:{included_name}:{item.requirement_key}"
                    item.line = include_line
                all_codes.extend(inherited)

    return all_codes


def find_codesystem_files(ig_root: Path) -> Dict[str, CodeSystemDef]:
    cs_defs: Dict[str, CodeSystemDef] = {}
    codesystems_dir = ig_root / "input" / "fsh" / "codesystems"
    if not codesystems_dir.exists():
        return cs_defs

    for cs_file in codesystems_dir.glob("*.fsh"):
        content = cs_file.read_text(encoding="utf-8")
        codes = {m.group(1) for m in FSH_CODE_DEF_RE.finditer(content)}
        cs_defs[cs_file.stem] = CodeSystemDef(id=cs_file.stem, file_path=cs_file, codes=codes)
    return cs_defs


def find_valueset_files(ig_root: Path) -> Dict[str, ValueSetDef]:
    vs_defs: Dict[str, ValueSetDef] = {}
    valuesets_dir = ig_root / "input" / "fsh" / "valuesets"
    if not valuesets_dir.exists():
        return vs_defs

    for vs_file in valuesets_dir.glob("*.fsh"):
        content = vs_file.read_text(encoding="utf-8")
        includes: List[str] = []
        includes.extend(m.group(1) for m in FSH_INCLUDE_CODES_RE.finditer(content))
        includes.extend(f"{m.group(1)}#{m.group(2)}" for m in FSH_INCLUDE_EXTERNAL_RE.finditer(content))
        vs_defs[vs_file.stem] = ValueSetDef(id=vs_file.stem, file_path=vs_file, includes=includes)
    return vs_defs


def parse_ruleset_references(file_path: Path) -> Dict[str, List[str]]:
    if not file_path.exists():
        return {}
    content = file_path.read_text(encoding="utf-8")
    refs: Dict[str, List[str]] = {}

    starts = list(RULESET_START_RE.finditer(content))
    for i, st in enumerate(starts):
        name = st.group(1)
        section_start = st.end()
        section_end = starts[i + 1].start() if i + 1 < len(starts) else len(content)
        section = content[section_start:section_end]
        refs[name] = [m.group(1) for m in RULESET_INSERT_RE.finditer(section)]
    return refs


def parse_response_error_codes(file_path: Path) -> Dict[str, Set[str]]:
    if not file_path.exists():
        return {}
    content = file_path.read_text(encoding="utf-8")
    result: Dict[str, Set[str]] = {}

    starts = list(RULESET_START_RE.finditer(content))
    for i, st in enumerate(starts):
        name = st.group(1)
        section_start = st.end()
        section_end = starts[i + 1].start() if i + 1 < len(starts) else len(content)
        section = content[section_start:section_end]
        codes = {m.group(1) for m in RULESET_ERROR_CODE_RE.finditer(section)}
        result[name] = codes
    return result


def resolve_ruleset_codes(
    ruleset: str,
    refs: Dict[str, List[str]],
    base_error_codes: Dict[str, Set[str]],
    seen: Optional[Set[str]] = None,
) -> Set[str]:
    if seen is None:
        seen = set()
    if ruleset in seen:
        return set()
    seen.add(ruleset)

    out: Set[str] = set(base_error_codes.get(ruleset, set()))
    for ref in refs.get(ruleset, []):
        out.update(base_error_codes.get(ref, set()))
        if ref in refs:
            out.update(resolve_ruleset_codes(ref, refs, base_error_codes, seen))
    return out


def parse_capability_endpoint_rulesets(cap_file: Path) -> Dict[str, str]:
    if not cap_file.exists():
        return {}

    lines = cap_file.read_text(encoding="utf-8").splitlines()
    endpoint_to_ruleset: Dict[str, str] = {}
    current_resource = "unknown"

    for i, line in enumerate(lines):
        rs = RULESET_HEADER_RE.match(line)
        if rs:
            current_resource = rs.group(1).replace("Interaction", "").lower()
            continue

        m_op = CAP_RESOURCE_OPERATION_RE.match(line)
        if m_op:
            op_name = m_op.group(1)
            next_rule = _next_insert_ruleset(lines, i + 1)
            if next_rule:
                endpoint_to_ruleset[f"op:{op_name}"] = next_rule
            continue

        m_inter = CAP_RESOURCE_INTERACTION_RE.match(line)
        if m_inter:
            inter = m_inter.group(1)
            next_rule = _next_insert_ruleset(lines, i + 1)
            if next_rule:
                endpoint_to_ruleset[f"interaction:{current_resource}:{inter}"] = next_rule
            continue

        m_sys = CAP_SYSTEM_OPERATION_RE.match(line)
        if m_sys:
            sysop = m_sys.group(1)
            next_rule = _next_insert_ruleset(lines, i + 1)
            if next_rule:
                endpoint_to_ruleset[f"op:{sysop}"] = next_rule
            continue

    return endpoint_to_ruleset


def _next_insert_ruleset(lines: List[str], start_idx: int) -> Optional[str]:
    for j in range(start_idx, min(start_idx + 6, len(lines))):
        s = lines[j].strip()
        if not s:
            continue
        m = re.match(r'^\*\s*(?:rest\.[^\s]+\s+)?insert\s+([A-Za-z0-9_\-]+)\s*$', s)
        if m:
            return m.group(1)
        if s.startswith("* insert Cap"):
            return None
    return None


def check_cs_vs_consistency(error_codes: List[ErrorCode], ig_roots: Dict[str, Path]) -> List[Finding]:
    findings: List[Finding] = []

    all_cs: Dict[str, CodeSystemDef] = {}
    all_vs: Dict[str, ValueSetDef] = {}
    for ig_root in ig_roots.values():
        all_cs.update(find_codesystem_files(ig_root))
        all_vs.update(find_valueset_files(ig_root))

    for err in error_codes:
        module, cs_file, _vs_file, is_external = classify_error_code(err.code)
        if is_external:
            found = any(any(err.code in inc for inc in vs.includes) for vs in all_vs.values())
            if not found:
                findings.append(
                    Finding(
                        type="MISSING_IMPORT",
                        ig_module=module if module != "varies" else err.module,
                        file_path=err.file_path,
                        line=err.line,
                        code=err.code,
                        requirement_key=err.requirement_key,
                        message=f"Code '{err.code}' not imported in any ValueSet",
                    )
                )
        else:
            if not cs_file:
                continue
            if cs_file not in all_cs:
                findings.append(
                    Finding(
                        type="MISSING_CS_FILE",
                        ig_module=module,
                        file_path=err.file_path,
                        line=err.line,
                        code=err.code,
                        requirement_key=err.requirement_key,
                        message=f"CodeSystem '{cs_file}' not found in module '{module}'",
                    )
                )
            elif err.code not in all_cs[cs_file].codes:
                findings.append(
                    Finding(
                        type="MISSING_IN_CS",
                        ig_module=module,
                        file_path=err.file_path,
                        line=err.line,
                        code=err.code,
                        requirement_key=err.requirement_key,
                        message=f"Code '{err.code}' not defined in {cs_file}.fsh",
                    )
                )

    return findings


def check_capabilitystatement_consistency(
    error_codes: List[ErrorCode],
    ig_roots: Dict[str, Path],
    include_extra: bool = False,
) -> List[Finding]:
    findings: List[Finding] = []

    # group requirement codes by (module, endpoint)
    grouped: Dict[Tuple[str, str], List[ErrorCode]] = {}
    for err in error_codes:
        grouped.setdefault((err.module, err.endpoint), []).append(err)

    for (module, endpoint), errs in grouped.items():
        # endpoint check currently targets operation pages only
        if not endpoint.startswith("op:"):
            continue

        ig_root = ig_roots.get(module)
        if not ig_root:
            continue

        cap_file = ig_root / "input" / "fsh" / "capabilitystatement" / "ERPCapabilityStatementServer.fsh"
        resp_def_file = ig_root / "input" / "fsh" / "capabilitystatement" / "rulesets" / "ERPCapabilityStatementRulesetsResponseDefinition.fsh"
        resp_file = ig_root / "input" / "fsh" / "capabilitystatement" / "rulesets" / "ERPCapabilityStatementRulesetsResponse.fsh"

        endpoint_rulesets = parse_capability_endpoint_rulesets(cap_file)
        endpoint_rule = endpoint_rulesets.get(endpoint)
        if not endpoint_rule:
            exemplar = errs[0]
            findings.append(
                Finding(
                    type="CAPSTAT_ENDPOINT_NOT_MAPPED",
                    ig_module=module,
                    file_path=exemplar.file_path,
                    line=exemplar.line,
                    code="",
                    requirement_key=exemplar.requirement_key,
                    message=f"Endpoint '{endpoint}' not mapped to a status code RuleSet in CapabilityStatement",
                )
            )
            continue

        refs = parse_ruleset_references(resp_def_file)
        base_codes = parse_response_error_codes(resp_file)
        cap_codes = resolve_ruleset_codes(endpoint_rule, refs, base_codes)

        required_codes = {e.code for e in errs}
        for missing in sorted(required_codes - cap_codes):
            exemplar = next(e for e in errs if e.code == missing)
            findings.append(
                Finding(
                    type="CAPSTAT_MISSING_CODE",
                    ig_module=module,
                    file_path=exemplar.file_path,
                    line=exemplar.line,
                    code=missing,
                    requirement_key=exemplar.requirement_key,
                    message=(
                        f"Endpoint '{endpoint}' uses RuleSet '{endpoint_rule}' but does not expose error code '{missing}'"
                    ),
                )
            )

        if include_extra:
            # Detect endpoint-specific extras in CapabilityStatement that are not in requirements.
            # To avoid noise from broad/common defaults, treat the first insert in the wrapper as baseline.
            direct_refs = refs.get(endpoint_rule, [])
            baseline_codes: Set[str] = set()
            if direct_refs:
                baseline_codes = resolve_ruleset_codes(direct_refs[0], refs, base_codes)

            extra_codes = sorted((cap_codes - required_codes) - baseline_codes)
            if extra_codes:
                exemplar = errs[0]
                for extra in extra_codes:
                    findings.append(
                        Finding(
                            type="CAPSTAT_EXTRA_CODE",
                            ig_module=module,
                            file_path=exemplar.file_path,
                            line=exemplar.line,
                            code=extra,
                            requirement_key=exemplar.requirement_key,
                            message=(
                                f"Endpoint '{endpoint}' exposes error code '{extra}' in RuleSet '{endpoint_rule}' "
                                "but no matching requirement code was found"
                            ),
                        )
                    )

    return findings


def iter_requirement_files(targets: Iterable[str]) -> Iterable[Path]:
    if not targets:
        targets = ["igs/*/input/pagecontent"]

    def is_pagecontent_md(path: Path) -> bool:
        if not path.is_file() or path.suffix.lower() != ".md":
            return False
        parts = path.as_posix().split("/")
        return len(parts) >= 4 and parts[-2] == "pagecontent" and parts[-3] == "input" and parts[0] == "igs"

    def yield_pagecontent_md(scan_dir: Path, seen: Set[Path]) -> Iterable[Path]:
        for md_file in scan_dir.rglob("*.md"):
            if not is_pagecontent_md(md_file):
                continue
            resolved = md_file.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield md_file

    seen: Set[Path] = set()
    for target in targets:
        path = Path(target)

        if any(ch in target for ch in "*?[]"):
            for matched in Path(".").glob(target):
                if is_pagecontent_md(matched):
                    resolved = matched.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield matched
                elif matched.is_dir():
                    yield from yield_pagecontent_md(matched, seen)
            continue

        if is_pagecontent_md(path):
            resolved = path.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield path
            continue

        if path.is_dir():
            if (path / "input" / "pagecontent").is_dir():
                scan_dir = path / "input" / "pagecontent"
                yield from yield_pagecontent_md(scan_dir, seen)
                continue

            yield from yield_pagecontent_md(path, seen)


def find_ig_roots(root_dir: Path = Path("igs")) -> Dict[str, Path]:
    ig_roots: Dict[str, Path] = {}
    if not root_dir.exists():
        return ig_roots

    for ig_dir in root_dir.iterdir():
        if ig_dir.is_dir() and (ig_dir / "input").exists():
            ig_roots[ig_dir.name] = ig_dir
    return ig_roots


def extract_code_descriptions(cs_file: Path) -> Dict[str, CodeDescription]:
    """Extract code -> description mappings from a CodeSystem FSH file."""
    if not cs_file.exists():
        return {}

    content = cs_file.read_text(encoding="utf-8")
    descriptions: Dict[str, CodeDescription] = {}

    lines = content.splitlines()
    for line_no, line in enumerate(lines, 1):
        m = re.match(r"^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+\"([^\"]*)\"\s*(?:\"([^\"]*)\")?\s*$", line)
        if m:
            code = m.group(1)
            display = m.group(2)
            description_long = m.group(3) or ""
            # Use the long description if available, otherwise use display
            final_desc = description_long if description_long else display
            descriptions[code] = CodeDescription(
                code=code,
                display=display,
                description=final_desc,
                file_path=cs_file,
                line=line_no,
            )

    return descriptions


def extract_ruleset_descriptions(ruleset_file: Path) -> Dict[str, Dict[str, str]]:
    """Extract ruleset -> code -> description mappings from a RuleSet FSH file.
    Returns: {ruleset_name: {error_code: description}}
    """
    if not ruleset_file.exists():
        return {}

    content = ruleset_file.read_text(encoding="utf-8")
    result: Dict[str, Dict[str, str]] = {}

    # Find all RuleSets
    starts = list(RULESET_START_RE.finditer(content))
    for i, st in enumerate(starts):
        name = st.group(1)
        section_start = st.end()
        section_end = starts[i + 1].start() if i + 1 < len(starts) else len(content)
        section = content[section_start:section_end]

        # Find errorCode -> description pairs in this ruleset
        codes_in_ruleset: Dict[str, str] = {}
        for code_match in RULESET_ERROR_CODE_RE.finditer(section):
            code = code_match.group(1)
            # Find the description line before this errorCode
            desc_match = re.search(
                r'extension\[description\]\.valueString\s*=\s*"([^"]*)"',
                section[: code_match.start()],
            )
            if desc_match:
                desc = desc_match.group(1)
                codes_in_ruleset[code] = desc

        if codes_in_ruleset:
            result[name] = codes_in_ruleset

    return result


def check_description_consistency(
    ig_roots: Dict[str, Path],
) -> List[Finding]:
    """Check that code descriptions in RuleSets match CodeSystem definitions."""
    findings: List[Finding] = []

    # Build a map of module -> code -> description from CodeSystems
    cs_descriptions: Dict[str, Dict[str, CodeDescription]] = {}
    for module, ig_root in ig_roots.items():
        cs_defs = find_codesystem_files(ig_root)
        for cs_name, cs_def in cs_defs.items():
            descs = extract_code_descriptions(cs_def.file_path)
            if cs_name not in cs_descriptions:
                cs_descriptions[cs_name] = {}
            cs_descriptions[cs_name].update(descs)

    # Check each CapabilityStatement RuleSet file
    for module, ig_root in ig_roots.items():
        ruleset_file = ig_root / "input" / "fsh" / "capabilitystatement" / "rulesets" / "ERPCapabilityStatementRulesetsResponse.fsh"
        ruleset_descs = extract_ruleset_descriptions(ruleset_file)

        for ruleset_name, codes_and_descs in ruleset_descs.items():
            for error_code, ruleset_desc in codes_and_descs.items():
                # Find which CS this code should come from
                module_for_code, cs_name, _vs_name, _is_external = classify_error_code(error_code)
                if not cs_name or cs_name not in cs_descriptions:
                    continue

                cs_desc_map = cs_descriptions[cs_name]
                if error_code not in cs_desc_map:
                    continue

                cs_desc_obj = cs_desc_map[error_code]
                cs_desc = cs_desc_obj.description

                if ruleset_desc != cs_desc:
                    findings.append(
                        Finding(
                            type="DESCRIPTION_MISMATCH",
                            ig_module=module,
                            file_path=ruleset_file,
                            line=0,  # Could find exact line but not critical
                            code=error_code,
                            requirement_key=f"RuleSet:{ruleset_name}",
                            message=f"RuleSet '{ruleset_name}' has description '{ruleset_desc}' but CodeSystem has '{cs_desc}'",
                        )
                    )

    return findings


def fix_description_mismatches(findings: List[Finding], ig_roots: Dict[str, Path]) -> int:
    """Fix description mismatches by updating RuleSet descriptions from CodeSystem."""
    fixes_applied = 0

    # Build code -> description map from CodeSystems
    cs_descriptions: Dict[str, CodeDescription] = {}
    for module, ig_root in ig_roots.items():
        cs_defs = find_codesystem_files(ig_root)
        for cs_def in cs_defs.values():
            descs = extract_code_descriptions(cs_def.file_path)
            cs_descriptions.update(descs)

    # Group findings by file
    findings_by_file: Dict[Path, List[Finding]] = {}
    for finding in findings:
        if finding.type != "DESCRIPTION_MISMATCH":
            continue
        if finding.file_path not in findings_by_file:
            findings_by_file[finding.file_path] = []
        findings_by_file[finding.file_path].append(finding)

    for file_path, file_findings in findings_by_file.items():
        if not file_path.exists():
            continue

        content = file_path.read_text(encoding="utf-8")
        lines = content.splitlines(keepends=True)
        modified = False

        # Process findings in reverse order to maintain line numbers
        for finding in sorted(file_findings, key=lambda f: -1):
            code = finding.code
            if code not in cs_descriptions:
                continue

            cs_desc = cs_descriptions[code].description
            ruleset_name = finding.requirement_key.split(":", 1)[1]

            # Find the ruleset and its errorCode line
            for i, line in enumerate(lines):
                if f"RuleSet: {ruleset_name}" in line:
                    # Found the ruleset, now look for the errorCode
                    for j in range(i + 1, min(i + 20, len(lines))):
                        if f'extension[errorCode].valueString = "{code}"' in lines[j]:
                            # Found the error code, now find and replace the description before it
                            for k in range(j - 1, max(i, j - 10), -1):
                                if "extension[description].valueString" in lines[k]:
                                    # Replace this line's description
                                    old_line = lines[k]
                                    new_line = re.sub(
                                        r'(extension\[description\]\.valueString\s*=\s*)"[^"]*"',
                                        rf'\1"{cs_desc}"',
                                        old_line,
                                    )
                                    if new_line != old_line:
                                        lines[k] = new_line
                                        modified = True
                                        print(f"  [FIX] Updated description for {code} in {ruleset_name}")
                                    break
                            break
                    break

        if modified:
            file_path.write_text("".join(lines), encoding="utf-8")
            fixes_applied += 1

    return fixes_applied


def _to_ruleset_name(code: str) -> str:
    """Convert an error code string like TIFLOW_SECRET_MISMATCH to TIFLOWSecretMismatch."""
    parts = code.split("_")
    return "".join(p.capitalize() for p in parts)


def _endpoint_to_default_ruleset(endpoint: str) -> Optional[str]:
    if not endpoint.startswith("op:"):
        return None
    op_name = endpoint.split(":", 1)[1]
    return "Task" + "".join(part.capitalize() for part in op_name.split("-")) + "OperationStatusCodes"


def _extract_endpoint_from_message(message: str) -> Optional[str]:
    m = re.search(r"Endpoint '([^']+)'", message)
    return m.group(1) if m else None


def _ensure_capability_endpoint_mapping(cap_file: Path, endpoint: str, endpoint_rule: str) -> bool:
    if not cap_file.exists() or not endpoint.startswith("op:"):
        return False

    op_name = endpoint.split(":", 1)[1]
    lines = cap_file.read_text(encoding="utf-8").splitlines()

    op_line_re = re.compile(r'^\s*\*\s*insert\s+CapSupport(?:Resource|System)Operation\(' + re.escape(op_name) + r',')
    insert_re = re.compile(r'^\s*\*\s*(?:rest\.[^\s]+\s+)?insert\s+([A-Za-z0-9_\-]+)\s*$')

    for i, line in enumerate(lines):
        if not op_line_re.match(line):
            continue

        # If already mapped nearby, nothing to do.
        for j in range(i + 1, min(i + 8, len(lines))):
            nxt = lines[j].strip()
            if not nxt:
                continue
            m_insert = insert_re.match(nxt)
            if m_insert:
                return True
            if nxt.startswith("* insert Cap") or nxt.startswith("RuleSet:"):
                break

        indent = line[: len(line) - len(line.lstrip())]
        lines.insert(i + 1, f"{indent}* insert {endpoint_rule}")
        cap_file.write_text("\n".join(lines) + "\n", encoding="utf-8")
        return True

    return False


def _wrapper_insert_line(resp_def_content: str, endpoint_rule: str, rs_name: str) -> Optional[str]:
    wrapper_header = f"RuleSet: {endpoint_rule}"
    if wrapper_header not in resp_def_content:
        return None

    wrapper_start = resp_def_content.index(wrapper_header)
    next_ruleset = resp_def_content.find("\nRuleSet:", wrapper_start + len(wrapper_header))
    wrapper_section = resp_def_content[wrapper_start: next_ruleset if next_ruleset != -1 else len(resp_def_content)]

    already_re = re.compile(r'^\s*\*\s*(?:rest\.[^\s]+\s+)?insert\s+' + re.escape(rs_name) + r'\s*$', re.MULTILINE)
    if already_re.search(wrapper_section):
        return None

    prefix = ""
    for line in wrapper_section.splitlines():
        m = re.match(r'^\s*\*\s*(rest\.[^\s]+\s+)insert\s+[A-Za-z0-9_\-]+\s*$', line)
        if m:
            prefix = m.group(1)
            break
    return f"* {prefix}insert {rs_name}\n"


def fix_cs_vs(findings: List[Finding], ig_roots: Dict[str, Path], error_codes: List[ErrorCode]) -> int:
    """Auto-fix MISSING_IN_CS and MISSING_IMPORT findings. Returns number of files modified."""
    fixes_applied = 0

    # Build a lookup: code -> ErrorCode (use first occurrence)
    code_info: Dict[str, ErrorCode] = {}
    for ec in error_codes:
        if ec.code not in code_info:
            code_info[ec.code] = ec

    for finding in findings:
        if finding.type == "MISSING_IN_CS":
            module, cs_id, _vs_id, _ = classify_error_code(finding.code)
            ig_root = ig_roots.get(module)
            if not ig_root or not cs_id:
                continue
            cs_file = ig_root / "input" / "fsh" / "codesystems" / f"{cs_id}.fsh"
            if not cs_file.exists():
                print(f"  [SKIP] CS file not found: {cs_file}")
                continue

            content = cs_file.read_text(encoding="utf-8")
            # Check not already present
            if f"#{finding.code}" in content:
                continue

            description = f"TODO: add description for {finding.code}"
            new_line = f'* #{finding.code} "{description}"\n'
            cs_file.write_text(content.rstrip("\n") + "\n" + new_line, encoding="utf-8")
            print(f"  [FIX] Added #{finding.code} to {cs_file}")
            fixes_applied += 1

        elif finding.type == "MISSING_IMPORT":
            # External codes (MSG_xxx, SVC_xxx) should be included in core's main OutcomeDetails VS.
            ig_root = ig_roots.get("core")
            if not ig_root:
                print(f"  [SKIP] Core IG root not found for external code '{finding.code}'")
                continue

            valuesets_dir = ig_root / "input" / "fsh" / "valuesets"
            if not valuesets_dir.exists():
                print(f"  [SKIP] Valuesets dir not found: {valuesets_dir}")
                continue

            # Prefer the VS specifically for OperationOutcome error codes
            target_vs: Optional[Path] = None
            outcome_keywords = ("operationoutcomedetails", "operationoutcome", "errorcodes", "errorcode")
            for vs_file in sorted(valuesets_dir.glob("*.fsh")):
                if any(kw in vs_file.stem.lower() for kw in outcome_keywords):
                    vs_content = vs_file.read_text(encoding="utf-8")
                    if FSH_INCLUDE_EXTERNAL_RE.search(vs_content):
                        target_vs = vs_file
                        break
            # Fall back to any VS with existing external includes
            if target_vs is None:
                for vs_file in sorted(valuesets_dir.glob("*.fsh")):
                    vs_content_check = vs_file.read_text(encoding="utf-8")
                    if FSH_INCLUDE_EXTERNAL_RE.search(vs_content_check):
                        if not any(kw in vs_file.stem.lower() for kw in ("availability", "type", "feature", "environment", "flow", "document")):
                            target_vs = vs_file
                            break

            if target_vs is None:
                candidates = sorted(valuesets_dir.glob("*.fsh"))
                if not candidates:
                    print(f"  [SKIP] No ValueSet files in {valuesets_dir}")
                    continue
                target_vs = candidates[0]

            vs_content = target_vs.read_text(encoding="utf-8")
            if finding.code in vs_content:
                continue

            # Use correct alias: MSG_ → $hl7-oo, SVC_ → $ti-oo
            if finding.code.startswith("MSG_"):
                alias = "$hl7-oo"
            elif finding.code.startswith("SVC_"):
                alias = "$ti-oo"
            else:
                alias = "$ExternalCS"

            new_line = f'* include {alias}#{finding.code} "TODO: description for {finding.code}"\n'
            target_vs.write_text(vs_content.rstrip("\n") + "\n" + new_line, encoding="utf-8")
            print(f"  [FIX] Added include {alias}#{finding.code} to {target_vs}")
            fixes_applied += 1

    return fixes_applied


def fix_capstat(findings: List[Finding], ig_roots: Dict[str, Path], error_codes: List[ErrorCode]) -> int:
    """Auto-fix CAPSTAT_ENDPOINT_NOT_MAPPED and CAPSTAT_MISSING_CODE findings. Returns number of fixes applied."""
    fixes_applied = 0

    # Build code -> ErrorCode info lookup
    code_info: Dict[str, ErrorCode] = {}
    for ec in error_codes:
        if ec.code not in code_info:
            code_info[ec.code] = ec

    # First, ensure endpoint mappings exist for CAPSTAT_ENDPOINT_NOT_MAPPED findings.
    for finding in findings:
        if finding.type != "CAPSTAT_ENDPOINT_NOT_MAPPED":
            continue
        endpoint = _extract_endpoint_from_message(finding.message)
        if not endpoint:
            continue
        endpoint_rule = _endpoint_to_default_ruleset(endpoint)
        if not endpoint_rule:
            continue

        ig_root = ig_roots.get(finding.ig_module)
        if not ig_root:
            continue

        cap_file = ig_root / "input" / "fsh" / "capabilitystatement" / "ERPCapabilityStatementServer.fsh"
        resp_def_file = ig_root / "input" / "fsh" / "capabilitystatement" / "rulesets" / "ERPCapabilityStatementRulesetsResponseDefinition.fsh"

        if _ensure_capability_endpoint_mapping(cap_file, endpoint, endpoint_rule):
            print(f"  [FIX] Mapped endpoint '{endpoint}' to '{endpoint_rule}' in {cap_file.name}")
            fixes_applied += 1

    # Group all CAPSTAT_MISSING_CODE findings by (module, endpoint)
    missing_by_endpoint: Dict[Tuple[str, str], List[Finding]] = {}
    for finding in findings:
        if finding.type == "CAPSTAT_MISSING_CODE":
            endpoint = _extract_endpoint_from_message(finding.message)
            if not endpoint:
                continue
            key = (finding.ig_module, endpoint)
            missing_by_endpoint.setdefault(key, []).append(finding)

    for (module, endpoint), endpoint_findings in missing_by_endpoint.items():
        ig_root = ig_roots.get(module)
        if not ig_root:
            continue

        cap_file = ig_root / "input" / "fsh" / "capabilitystatement" / "ERPCapabilityStatementServer.fsh"
        resp_def_file = ig_root / "input" / "fsh" / "capabilitystatement" / "rulesets" / "ERPCapabilityStatementRulesetsResponseDefinition.fsh"
        resp_file = ig_root / "input" / "fsh" / "capabilitystatement" / "rulesets" / "ERPCapabilityStatementRulesetsResponse.fsh"

        endpoint_rulesets = parse_capability_endpoint_rulesets(cap_file)
        endpoint_rule = endpoint_rulesets.get(endpoint)
        if not endpoint_rule:
            print(f"  [SKIP] Endpoint '{endpoint}' not mapped in {cap_file}")
            continue

        resp_content = resp_file.read_text(encoding="utf-8")
        resp_def_content = resp_def_file.read_text(encoding="utf-8")

        for finding in endpoint_findings:
            code = finding.code
            rs_name = _to_ruleset_name(code)

            # 1. Add base RuleSet to resp_file if not already present
            if f"RuleSet: {rs_name}" not in resp_content:
                ec = code_info.get(code)
                http_code = ec.http_code if ec else "400"
                description = f"TODO: description for {code}"
                response_type = "TIFlowOperationOutcome"

                new_ruleset = (
                    f"\nRuleSet: {rs_name}\n"
                    f"* extension[responseInfo][+]\n"
                    f'  * extension[statusCode].valueString = "{http_code}"\n'
                    f'  * extension[description].valueString = "{description}"\n'
                    f'  * extension[responseType].valueString = "{response_type}"\n'
                    f'  * extension[errorCode].valueString = "{code}"\n'
                )
                resp_file.write_text(resp_content.rstrip("\n") + "\n" + new_ruleset, encoding="utf-8")
                resp_content = resp_file.read_text(encoding="utf-8")
                print(f"  [FIX] Added RuleSet {rs_name} to {resp_file.name}")
                fixes_applied += 1

            # 2. Insert `* insert <RuleSetName>` into the wrapper RuleSet in resp_def_file.
            wrapper_header = f"RuleSet: {endpoint_rule}"
            if wrapper_header not in resp_def_content:
                print(f"  [SKIP] Wrapper RuleSet '{endpoint_rule}' not found in {resp_def_file}")
                continue

            insert_line = _wrapper_insert_line(resp_def_content, endpoint_rule, rs_name)
            if insert_line is None:
                continue

            wrapper_start = resp_def_content.index(wrapper_header)
            next_ruleset = resp_def_content.find("\nRuleSet:", wrapper_start + len(wrapper_header))
            if next_ruleset != -1:
                insert_pos = next_ruleset
                new_def_content = (
                    resp_def_content[:insert_pos]
                    + insert_line
                    + resp_def_content[insert_pos:]
                )
            else:
                new_def_content = resp_def_content.rstrip("\n") + "\n" + insert_line

            resp_def_file.write_text(new_def_content, encoding="utf-8")
            resp_def_content = resp_def_file.read_text(encoding="utf-8")
            print(f"  [FIX] Added '* insert {rs_name}' to wrapper '{endpoint_rule}' in {resp_def_file.name}")
            fixes_applied += 1

    return fixes_applied


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check consistency of error codes in requirements, CodeSystem/ValueSet, and CapabilityStatement."
    )
    parser.add_argument("targets", nargs="*", help="Files/directories to scan (default: igs/*/input/pagecontent)")
    parser.add_argument(
        "--fix",
        action="store_true",
        help="Auto-fix MISSING_IN_CS, MISSING_IMPORT, CAPSTAT_ENDPOINT_NOT_MAPPED, CAPSTAT_MISSING_CODE, and DESCRIPTION_MISMATCH findings",
    )
    parser.add_argument(
        "--report-capstat-extra",
        action="store_true",
        help="Also report CAPSTAT_EXTRA_CODE findings (off by default to avoid baseline-noise)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/error-code-consistency-report.csv",
        help="Write CSV report to this file (default: qa/error-code-consistency-report.csv)",
    )
    args = parser.parse_args()

    req_files = list(iter_requirement_files(args.targets))
    if not req_files:
        print("No requirement files found for the given targets.")
        return 1

    error_codes = extract_error_codes_from_requirements(req_files)
    if not error_codes:
        print("No error codes found in requirement files.")
        return 0

    ig_roots = find_ig_roots()
    if not ig_roots:
        print("Warning: No IG roots found in 'igs/' directory.")
        return 1

    findings = []
    findings.extend(check_cs_vs_consistency(error_codes, ig_roots))
    findings.extend(check_capabilitystatement_consistency(error_codes, ig_roots, include_extra=args.report_capstat_extra))
    findings.extend(check_description_consistency(ig_roots))

    if args.fix and findings:
        print("\n==> Applying auto-fixes...")
        for _pass in range(3):
            applied = 0
            applied += fix_cs_vs(findings, ig_roots, error_codes)
            applied += fix_capstat(findings, ig_roots, error_codes)
            applied += fix_description_mismatches(findings, ig_roots)

            print("\nRe-running checks after fixes...")
            findings = []
            findings.extend(check_cs_vs_consistency(error_codes, ig_roots))
            findings.extend(
                check_capabilitystatement_consistency(error_codes, ig_roots, include_extra=args.report_capstat_extra)
            )
            findings.extend(check_description_consistency(ig_roots))

            if not findings:
                break
            if applied == 0:
                break

    csv_path = Path(args.output_csv)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", encoding="utf-8", newline="") as fp:
        writer = csv.writer(fp)
        writer.writerow(["type", "ig_module", "file", "line", "code", "requirement_key", "message"])
        for f in findings:
            writer.writerow([f.type, f.ig_module, str(f.file_path), f.line, f.code, f.requirement_key, f.message])
        writer.writerow(
            [
                "SUMMARY",
                "",
                "",
                "",
                "",
                "",
                f"Scanned {len(req_files)} requirement file(s), extracted {len(error_codes)} error code(s), found {len(findings)} issue(s).",
            ]
        )

    print("\n==> Error Code Consistency Check")
    print(f"Scanned: {len(req_files)} requirement file(s)")
    print(f"Extracted: {len(error_codes)} error code(s)")
    print(f"Issues: {len(findings)}")
    if findings:
        print("\nIssues found:")
        for f in findings:
            print(f"  [{f.type}] {f.file_path}:{f.line} {f.requirement_key}: {f.code} - {f.message}")
    print(f"\nCSV report written to: {csv_path}")

    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
