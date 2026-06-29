"""FSH and Markdown parsing utilities for error code extraction."""

from __future__ import annotations

import re
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Set

from .models import CodeDescription, CodeSystemDef, ErrorCode, ValueSetDef

# ── Markdown / requirement regexes ──────────────────────────────────────────

ERROR_TABLE_RE = re.compile(r'<table[^>]*id="error-code"[^>]*>.*?</table>', re.DOTALL)
DETAILS_CODE_RE = re.compile(r'<th>Details Code</th>\s*<td>([^<]+)</td>', re.DOTALL)
REQUIREMENT_KEY_RE = re.compile(r'<requirement[^>]*\bkey="([^"]+)"[^>]*>')
REQUIREMENT_TAG_RE = re.compile(r'<requirement\b[^>]*>', re.IGNORECASE)
REQUIREMENT_KEY_ATTR_RE = re.compile(r'\bkey="([^"]+)"')
REQUIREMENT_TITLE_ATTR_RE = re.compile(r'\btitle="([^"]*)"')
INCLUDE_CORE_RE = re.compile(r'{%\s*include\s+core\.([^\s%]+)\s*%}')
ERROR_CODE_LIKE_RE = re.compile(r'^[A-Z0-9][A-Z0-9_\-]*$')

# ── FSH regexes ──────────────────────────────────────────────────────────────

FSH_CODE_DEF_RE = re.compile(r'^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+"([^"]*)"', re.MULTILINE)
FSH_INCLUDE_CODES_RE = re.compile(r'^\s*\*\s+include\s+codes\s+from\s+system\s+(\S+)', re.MULTILINE)
FSH_INCLUDE_EXTERNAL_RE = re.compile(
    r'^\s*\*\s+include\s+([\$\w\-]+)#([A-Za-z0-9_\-]+)(?:\s+"([^"]*)")?',
    re.MULTILINE,
)

RULESET_START_RE = re.compile(r'^\s*RuleSet:\s*([A-Za-z0-9_\-]+)', re.MULTILINE)
# Matches both plain "* insert X" and path-prefixed "* rest.resource[=].operation[=] insert X"
RULESET_INSERT_RE = re.compile(
    r'^\s*\*\s*(?:rest\.[^\s]+\s+)?insert\s+([A-Za-z0-9_\-]+)\s*$', re.MULTILINE
)
RULESET_ERROR_CODE_RE = re.compile(r'extension\[errorCode\]\.valueString\s*=\s*"([^"]+)"')

RULESET_HEADER_RE = re.compile(
    r'^\s*RuleSet:\s*([A-Za-z0-9_\-]+)Interaction\(expectation\)', re.MULTILINE
)
CAP_RESOURCE_INTERACTION_RE = re.compile(
    r'^\s*\*\s*insert\s+CapResourceInteraction\(#([a-z\-]+),', re.MULTILINE
)
CAP_RESOURCE_OPERATION_RE = re.compile(
    r'^\s*\*\s*insert\s+CapSupport(?:Resource|System)Operation\(([a-z0-9\-]+),\s*([^,]+),',
    re.MULTILINE,
)
CAP_SYSTEM_OPERATION_RE = re.compile(
    r'^\s*\*\s*insert\s+CapSupportSystemOperation\(([a-z0-9\-]+),\s*([^,]+),',
    re.MULTILINE,
)


# ── Path helpers ─────────────────────────────────────────────────────────────


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


# ── Requirement / Markdown parsing ───────────────────────────────────────────


def parse_tables_from_content(
    content: str, file_path: Path, module: str, endpoint: str
) -> List[ErrorCode]:
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
    """Extract all error codes from requirement tables in the given markdown files."""
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


# ── FSH CodeSystem / ValueSet discovery ──────────────────────────────────────


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
        includes.extend(
            f"{m.group(1)}#{m.group(2)}" for m in FSH_INCLUDE_EXTERNAL_RE.finditer(content)
        )
        vs_defs[vs_file.stem] = ValueSetDef(id=vs_file.stem, file_path=vs_file, includes=includes)
    return vs_defs


