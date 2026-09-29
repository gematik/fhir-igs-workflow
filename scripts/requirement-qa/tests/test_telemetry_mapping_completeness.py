from pathlib import Path

from check_telemetry_mapping_completeness import (
    Finding,
    fix_missing_mappings,
    normalize_flat_mappings,
    parse_conceptmap_groups,
    parse_conceptmap_mappings,
    run_check,
)


def test_fix_missing_mapping_uses_nested_append_syntax(tmp_path):
    conceptmap = tmp_path / "core" / "input" / "fsh" / "conceptmaps" / "TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    conceptmap.parent.mkdir(parents=True)
    conceptmap.write_text(
        '* group[+].source = "https://example.test/codesystem"\n'
        '* group[=].target = "ti-flow-telemetriedaten-statuscodes"\n',
        encoding="utf-8",
    )

    findings = [
        Finding(
            type="MISSING_MAPPING",
            codesystem_file="https://example.test/codesystem",
            code="TIFLOW_EXAMPLE",
            message="missing",
        )
    ]

    assert fix_missing_mappings(findings, [tmp_path / "core"], [], []) == 1

    content = conceptmap.read_text(encoding="utf-8")
    assert "* group[=].element[+]\n" in content
    assert "  * code = #TIFLOW_EXAMPLE\n" in content
    assert "  * target[+]\n" in content
    assert "    * code = #79200\n" in content
    assert "    * equivalence = #equivalent\n" in content
    assert parse_conceptmap_mappings(conceptmap) == {"TIFLOW_EXAMPLE": "79200"}


def test_normalize_flat_mapping_uses_nested_append_syntax(tmp_path):
    conceptmap = tmp_path / "TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    conceptmap.write_text(
        "* group[=].element[6].code = #TIFLOW_EXAMPLE\n"
        "* group[=].element[6].target[0].code = #79205\n"
        "* group[=].element[6].target[0].equivalence = #equivalent\n",
        encoding="utf-8",
    )

    assert normalize_flat_mappings(conceptmap) == 1
    assert conceptmap.read_text(encoding="utf-8") == (
        "* group[=].element[+]\n"
        "  * code = #TIFLOW_EXAMPLE\n"
        "  * target[+]\n"
        "    * code = #79205\n"
        "    * equivalence = #equivalent\n"
    )


def test_module_mapping_is_checked_and_fixed_in_own_ig(tmp_path):
    core = tmp_path / "core"
    rx = tmp_path / "rx"
    core_map = core / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    rx_map = rx / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    codesystem = rx / "input/fsh/codesystems/TIFLOW_EREZEPT_CS_OperationOutcomeDetails.fsh"
    for path in (core_map, rx_map, codesystem):
        path.parent.mkdir(parents=True, exist_ok=True)
    core_map.write_text(
        '* group[+].source = "https://example.test/core"\n'
        '* group[=].element[+].code = #TIFLOW_EREZEPT_NEW\n'
        '* group[=].element[=].target[+].code = #79200\n',
        encoding="utf-8",
    )
    rx_map.write_text(
        'Instance: RX-Telemetry\n'
        '* group[+].source = "https://example.test/wrong"\n'
        '* group[=].element[+].code = #TIFLOW_EREZEPT_NEW\n'
        '* group[=].element[=].target[+].code = #79202\n',
        encoding="utf-8",
    )
    codesystem.write_text(
        'CodeSystem: RxCodes\nId: rx-codes\n* #TIFLOW_EREZEPT_NEW "New" "New"\n',
        encoding="utf-8",
    )

    roots = [core, rx]
    findings = run_check(roots, [codesystem], [])
    assert [(finding.type, finding.code) for finding in findings] == [
        ("MISSING_MAPPING", "TIFLOW_EREZEPT_NEW")
    ]
    assert fix_missing_mappings(findings, roots, [codesystem], []) == 1
    assert parse_conceptmap_groups(rx_map)[
        "https://gematik.de/fhir/erp/CodeSystem/rx-codes"
    ] == {"TIFLOW_EREZEPT_NEW": "79201"}
    assert not run_check(roots, [codesystem], [])
