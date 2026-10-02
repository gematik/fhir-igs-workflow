import csv

from check_telemetry_mapping_completeness import (
    parse_conceptmap_mappings,
    run_check,
    write_csv_report,
)


def _write_sushi_config(ig_root, canonical="https://gematik.de/fhir/erp"):
    ig_root.mkdir(parents=True, exist_ok=True)
    (ig_root / "sushi-config.yaml").write_text(f"canonical: {canonical}\n", encoding="utf-8")


def test_telemetry_validation_reports_missing_extra_and_duplicate_codes(tmp_path):
    core = tmp_path / "core"
    rx = tmp_path / "rx"
    _write_sushi_config(core)
    _write_sushi_config(rx)
    core_map = core / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    rx_map = rx / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    core_cs = core / "input/fsh/codesystems/TIFLOW_CS_OperationOutcomeDetails.fsh"
    rx_cs = rx / "input/fsh/codesystems/TIFLOW_EREZEPT_CS_OperationOutcomeDetails.fsh"
    core_vs = core / "input/fsh/valuesets/TIFLOW_VS_OperationOutcomeDetails.fsh"
    rx_vs = rx / "input/fsh/valuesets/TIFLOW_EREZEPT_VS_OperationOutcomeDetails.fsh"
    for path in (core_map, rx_map, core_cs, rx_cs, core_vs, rx_vs):
        path.parent.mkdir(parents=True, exist_ok=True)

    core_cs.write_text('CodeSystem: CoreCodes\nId: core-codes\n* #CORE_OK "OK" "OK"\n', encoding="utf-8")
    rx_cs.write_text(
        'CodeSystem: RxCodes\nId: rx-codes\n* #RX_OK "OK" "OK"\n* #RX_MISSING "Missing" "Missing"\n',
        encoding="utf-8",
    )
    core_vs.write_text('* include codes from system CoreCodes\n', encoding="utf-8")
    rx_vs.write_text('* include codes from system RxCodes\n', encoding="utf-8")
    core_map.write_text(
        '* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/core-codes"\n'
        '* group[=].element[+].code = #CORE_OK\n'
        '* group[=].element[=].target[+].code = #79243\n'
        '* group[=].element[+].code = #CORE_EXTRA\n'
        '* group[=].element[=].target[+].code = #79244\n',
        encoding="utf-8",
    )
    rx_map.write_text(
        '* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/rx-codes"\n'
        '* group[=].element[+]\n  * code = #RX_OK\n  * target[+]\n    * code = #79243\n',
        encoding="utf-8",
    )

    original_maps = (core_map.read_bytes(), rx_map.read_bytes())
    findings = run_check([core, rx], [core_cs, rx_cs], [core_vs, rx_vs])

    assert {(finding.type, finding.code) for finding in findings} == {
        ("MISSING_MAPPING", "RX_MISSING"),
        ("EXTRA_MAPPING", "CORE_EXTRA"),
        ("DUPLICATE_TELEMETRY_CODE", "79243"),
    }
    assert (core_map.read_bytes(), rx_map.read_bytes()) == original_maps

    report = tmp_path / "qa/telemetry-mapping-report.csv"
    write_csv_report(report, findings, [core_cs, rx_cs])
    with report.open(encoding="utf-8", newline="") as csv_file:
        rows = list(csv.DictReader(csv_file))
    assert {row["type"] for row in rows[:-1]} == {
        "MISSING_MAPPING", "EXTRA_MAPPING", "DUPLICATE_TELEMETRY_CODE"
    }
    assert str(core_map) == next(
        row["codesystem_file"] for row in rows if row["type"] == "EXTRA_MAPPING"
    )


def test_numeric_mapping_syntax_remains_readable(tmp_path):
    conceptmap = tmp_path / "TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    conceptmap.write_text(
        '* group[+].source = "https://example.test/codes"\n'
        '* group[=].element[6].code = #EXAMPLE\n'
        '* group[=].element[6].target[0].code = #79205\n',
        encoding="utf-8",
    )
    assert parse_conceptmap_mappings(conceptmap) == {"EXAMPLE": "79205"}


