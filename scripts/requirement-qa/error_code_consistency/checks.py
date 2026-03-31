"""Consistency check functions for error codes, CS/VS, and CapabilityStatement."""

from __future__ import annotations

from typing import Dict, Iterable, List, Set, Tuple
from pathlib import Path

from .classification import (
    classify_error_code,
    expected_import_system,
    module_outcome_valueset_name,
    normalize_include_token,
)
from .models import CodeDescription, ErrorCode, Finding
from .parsing import (
    extract_code_descriptions,
    extract_ruleset_descriptions,
    find_codesystem_files,
    find_valueset_files,
    parse_capability_endpoint_rulesets,
    parse_response_error_codes,
    parse_ruleset_references,
    parse_valueset_external_includes,
    resolve_ruleset_codes,
    REQUIREMENT_KEY_ATTR_RE,
    REQUIREMENT_TAG_RE,
    REQUIREMENT_TITLE_ATTR_RE,
    module_from_path,
)


def _cap_files(ig_root: Path) -> Tuple[Path, Path, Path]:
    """Return (cap_server, resp_def, resp) for an IG root."""
    cap_dir = ig_root / "input" / "fsh" / "capabilitystatement"
    return (
        cap_dir / "ERPCapabilityStatementServer.fsh",
        cap_dir / "rulesets" / "ERPCapabilityStatementRulesetsResponseDefinition.fsh",
        cap_dir / "rulesets" / "ERPCapabilityStatementRulesetsResponse.fsh",
    )


def check_requirements_missing_keys(req_files: List[Path]) -> List[Finding]:
    """Validate that every <requirement ...> tag contains a key= attribute."""
    findings: List[Finding] = []

    for file_path in req_files:
        content = file_path.read_text(encoding="utf-8")
        module = module_from_path(file_path)

        for match in REQUIREMENT_TAG_RE.finditer(content):
            tag = match.group(0)
            if REQUIREMENT_KEY_ATTR_RE.search(tag):
                continue

            title_match = REQUIREMENT_TITLE_ATTR_RE.search(tag)
            title = title_match.group(1).strip() if title_match else "(no title)"
            line_num = content[: match.start()].count("\n") + 1

            findings.append(
                Finding(
                    type="REQUIREMENT_MISSING_KEY",
                    ig_module=module,
                    file_path=file_path,
                    line=line_num,
                    code="",
                    requirement_key="",
                    message=f"Requirement is missing key attribute (title: '{title}')",
                )
            )

    return findings


def check_cs_vs_consistency(
    error_codes: List[ErrorCode], ig_roots: Dict[str, Path]
) -> List[Finding]:
    """Check that every error code is defined in the expected CodeSystem and ValueSet."""
    findings: List[Finding] = []

    all_cs = {}
    all_vs = {}
    for ig_root in ig_roots.values():
        all_cs.update(find_codesystem_files(ig_root))
        all_vs.update(find_valueset_files(ig_root))

    for err in error_codes:
        module, cs_file, _vs_file, is_external = classify_error_code(err.code)

        # In module IGs, codes from core/ti-common/hl7 must be listed as explicit single imports
        # in that module's OperationOutcomeDetails ValueSet.
        target_vs_name = module_outcome_valueset_name(err.module)
        import_system = expected_import_system(err.code, module, err.module)
        if target_vs_name and import_system:
            target_vs = all_vs.get(target_vs_name)
            expected_include = normalize_include_token(f"{import_system}#{err.code}")
            target_includes = {
                normalize_include_token(include_token) for include_token in (target_vs.includes if target_vs else [])
            }
            if target_vs and expected_include not in target_includes:
                findings.append(
                    Finding(
                        type="MISSING_IMPORT",
                        ig_module=err.module,
                        file_path=err.file_path,
                        line=err.line,
                        code=err.code,
                        requirement_key=err.requirement_key,
                        message=(
                            f"Code '{err.code}' not imported in {target_vs_name}; "
                            f"expected include {expected_include}"
                        ),
                    )
                )

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


def _import_description_sources(ig_roots: Dict[str, Path]) -> Dict[str, str]:
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


def check_valueset_import_descriptions(ig_roots: Dict[str, Path]) -> List[Finding]:
    """Check that imported external codes in module ValueSets carry the short description from core."""
    findings: List[Finding] = []
    source_descriptions = _import_description_sources(ig_roots)
    if not source_descriptions:
        return findings

    for module, ig_root in ig_roots.items():
        if module == "core":
            continue
        target_vs_name = module_outcome_valueset_name(module)
        if not target_vs_name:
            continue

        target_vs = ig_root / "input" / "fsh" / "valuesets" / f"{target_vs_name}.fsh"
        if not target_vs.exists():
            continue

        for include_token, (description, line_no) in parse_valueset_external_includes(target_vs).items():
            normalized_token = normalize_include_token(include_token)
            expected_description = source_descriptions.get(normalized_token)
            if not expected_description:
                continue
            if description == expected_description:
                continue

            code = normalized_token.split("#", 1)[1]
            findings.append(
                Finding(
                    type="VALUESET_IMPORT_DESCRIPTION_MISMATCH",
                    ig_module=module,
                    file_path=target_vs,
                    line=line_no,
                    code=code,
                    requirement_key="",
                    message=(
                        f"ValueSet include '{normalized_token}' should use short description "
                        f"'{expected_description}'"
                    ),
                )
            )

    return findings


