"""Error code classification and import token normalization helpers."""

from __future__ import annotations

from typing import Optional, Tuple


IMPORT_SYSTEM_ALIASES: dict[str, str] = {
    "$hl7-oo": "OperationOutcomeCodes",
    "$ti-oo": "TIOperationOutcomeDetailsCS",
    "$tiflow-core-oo-cs": "TIFLOWOperationOutcomeDetailsCS",
}


# Order matters: longer prefixes must come before shorter ones.
CODE_CLASSIFICATIONS: dict[str, tuple] = {
    "TIFLOW_CHARGEITEM_": ("erp-chrg", "TIFLOW_CHARGEITEM_CS_OperationOutcomeDetails", "TIFLOW_CHARGEITEM_VS_OperationOutcomeDetails", False),
    "TIFLOW_EREZEPT_": ("rx", "TIFLOW_EREZEPT_CS_OperationOutcomeDetails", "TIFLOW_EREZEPT_VS_OperationOutcomeDetails", False),
    "TIFLOW_XBORDER_": ("erp-eu", "TIFLOW_XBORDER_CS_OperationOutcomeDetails", "TIFLOW_XBORDER_VS_OperationOutcomeDetails", False),
    "TIFLOW_DIGA_": ("diga", "TIFLOW_DIGA_CS_OperationOutcomeDetails", "TIFLOW_DIGA_VS_OperationOutcomeDetails", False),
    "TIFLOW_": ("core", "TIFLOW_CS_OperationOutcomeDetails", "TIFLOW_VS_OperationOutcomeDetails", False),
    "MSG_": ("varies", None, None, True),
    "SVC_": ("varies", None, None, True),
}


def classify_error_code(code: str) -> Tuple[str, Optional[str], Optional[str], bool]:
    for prefix, value in CODE_CLASSIFICATIONS.items():
        if code.startswith(prefix):
            return value
    if code.startswith("TIFLOW"):
        return "core", "TIFLOW_CS_OperationOutcomeDetails", "TIFLOW_VS_OperationOutcomeDetails", False
    return "unknown", None, None, True


def module_outcome_valueset_name(module: str) -> Optional[str]:
    mapping = {
        "core": "TIFLOW_VS_OperationOutcomeDetails",
        "rx": "TIFLOW_EREZEPT_VS_OperationOutcomeDetails",
        "diga": "TIFLOW_DIGA_VS_OperationOutcomeDetails",
        "erp-chrg": "TIFLOW_CHARGEITEM_VS_OperationOutcomeDetails",
        "erp-eu": "TIFLOW_XBORDER_VS_OperationOutcomeDetails",
    }
    return mapping.get(module)


def normalize_import_system(system: str) -> str:
    """Normalize alias-style import system identifiers to computable names."""
    return IMPORT_SYSTEM_ALIASES.get(system, system)


def normalize_include_token(include_token: str) -> str:
    """Normalize `<system>#<CODE>` token to preferred computable system names."""
    if "#" not in include_token:
        return normalize_import_system(include_token)
    system, code = include_token.split("#", 1)
    return f"{normalize_import_system(system)}#{code}"


def expected_import_system(code: str, code_owner_module: str, requirement_module: str) -> Optional[str]:
    """Return preferred import system name for external code usage in module ValueSets."""
    if code.startswith("SVC_"):
        return "TIOperationOutcomeDetailsCS"
    if code.startswith("MSG_"):
        return "OperationOutcomeCodes"
    if code_owner_module == "core" and requirement_module != "core" and code.startswith("TIFLOW_"):
        return "TIFLOWOperationOutcomeDetailsCS"
    return None


def expected_import_alias(code: str, code_owner_module: str, requirement_module: str) -> Optional[str]:
    """Backward-compatible wrapper. Returns preferred import system names."""
    return expected_import_system(code, code_owner_module, requirement_module)
