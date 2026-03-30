"""Auto-fix functions for error code consistency issues."""

from __future__ import annotations

import re
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

from .classification import (
    classify_error_code,
    expected_import_system,
    module_outcome_valueset_name,
    normalize_include_token,
)
from .models import CodeDescription, ErrorCode, Finding
from .parsing import (
    extract_code_descriptions,
    find_codesystem_files,
    find_valueset_files,
    parse_capability_endpoint_rulesets,
    parse_response_error_codes,
    parse_ruleset_references,
    parse_valueset_external_includes,
    RULESET_ERROR_CODE_RE,
    RULESET_START_RE,
)


# ── Path helper (mirrors checks._cap_files) ──────────────────────────────────


def _cap_files(ig_root: Path) -> Tuple[Path, Path, Path]:
    cap_dir = ig_root / "input" / "fsh" / "capabilitystatement"
    return (
        cap_dir / "ERPCapabilityStatementServer.fsh",
        cap_dir / "rulesets" / "ERPCapabilityStatementRulesetsResponseDefinition.fsh",
        cap_dir / "rulesets" / "ERPCapabilityStatementRulesetsResponse.fsh",
    )


def _aliases_file(ig_root: Path) -> Path:
    return ig_root / "input" / "fsh" / "aliases.fsh"


# ── Naming helpers ────────────────────────────────────────────────────────────


def _to_ruleset_name(code: str) -> str:
    """Convert e.g. TIFLOW_SECRET_MISMATCH → TiflowSecretMismatch."""
    return "".join(p.capitalize() for p in code.split("_"))


def _endpoint_to_default_ruleset(endpoint: str) -> Optional[str]:
    if not endpoint.startswith("op:"):
        return None
    op_name = endpoint.split(":", 1)[1]
    return "Task" + "".join(part.capitalize() for part in op_name.split("-")) + "OperationStatusCodes"


def _extract_endpoint_from_message(message: str) -> Optional[str]:
    m = re.search(r"Endpoint '([^']+)'", message)
    return m.group(1) if m else None


def _parse_alias_canonicals(ig_root: Path) -> Dict[str, str]:
    aliases_file = _aliases_file(ig_root)
    if not aliases_file.exists():
        return {}

    aliases: Dict[str, str] = {}
    alias_re = re.compile(r'^\s*Alias:\s*(\$[A-Za-z0-9_\-]+)\s*=\s*(\S+)\s*$')
    for line in aliases_file.read_text(encoding="utf-8").splitlines():
        match = alias_re.match(line)
        if not match:
            continue
        alias, canonical = match.groups()
        if canonical.startswith(("http://", "https://")):
            aliases[alias] = canonical
    return aliases


def _normalize_capability_operation_canonicals(cap_file: Path, ig_root: Path) -> int:
    """Replace aliased operation canonicals with absolute URLs in CapabilityStatement FSH."""
    if not cap_file.exists():
        return 0

    aliases = _parse_alias_canonicals(ig_root)
    if not aliases:
        return 0

    lines = cap_file.read_text(encoding="utf-8").splitlines()
    updated = 0
    op_line_re = re.compile(
        r'^(\s*\*\s*insert\s+CapSupport(?:Resource|System)Operation\([a-z0-9\-]+,\s*)([^,]+)(,.*)$'
    )

    for idx, line in enumerate(lines):
        match = op_line_re.match(line)
        if not match:
            continue
        prefix, operation_arg, suffix = match.groups()
        operation_arg = operation_arg.strip()
        canonical = aliases.get(operation_arg)
        if not canonical:
            continue
        lines[idx] = f"{prefix}{canonical}{suffix}"
        updated += 1

    if updated:
        cap_file.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return updated