def check_capabilitystatement_consistency(
    error_codes: List[ErrorCode],
    ig_roots: Dict[str, Path],
    include_extra: bool = False,
) -> List[Finding]:
    """Check that CapabilityStatement RuleSets cover all requirement error codes per endpoint."""
    findings: List[Finding] = []

    grouped: Dict[Tuple[str, str], List[ErrorCode]] = {}
    for err in error_codes:
        grouped.setdefault((err.module, err.endpoint), []).append(err)

    for (module, endpoint), errs in grouped.items():
        if not endpoint.startswith("op:"):
            continue

        ig_root = ig_roots.get(module)
        if not ig_root:
            continue

        cap_file, resp_def_file, resp_file = _cap_files(ig_root)

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
                        f"Endpoint '{endpoint}' uses RuleSet '{endpoint_rule}' but does not "
                        f"expose error code '{missing}'"
                    ),
                )
            )

        if include_extra:
            # Baseline wrappers can now appear in any position (e.g. "* insert InstanceOperationStatusCodes").
            # Collect all direct wrapper refs instead of assuming the first ref is the baseline.
            direct_refs = refs.get(endpoint_rule, [])
            baseline_codes: Set[str] = set()
            for ref in direct_refs:
                if ref.endswith("StatusCodes"):
                    baseline_codes.update(resolve_ruleset_codes(ref, refs, base_codes))

            extra_codes = sorted((cap_codes - required_codes) - baseline_codes)
            for extra in extra_codes:
                exemplar = errs[0]
                findings.append(
                    Finding(
                        type="CAPSTAT_EXTRA_CODE",
                        ig_module=module,
                        file_path=exemplar.file_path,
                        line=exemplar.line,
                        code=extra,
                        requirement_key=exemplar.requirement_key,
                        message=(
                            f"Endpoint '{endpoint}' exposes error code '{extra}' in RuleSet "
                            f"'{endpoint_rule}' but no matching requirement code was found"
                        ),
                    )
                )

    return findings


def check_description_consistency(ig_roots: Dict[str, Path]) -> List[Finding]:
    """Check that RuleSet descriptions in CapabilityStatement match CodeSystem definitions."""
    findings: List[Finding] = []
    import_descriptions = _import_description_sources(ig_roots)

    # Build module → CS-name → code → CodeDescription
    cs_descriptions: Dict[str, Dict[str, CodeDescription]] = {}
    for ig_root in ig_roots.values():
        for cs_name, cs_def in find_codesystem_files(ig_root).items():
            descs = extract_code_descriptions(cs_def.file_path)
            cs_descriptions.setdefault(cs_name, {}).update(descs)

    for module, ig_root in ig_roots.items():
        _cap_file, _resp_def, resp_file = _cap_files(ig_root)
        ruleset_descs = extract_ruleset_descriptions(resp_file)

        for ruleset_name, codes_and_descs in ruleset_descs.items():
            for error_code, ruleset_desc in codes_and_descs.items():
                code_owner_module, cs_name, _vs_name, _is_external = classify_error_code(error_code)
                cs_desc: str | None = None

                if cs_name and cs_name in cs_descriptions and error_code in cs_descriptions[cs_name]:
                    cs_desc = cs_descriptions[cs_name][error_code].description
                elif ruleset_name == _ruleset_name_for_code(error_code):
                    import_system = expected_import_system(error_code, code_owner_module, module)
                    if import_system:
                        cs_desc = import_descriptions.get(
                            normalize_include_token(f"{import_system}#{error_code}")
                        )

                if not cs_desc:
                    continue

                if ruleset_desc != cs_desc:
                    findings.append(
                        Finding(
                            type="DESCRIPTION_MISMATCH",
                            ig_module=module,
                            file_path=resp_file,
                            line=0,
                            code=error_code,
                            requirement_key=f"RuleSet:{ruleset_name}",
                            message=(
                                f"RuleSet '{ruleset_name}' has description '{ruleset_desc}' "
                                f"but CodeSystem has '{cs_desc}'"
                            ),
                        )
                    )

    return findings


