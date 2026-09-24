from pathlib import Path

from error_code_consistency.checks import check_capabilitystatement_http_status_consistency
from error_code_consistency.models import ErrorCode


def test_capabilitystatement_http_status_mismatch_detected(tmp_path):
    ig_root = tmp_path / "diga"
    cap_dir = ig_root / "input" / "fsh" / "capabilitystatement"
    rulesets_dir = cap_dir / "rulesets"
    rulesets_dir.mkdir(parents=True)

    (cap_dir / "ERPCapabilityStatementServer.fsh").write_text(
        """
* insert CapSupportResourceOperation(abort, TIFlow-DIGA-OP-Abort, {expectation}, "Aborts the ePrescription workflow")
* insert TaskAbortOperationStatusCodes
""".strip()
        + "\n",
        encoding="utf-8",
    )

    (rulesets_dir / "ERPCapabilityStatementRulesetsResponseDefinition.fsh").write_text(
        """
RuleSet: TaskAbortOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch

RuleSet: TiflowTaskStatusMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[errorCode].valueString = "TIFLOW_TASK_STATUS_MISMATCH"
""".strip()
        + "\n",
        encoding="utf-8",
    )

    (rulesets_dir / "ERPCapabilityStatementRulesetsResponse.fsh").write_text(
        """
RuleSet: TiflowTaskStatusMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[errorCode].valueString = "TIFLOW_TASK_STATUS_MISMATCH"
""".strip()
        + "\n",
        encoding="utf-8",
    )

    error_codes = [
        ErrorCode(
            code="TIFLOW_TASK_STATUS_MISMATCH",
            file_path=Path("igs/core/input/pagecontent/op-abort-req-fd.md"),
            line=70,
            requirement_key="IG-TIFLOW-CORE-A142",
            http_code="412 - Precondition Failed",
            severity="error",
            code_field="invalid",
            module="diga",
            endpoint="op:abort",
        )
    ]

    findings = check_capabilitystatement_http_status_consistency(error_codes, {"diga": ig_root})

    assert findings
    assert findings[0].type == "CAPSTAT_HTTP_CODE_MISMATCH"
    assert "412" in findings[0].message
    assert "400" in findings[0].message


def test_core_requirement_http_status_mismatch_detected_against_module_capstat(tmp_path):
    ig_root = tmp_path / "diga"
    cap_dir = ig_root / "input" / "fsh" / "capabilitystatement"
    rulesets_dir = cap_dir / "rulesets"
    rulesets_dir.mkdir(parents=True)

    (cap_dir / "ERPCapabilityStatementServer.fsh").write_text(
        """
* insert CapSupportResourceOperation(abort, TIFlow-DIGA-OP-Abort, {expectation}, "Aborts the ePrescription workflow")
* insert TaskAbortOperationStatusCodes
""".strip()
        + "\n",
        encoding="utf-8",
    )

    (rulesets_dir / "ERPCapabilityStatementRulesetsResponseDefinition.fsh").write_text(
        """
RuleSet: TaskAbortOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch

RuleSet: TiflowTaskStatusMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[errorCode].valueString = "TIFLOW_TASK_STATUS_MISMATCH"
""".strip()
        + "\n",
        encoding="utf-8",
    )

    (rulesets_dir / "ERPCapabilityStatementRulesetsResponse.fsh").write_text(
        """
RuleSet: TiflowTaskStatusMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[errorCode].valueString = "TIFLOW_TASK_STATUS_MISMATCH"
""".strip()
        + "\n",
        encoding="utf-8",
    )

    error_codes = [
        ErrorCode(
            code="TIFLOW_TASK_STATUS_MISMATCH",
            file_path=Path("igs/core/input/pagecontent/op-abort-req-fd.md"),
            line=70,
            requirement_key="IG-TIFLOW-CORE-A142",
            http_code="412 - Precondition Failed",
            severity="error",
            code_field="invalid",
            module="core",
            endpoint="op:abort",
        )
    ]

    findings = check_capabilitystatement_http_status_consistency(error_codes, {"core": tmp_path / "core", "diga": ig_root})

    assert findings
    assert findings[0].ig_module == "diga"
    assert findings[0].type == "CAPSTAT_HTTP_CODE_MISMATCH"
    assert "412" in findings[0].message
    assert "400" in findings[0].message