def _valueset_import_description_sources(ig_roots: Dict[str, Path]) -> Dict[str, str]:
    """Build import-token → short-description lookup from core ValueSet and CodeSystem."""
    core_root = ig_roots.get("core")
    if not core_root:
        return {}

    source_descriptions: Dict[str, str] = {}

    core_vs = core_root / "input" / "fsh" / "valuesets" / "TIFLOW_VS_OperationOutcomeDetails.fsh"
    for include_token, (description, _line) in parse_valueset_external_includes(core_vs).items():
        if description:
            source_descriptions[normalize_include_token(include_token)] = description

    core_cs = core_root / "input" / "fsh" / "codesystems" / "TIFLOW_CS_OperationOutcomeDetails.fsh"
    for code, desc in extract_code_descriptions(core_cs).items():
        source_descriptions[f"TIFLOWOperationOutcomeDetailsCS#{code}"] = desc.description

    return source_descriptions


def _ruleset_name_for_code(code: str) -> str:
    return "".join(part.capitalize() for part in code.split("_"))


# ── CapabilityStatement patching helpers ──────────────────────────────────────


def _ensure_capability_endpoint_mapping(
    cap_file: Path, endpoint: str, endpoint_rule: str
) -> bool:
    """Insert `* insert <endpoint_rule>` after the matching operation line if not already present."""
    if not cap_file.exists() or not endpoint.startswith("op:"):
        return False

    op_name = endpoint.split(":", 1)[1]
    lines = cap_file.read_text(encoding="utf-8").splitlines()

    op_line_re = re.compile(
        r'^\s*\*\s*insert\s+CapSupport(?:Resource|System)Operation\(' + re.escape(op_name) + r','
    )
    insert_re = re.compile(r'^\s*\*\s*(?:rest\.[^\s]+\s+)?insert\s+([A-Za-z0-9_\-]+)\s*$')

    for i, line in enumerate(lines):
        if not op_line_re.match(line):
            continue
        # If already mapped nearby, nothing to do.
        for j in range(i + 1, min(i + 8, len(lines))):
            nxt = lines[j].strip()
            if not nxt:
                continue
            if insert_re.match(nxt):
                return True
            if nxt.startswith("* insert Cap") or nxt.startswith("RuleSet:"):
                break

        indent = line[: len(line) - len(line.lstrip())]
        lines.insert(i + 1, f"{indent}* insert {endpoint_rule}")
        cap_file.write_text("\n".join(lines) + "\n", encoding="utf-8")
        return True

    return False


def _wrapper_insert_line(
    resp_def_content: str,
    endpoint_rule: str,
    rs_name: str,
    endpoint: str = "",
) -> Optional[str]:
    """Build the insert line to add rs_name into the endpoint_rule wrapper RuleSet.

    Detects the existing path prefix (e.g. ``rest.resource[=].operation[=] ``) from the
    wrapper's current lines so that new inserts are consistently scoped to the correct
    FHIR path. Falls back to ``rest.resource[=].operation[=] `` for operation endpoints.
    Returns None if rs_name is already present.
    """
    wrapper_header = f"RuleSet: {endpoint_rule}"
    if wrapper_header not in resp_def_content:
        return None

    wrapper_start = resp_def_content.index(wrapper_header)
    next_ruleset = resp_def_content.find("\nRuleSet:", wrapper_start + len(wrapper_header))
    wrapper_section = resp_def_content[
        wrapper_start : next_ruleset if next_ruleset != -1 else len(resp_def_content)
    ]

    already_re = re.compile(
        r'^\s*\*\s*(?:rest\.[^\s]+\s+)?insert\s+' + re.escape(rs_name) + r'\s*$',
        re.MULTILINE,
    )
    if already_re.search(wrapper_section):
        return None

    # Detect the path prefix used by existing insert lines in this wrapper.
    prefix = ""
    for line in wrapper_section.splitlines():
        m = re.match(r'^\s*\*\s*(rest\.[^\s]+\s+)insert\s+[A-Za-z0-9_\-]+\s*$', line)
        if m:
            prefix = m.group(1)
            break

    # Fallback: operation endpoints must scope to the last operation element.
    if not prefix and endpoint.startswith("op:"):
        prefix = "rest.resource[=].operation[=] "

    return f"* {prefix}insert {rs_name}\n"