def parse_valueset_external_includes(file_path: Path) -> Dict[str, tuple[Optional[str], int]]:
    """Return {"<system>#CODE": (description_or_none, line_no)} for external ValueSet includes."""
    if not file_path.exists():
        return {}

    includes: Dict[str, tuple[Optional[str], int]] = {}
    for line_no, line in enumerate(file_path.read_text(encoding="utf-8").splitlines(), 1):
        match = FSH_INCLUDE_EXTERNAL_RE.match(line)
        if not match:
            continue
        alias, code, description = match.groups()
        includes[f"{alias}#{code}"] = (description, line_no)
    return includes


# ── FSH RuleSet parsing ───────────────────────────────────────────────────────


def _iter_ruleset_sections(content: str):
    """Yield (name, section_text) for every RuleSet in a FSH file."""
    starts = list(RULESET_START_RE.finditer(content))
    for i, st in enumerate(starts):
        name = st.group(1)
        section_start = st.end()
        section_end = starts[i + 1].start() if i + 1 < len(starts) else len(content)
        yield name, content[section_start:section_end]


def parse_ruleset_references(file_path: Path) -> Dict[str, List[str]]:
    """Return {ruleset_name: [inserted_ruleset_names]} from a FSH file."""
    if not file_path.exists():
        return {}
    content = file_path.read_text(encoding="utf-8")
    return {
        name: [m.group(1) for m in RULESET_INSERT_RE.finditer(section)]
        for name, section in _iter_ruleset_sections(content)
    }


def parse_response_error_codes(file_path: Path) -> Dict[str, Set[str]]:
    """Return {ruleset_name: {error_codes}} from a FSH response RuleSet file."""
    if not file_path.exists():
        return {}
    content = file_path.read_text(encoding="utf-8")
    return {
        name: {m.group(1) for m in RULESET_ERROR_CODE_RE.finditer(section)}
        for name, section in _iter_ruleset_sections(content)
    }


def resolve_ruleset_codes(
    ruleset: str,
    refs: Dict[str, List[str]],
    base_error_codes: Dict[str, Set[str]],
    seen: Optional[Set[str]] = None,
) -> Set[str]:
    """Recursively resolve all error codes reachable from a given RuleSet."""
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


# ── CapabilityStatement FSH parsing ──────────────────────────────────────────


def _next_insert_ruleset(lines: List[str], start_idx: int) -> Optional[str]:
    """Find the first `(* [rest.X]) insert RuleSetName` within the next few lines."""
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


def parse_capability_endpoint_rulesets(cap_file: Path) -> Dict[str, str]:
    """Return {endpoint_key: wrapper_ruleset_name} from a CapabilityStatement FSH file."""
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


# ── Description extraction ────────────────────────────────────────────────────


def extract_code_descriptions(cs_file: Path) -> Dict[str, CodeDescription]:
    """Extract code → CodeDescription from a CodeSystem FSH file.

    Uses the display name (first quoted string) as the canonical description.
    """
    if not cs_file.exists():
        return {}

    content = cs_file.read_text(encoding="utf-8")
    descriptions: Dict[str, CodeDescription] = {}

    for line_no, line in enumerate(content.splitlines(), 1):
        m = re.match(
            r"^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+\"([^\"]*)\"\s*(?:\"([^\"]*)\")?\s*$", line
        )
        if m:
            code = m.group(1)
            display = m.group(2)
            descriptions[code] = CodeDescription(
                code=code,
                display=display,
                description=display,
                file_path=cs_file,
                line=line_no,
            )

    return descriptions


def extract_ruleset_descriptions(ruleset_file: Path) -> Dict[str, Dict[str, str]]:
    """Return {ruleset_name: {error_code: description}} from a response RuleSet FSH file."""
    if not ruleset_file.exists():
        return {}

    content = ruleset_file.read_text(encoding="utf-8")
    result: Dict[str, Dict[str, str]] = {}

    for name, section in _iter_ruleset_sections(content):
        codes_in_ruleset: Dict[str, str] = {}
        for code_match in RULESET_ERROR_CODE_RE.finditer(section):
            code = code_match.group(1)
            desc_match = re.search(
                r'extension\[description\]\.valueString\s*=\s*"([^"]*)"',
                section[: code_match.start()],
            )
            if desc_match:
                codes_in_ruleset[code] = desc_match.group(1)
        if codes_in_ruleset:
            result[name] = codes_in_ruleset

    return result