def test_duplicate_targets_in_one_conceptmap_are_reported(tmp_path):
    core = tmp_path / "core"
    _write_sushi_config(core)
    conceptmap = core / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    codesystem = core / "input/fsh/codesystems/TIFLOW_CS_OperationOutcomeDetails.fsh"
    valueset = core / "input/fsh/valuesets/TIFLOW_VS_OperationOutcomeDetails.fsh"
    for path in (conceptmap, codesystem, valueset):
        path.parent.mkdir(parents=True, exist_ok=True)
    codesystem.write_text(
        'CodeSystem: CoreCodes\nId: core-codes\n* #FIRST "First" "First"\n* #SECOND "Second" "Second"\n',
        encoding="utf-8",
    )
    valueset.write_text('* include codes from system CoreCodes\n', encoding="utf-8")
    conceptmap.write_text(
        '* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/core-codes"\n'
        '* group[=].element[+].code = #FIRST\n'
        '* group[=].element[=].target[+].code = #79243\n'
        '* group[=].element[+].code = #SECOND\n'
        '* group[=].element[=].target[+].code = #79243\n',
        encoding="utf-8",
    )

    findings = run_check([core], [codesystem], [valueset])
    assert [(finding.type, finding.code) for finding in findings] == [
        ("DUPLICATE_TELEMETRY_CODE", "79243")
    ]


def test_multiple_targets_for_one_source_are_checked(tmp_path):
    core = tmp_path / "core"
    _write_sushi_config(core)
    conceptmap = core / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    codesystem = core / "input/fsh/codesystems/TIFLOW_CS_OperationOutcomeDetails.fsh"
    valueset = core / "input/fsh/valuesets/TIFLOW_VS_OperationOutcomeDetails.fsh"
    for path in (conceptmap, codesystem, valueset):
        path.parent.mkdir(parents=True, exist_ok=True)
    codesystem.write_text('CodeSystem: CoreCodes\nId: core-codes\n* #FIRST "First" "First"\n', encoding="utf-8")
    valueset.write_text('* include codes from system CoreCodes\n', encoding="utf-8")
    conceptmap.write_text(
        '* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/core-codes"\n'
        '* group[=].element[+]\n'
        '  * code = #FIRST\n'
        '  * target[+]\n'
        '    * code = #79243\n'
        '  * target[+]\n'
        '    * code = #79243\n',
        encoding="utf-8",
    )

    findings = run_check([core], [codesystem], [valueset])
    assert [(finding.type, finding.code) for finding in findings] == [
        ("DUPLICATE_TELEMETRY_CODE", "79243")
    ]


def test_codesystem_url_uses_ig_canonical_and_wrong_source_is_reported(tmp_path):
    rx = tmp_path / "rx"
    _write_sushi_config(rx, "https://gematik.de/fhir/tiflow-erezept")
    conceptmap = rx / "input/fsh/conceptmaps/TIFLOW_CM_TelemetryDataStatusCodes.fsh"
    codesystem = rx / "input/fsh/codesystems/TIFLOW_EREZEPT_CS_OperationOutcomeDetails.fsh"
    valueset = rx / "input/fsh/valuesets/TIFLOW_EREZEPT_VS_OperationOutcomeDetails.fsh"
    for path in (conceptmap, codesystem, valueset):
        path.parent.mkdir(parents=True, exist_ok=True)
    codesystem.write_text('CodeSystem: RxCodes\nId: rx-codes\n* #RX_OK "OK" "OK"\n', encoding="utf-8")
    valueset.write_text('* include codes from system RxCodes\n', encoding="utf-8")
    mapping = '* group[=].element[+].code = #RX_OK\n* group[=].element[=].target[+].code = #79243\n'

    conceptmap.write_text(
        '* group[+].source = "https://gematik.de/fhir/tiflow-erezept/CodeSystem/rx-codes"\n' + mapping,
        encoding="utf-8",
    )
    assert run_check([rx], [codesystem], [valueset]) == []

    conceptmap.write_text(
        '* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/rx-codes"\n' + mapping,
        encoding="utf-8",
    )
    assert [(f.type, f.code) for f in run_check([rx], [codesystem], [valueset])] == [
        ("MISSING_MAPPING", "RX_OK"),
        ("WRONG_SOURCE_URL", ""),
    ]


def test_conceptmap_only_required_when_ig_has_codes(tmp_path):
    diga = tmp_path / "diga"
    (diga / "input/fsh").mkdir(parents=True)
    assert run_check([diga], [], []) == []