# ── Fix functions ─────────────────────────────────────────────────────────────


def fix_valueset_import_descriptions(findings: List[Finding], ig_roots: Dict[str, Path]) -> int:
    """Update imported module ValueSet entries to use the short description defined in core."""
    fixes_applied = 0
    source_descriptions = _valueset_import_description_sources(ig_roots)
    if not source_descriptions:
        return fixes_applied

    findings_by_file: Dict[Path, List[Finding]] = {}
    for finding in findings:
        if finding.type == "VALUESET_IMPORT_DESCRIPTION_MISMATCH":
            findings_by_file.setdefault(finding.file_path, []).append(finding)

    include_re = re.compile(
        r'^(\s*\*\s+include\s+([\$\w\-]+#[A-Za-z0-9_\-]+))(?:\s+"([^"]*)")?\s*$'
    )

    for file_path, file_findings in findings_by_file.items():
        if not file_path.exists():
            continue

        updated_lines = file_path.read_text(encoding="utf-8").splitlines()
        modified = False
        target_codes = {finding.code for finding in file_findings}

        for idx, line in enumerate(updated_lines):
            match = include_re.match(line)
            if not match:
                continue
            include_token = match.group(2)
            normalized_token = normalize_include_token(include_token)
            code = normalized_token.split("#", 1)[1]
            if code not in target_codes:
                continue
            expected_description = source_descriptions.get(normalized_token)
            if not expected_description:
                continue
            if match.group(3) == expected_description:
                continue

            updated_lines[idx] = f'* include {normalized_token} "{expected_description}"'
            modified = True
            fixes_applied += 1
            print(
                f"  [FIX] Updated ValueSet include description for {normalized_token} in {file_path.name}"
            )

        if modified:
            file_path.write_text("\n".join(updated_lines) + "\n", encoding="utf-8")

    return fixes_applied


def fix_description_mismatches(findings: List[Finding], ig_roots: Dict[str, Path]) -> int:
    """Update RuleSet description strings to match their CodeSystem counterparts."""
    fixes_applied = 0

    # Build code → description from CodeSystems
    cs_descriptions: Dict[str, CodeDescription] = {}
    for ig_root in ig_roots.values():
        for cs_def in find_codesystem_files(ig_root).values():
            cs_descriptions.update(extract_code_descriptions(cs_def.file_path))

    import_descriptions = _valueset_import_description_sources(ig_roots)

    # Group DESCRIPTION_MISMATCH findings by file
    findings_by_file: Dict[Path, List[Finding]] = {}
    for finding in findings:
        if finding.type == "DESCRIPTION_MISMATCH":
            findings_by_file.setdefault(finding.file_path, []).append(finding)

    for file_path, file_findings in findings_by_file.items():
        if not file_path.exists():
            continue

        content = file_path.read_text(encoding="utf-8")
        lines = content.splitlines(keepends=True)
        modified = False

        # Process in reverse line order so earlier indices stay stable
        for finding in sorted(file_findings, key=lambda f: -f.line):
            code = finding.code
            ruleset_name = finding.requirement_key.split(":", 1)[1]
            if code in cs_descriptions:
                cs_desc = cs_descriptions[code].description
            elif ruleset_name == _ruleset_name_for_code(code):
                code_owner_module, _cs_id, _vs_id, _is_external = classify_error_code(code)
                import_system = expected_import_system(code, code_owner_module, finding.ig_module)
                if not import_system:
                    continue
                cs_desc = import_descriptions.get(normalize_include_token(f"{import_system}#{code}"))
                if not cs_desc:
                    continue
            else:
                continue

            for i, line in enumerate(lines):
                if f"RuleSet: {ruleset_name}" not in line:
                    continue
                for j in range(i + 1, min(i + 20, len(lines))):
                    if f'extension[errorCode].valueString = "{code}"' not in lines[j]:
                        continue
                    for k in range(j - 1, max(i, j - 10), -1):
                        if "extension[description].valueString" not in lines[k]:
                            continue
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