def check_module_codesystem_placement(ig_roots: Dict[str, Path]) -> List[Finding]:
    """Check that module-specific error codes are not placed in the core CodeSystem."""
    findings: List[Finding] = []

    import re

    module_code_prefixes = {
        "TIFLOW_EREZEPT_": ("rx", "TIFLOW_EREZEPT_CS_OperationOutcomeDetails"),
        "TIFLOW_DIGA_": ("diga", "TIFLOW_DIGA_CS_OperationOutcomeDetails"),
        "TIFLOW_CHARGEITEM_": ("erp-chrg", "TIFLOW_CHARGEITEM_CS_OperationOutcomeDetails"),
        "TIFLOW_XBORDER_": ("erp-eu", "TIFLOW_XBORDER_CS_OperationOutcomeDetails"),
    }

    for module, ig_root in ig_roots.items():
        for cs_name, cs_def in find_codesystem_files(ig_root).items():
            content = cs_def.file_path.read_text(encoding="utf-8")

            for prefix, (expected_module, expected_cs) in module_code_prefixes.items():
                for match in re.finditer(
                    rf'^\s*\*\s+#({re.escape(prefix)}[A-Za-z0-9_\-]+)\s+',
                    content,
                    re.MULTILINE,
                ):
                    code = match.group(1)
                    line_num = content[: match.start()].count("\n") + 1

                    if module == "core" and expected_module != "core":
                        module_ig_root = ig_roots.get(expected_module)
                        module_cs_file = (
                            module_ig_root / "input" / "fsh" / "codesystems" / f"{expected_cs}.fsh"
                            if module_ig_root
                            else None
                        )

                        if not module_cs_file or not module_cs_file.exists():
                            findings.append(
                                Finding(
                                    type="MISSING_MODULE_CODESYSTEM",
                                    ig_module=expected_module,
                                    file_path=cs_def.file_path,
                                    line=line_num,
                                    code=code,
                                    requirement_key="",
                                    message=(
                                        f"Code '{code}' is in core's {cs_name} but should be in "
                                        f"module {expected_module}; create {expected_cs}.fsh if missing"
                                    ),
                                )
                            )
                        else:
                            findings.append(
                                Finding(
                                    type="WRONG_MODULE_CODESYSTEM",
                                    ig_module=module,
                                    file_path=cs_def.file_path,
                                    line=line_num,
                                    code=code,
                                    requirement_key="",
                                    message=(
                                        f"Code '{code}' should be in module {expected_module}'s "
                                        f"{expected_cs}, not in core's {cs_name}"
                                    ),
                                )
                            )

    return findings


def check_undefined_code_rulesets(ig_roots: Dict[str, Path]) -> List[Finding]:
    """Find RuleSet blocks in response files that use error codes not defined in any CodeSystem.

    External codes (MSG_*, SVC_*) are always considered valid as they come from external systems.
    """
    findings: List[Finding] = []

    # Collect all codes defined across all local CodeSystems
    all_known_codes: Set[str] = set()
    for ig_root in ig_roots.values():
        for cs_def in find_codesystem_files(ig_root).values():
            all_known_codes.update(cs_def.codes)

    for module, ig_root in ig_roots.items():
        _, _, resp_file = _cap_files(ig_root)
        if not resp_file.exists():
            continue

        content = resp_file.read_text(encoding="utf-8")
        lines = content.splitlines()
        for ruleset_name, codes in parse_response_error_codes(resp_file).items():
            for code in codes:
                _owner, _cs_id, _vs_id, is_external = classify_error_code(code)
                if is_external:
                    continue  # MSG_*, SVC_* come from external systems
                if code not in all_known_codes:
                    line_num = next(
                        (i + 1 for i, ln in enumerate(lines)
                         if f'extension[errorCode].valueString = "{code}"' in ln),
                        1,
                    )
                    findings.append(
                        Finding(
                            type="UNDEFINED_CODE_RULESET",
                            ig_module=module,
                            file_path=resp_file,
                            line=line_num,
                            code=code,
                            requirement_key=f"RuleSet:{ruleset_name}",
                            message=(
                                f"RuleSet '{ruleset_name}' uses error code '{code}' "
                                "which is not defined in any CodeSystem"
                            ),
                        )
                    )

    return findings


def check_orphaned_codes(
    error_codes: List[ErrorCode], ig_roots: Dict[str, Path]
) -> List[Finding]:
    """Find OperationOutcomeDetails codes defined in CodeSystems but not used in any requirement."""
    findings: List[Finding] = []
    required_codes: Set[str] = {err.code for err in error_codes}

    for module, ig_root in ig_roots.items():
        for cs_name, cs_def in find_codesystem_files(ig_root).items():
            if "OperationOutcomeDetails" not in cs_name:
                continue

            content = cs_def.file_path.read_text(encoding="utf-8")
            from .parsing import FSH_CODE_DEF_RE

            for match in FSH_CODE_DEF_RE.finditer(content):
                code = match.group(1)
                line_num = content[: match.start()].count("\n") + 1
                if code not in required_codes:
                    findings.append(
                        Finding(
                            type="ORPHANED_CODE",
                            ig_module=module,
                            file_path=cs_def.file_path,
                            line=line_num,
                            code=code,
                            requirement_key="",
                            message=f"Code '{code}' is defined in {cs_name} but not used in any requirement",
                        )
                    )

    return findings