def fix_module_codesystem_placement(
    findings: List[Finding], ig_roots: Dict[str, Path]
) -> int:
    """Remove module-specific codes from the core CodeSystem."""
    fixes_applied = 0

    codes_to_remove_by_file: Dict[Path, List[str]] = {}
    for finding in findings:
        if finding.type in ("MISSING_MODULE_CODESYSTEM", "WRONG_MODULE_CODESYSTEM"):
            codes_to_remove_by_file.setdefault(finding.file_path, []).append(finding.code)

    for file_path, codes_to_remove in codes_to_remove_by_file.items():
        if not file_path.exists():
            continue

        content = file_path.read_text(encoding="utf-8")
        lines = content.splitlines(keepends=True)
        filtered_lines = []
        for line in lines:
            should_remove = any(
                re.match(rf'^\s*\*\s+#{re.escape(code)}\s+', line)
                for code in codes_to_remove
            )
            if should_remove:
                code_match = re.match(r'^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+', line)
                print(f"  [FIX] Removed {code_match.group(1) if code_match else '?'} from {file_path.name}")
                fixes_applied += 1
            else:
                filtered_lines.append(line)

        if len(filtered_lines) != len(lines):
            file_path.write_text("".join(filtered_lines), encoding="utf-8")

    return fixes_applied


def fix_orphaned_codes(findings: List[Finding], ig_roots: Dict[str, Path]) -> int:
    """Remove orphaned codes from OperationOutcomeDetails CodeSystems, ValueSets, and RuleSets."""
    fixes_applied = 0

    # Group orphaned codes by the CS file they live in
    orphaned_by_file: Dict[Path, Set[str]] = {}
    for finding in findings:
        if finding.type != "ORPHANED_CODE":
            continue
        if "OperationOutcomeDetails" not in str(finding.file_path):
            continue
        orphaned_by_file.setdefault(finding.file_path, set()).add(finding.code)

    all_orphaned: Set[str] = {code for codes in orphaned_by_file.values() for code in codes}

    # 1. Remove from CodeSystem files
    for cs_file, codes_to_remove in orphaned_by_file.items():
        if not cs_file.exists():
            continue
        content = cs_file.read_text(encoding="utf-8")
        new_lines = []
        modified = False
        for line in content.splitlines(keepends=True):
            m = re.match(r'^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+', line)
            if m and m.group(1) in codes_to_remove:
                modified = True
                print(f"  [FIX] Removed {m.group(1)} from {cs_file.name}")
                fixes_applied += 1
                continue
            new_lines.append(line)
        if modified:
            cs_file.write_text("".join(new_lines), encoding="utf-8")

    # 2. Remove from OperationOutcomeDetails ValueSets
    for module, ig_root in ig_roots.items():
        vs_dir = ig_root / "input" / "fsh" / "valuesets"
        if not vs_dir.exists():
            continue
        for vs_file in vs_dir.glob("*.fsh"):
            if "OperationOutcomeDetails" not in vs_file.name:
                continue
            content = vs_file.read_text(encoding="utf-8")
            new_lines = []
            modified = False
            for line in content.splitlines(keepends=True):
                # Remove "* include $alias#CODE" lines for orphaned codes
                should_remove = any(
                    f"#{code}" in line and ("include" in line.lower())
                    for code in all_orphaned
                )
                if should_remove:
                    modified = True
                    print(f"  [FIX] Removed orphaned include from {vs_file.name}: {line.strip()}")
                    fixes_applied += 1
                else:
                    new_lines.append(line)
            if modified:
                vs_file.write_text("".join(new_lines), encoding="utf-8")

    # 3. Remove from CapabilityStatement RuleSets (errorCode + accompanying description line)
    for module, ig_root in ig_roots.items():
        _cap, _resp_def, resp_file = _cap_files(ig_root)
        for ruleset_file in (_resp_def, resp_file):
            if not ruleset_file.exists():
                continue
            content = ruleset_file.read_text(encoding="utf-8")
            new_lines = []
            skip_desc = False
            modified = False
            lines = content.splitlines(keepends=True)
            for i, line in enumerate(lines):
                code_match = RULESET_ERROR_CODE_RE.search(line)
                if code_match and code_match.group(1) in all_orphaned:
                    modified = True
                    skip_desc = True
                    print(f"  [FIX] Removed {code_match.group(1)} from {ruleset_file.name}")
                    fixes_applied += 1
                    # Also skip an immediately-following description line
                    if i + 1 < len(lines) and "extension[description]" in lines[i + 1]:
                        pass  # will be handled by skip_desc on next iteration
                    continue
                if skip_desc and "extension[description]" in line:
                    skip_desc = False
                    continue
                skip_desc = False
                new_lines.append(line)
            if modified:
                ruleset_file.write_text("".join(new_lines), encoding="utf-8")

    return fixes_applied


def fix_cs_vs(
    findings: List[Finding], ig_roots: Dict[str, Path], error_codes: List[ErrorCode]
) -> int:
    """Add missing CodeSystem entries and ValueSet imports. Returns number of files modified."""
    fixes_applied = 0

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
                if any(
                    finding.code.startswith(p)
                    for p in ("TIFLOW_EREZEPT_", "TIFLOW_DIGA_", "TIFLOW_CHARGEITEM_", "TIFLOW_XBORDER_")
                ):
                    print(f"  [SKIP] Module-specific code '{finding.code}' - target CS not found: {cs_file}")
                else:
                    print(f"  [SKIP] CS file not found: {cs_file}")
                continue

            content = cs_file.read_text(encoding="utf-8")
            if f"#{finding.code}" in content:
                continue

            new_block = (
                f'* #{finding.code} "TODO: short" "TODO: description"\n'
                f'  * ^designation.language = #de-DE\n'
                f'  * ^designation.value = "TODO: german"\n'
            )
            cs_file.write_text(content.rstrip("\n") + "\n" + new_block, encoding="utf-8")
            print(f"  [FIX] Added #{finding.code} to {cs_file}")
            fixes_applied += 1

        elif finding.type == "MISSING_IMPORT":
            target_module = finding.ig_module if finding.ig_module in ig_roots else "core"
            ig_root = ig_roots.get(target_module)
            target_vs_name = module_outcome_valueset_name(target_module)
            if not ig_root or not target_vs_name:
                print(f"  [SKIP] Cannot resolve target module/ValueSet for import of '{finding.code}'")
                continue

            target_vs = ig_root / "input" / "fsh" / "valuesets" / f"{target_vs_name}.fsh"
            if not target_vs.exists():
                print(f"  [SKIP] Target ValueSet not found: {target_vs}")
                continue

            code_owner_module, _cs_id, _vs_id, _is_external = classify_error_code(finding.code)
            import_system = expected_import_system(finding.code, code_owner_module, target_module)
            if not import_system:
                print(f"  [SKIP] No canonical import system for code '{finding.code}'")
                continue

            vs_content = target_vs.read_text(encoding="utf-8")
            include_token = normalize_include_token(f"{import_system}#{finding.code}")
            existing_includes = {
                normalize_include_token(token)
                for token in parse_valueset_external_includes(target_vs).keys()
            }
            if include_token in existing_includes:
                continue

            source_descriptions = _valueset_import_description_sources(ig_roots)
            description = source_descriptions.get(include_token)
            description_suffix = f' "{description}"' if description else ""
            new_line = f"* include {include_token}{description_suffix}\n"
            target_vs.write_text(vs_content.rstrip("\n") + "\n" + new_line, encoding="utf-8")
            print(f"  [FIX] Added include {include_token} to {target_vs}")
            fixes_applied += 1

    return fixes_applied


def fix_capstat(
    findings: List[Finding],
    ig_roots: Dict[str, Path],
    error_codes: List[ErrorCode],
) -> int:
    """Add missing RuleSets and endpoint mappings in CapabilityStatement files."""
    fixes_applied = 0

    code_info: Dict[str, ErrorCode] = {}
    for ec in error_codes:
        if ec.code not in code_info:
            code_info[ec.code] = ec

    normalized_modules: Set[str] = set()

    def ensure_normalized(module: str) -> None:
        nonlocal fixes_applied
        if module in normalized_modules:
            return
        ig_root = ig_roots.get(module)
        if not ig_root:
            normalized_modules.add(module)
            return
        cap_file, _resp_def, _resp = _cap_files(ig_root)
        normalized = _normalize_capability_operation_canonicals(cap_file, ig_root)
        if normalized:
            print(
                f"  [FIX] Normalized {normalized} CapabilityStatement operation canonicals in {cap_file.name}"
            )
            fixes_applied += normalized
        normalized_modules.add(module)

    for module in ig_roots:
        ensure_normalized(module)

    # Ensure endpoint → RuleSet mappings exist for CAPSTAT_ENDPOINT_NOT_MAPPED findings
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
        ensure_normalized(finding.ig_module)

        cap_file, _resp_def, _resp = _cap_files(ig_root)
        if _ensure_capability_endpoint_mapping(cap_file, endpoint, endpoint_rule):
            print(f"  [FIX] Mapped endpoint '{endpoint}' to '{endpoint_rule}' in {cap_file.name}")
            fixes_applied += 1

    # Group CAPSTAT_MISSING_CODE findings by (module, endpoint)
    missing_by_endpoint: Dict[Tuple[str, str], List[Finding]] = {}
    for finding in findings:
        if finding.type == "CAPSTAT_MISSING_CODE":
            endpoint = _extract_endpoint_from_message(finding.message)
            if not endpoint:
                continue
            missing_by_endpoint.setdefault((finding.ig_module, endpoint), []).append(finding)

    for (module, endpoint), endpoint_findings in missing_by_endpoint.items():
        ig_root = ig_roots.get(module)
        if not ig_root:
            continue
        ensure_normalized(module)

        cap_file, resp_def_file, resp_file = _cap_files(ig_root)

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

                new_ruleset = (
                    f"\nRuleSet: {rs_name}\n"
                    f"* extension[responseInfo][+]\n"
                    f'  * extension[statusCode].valueString = "{http_code}"\n'
                    f'  * extension[description].valueString = "{description}"\n'
                    f'  * extension[responseType].valueString = "TIFlowOperationOutcome"\n'
                    f'  * extension[errorCode].valueString = "{code}"\n'
                )
                resp_file.write_text(resp_content.rstrip("\n") + "\n" + new_ruleset, encoding="utf-8")
                resp_content = resp_file.read_text(encoding="utf-8")
                print(f"  [FIX] Added RuleSet {rs_name} to {resp_file.name}")
                fixes_applied += 1

            # 2. Insert into the wrapper RuleSet in resp_def_file
            wrapper_header = f"RuleSet: {endpoint_rule}"
            if wrapper_header not in resp_def_content:
                print(f"  [SKIP] Wrapper RuleSet '{endpoint_rule}' not found in {resp_def_file}")
                continue

            insert_line = _wrapper_insert_line(resp_def_content, endpoint_rule, rs_name, endpoint)
            if insert_line is None:
                continue

            wrapper_start = resp_def_content.index(wrapper_header)
            next_ruleset = resp_def_content.find("\nRuleSet:", wrapper_start + len(wrapper_header))
            if next_ruleset != -1:
                new_def_content = (
                    resp_def_content[:next_ruleset] + insert_line + resp_def_content[next_ruleset:]
                )
            else:
                new_def_content = resp_def_content.rstrip("\n") + "\n" + insert_line

            resp_def_file.write_text(new_def_content, encoding="utf-8")
            resp_def_content = resp_def_file.read_text(encoding="utf-8")
            print(f"  [FIX] Added '* insert {rs_name}' to wrapper '{endpoint_rule}' in {resp_def_file.name}")
            fixes_applied += 1

    return fixes_applied
