"""Error code consistency check package.

Public API re-exports for use by other scripts or future checks.
"""

from .checks import (
    check_capabilitystatement_consistency,
    check_cs_vs_consistency,
    check_description_consistency,
    check_module_codesystem_placement,
    check_orphaned_codes,
    check_requirements_missing_keys,
    check_valueset_import_descriptions,
)
from .cli import find_ig_roots, iter_requirement_files, main
from .models import CodeDescription, CodeSystemDef, ErrorCode, Finding, ValueSetDef

MAX_FIX_PASSES = 3

__all__ = [
    "main",
    "find_ig_roots",
    "iter_requirement_files",
    "check_capabilitystatement_consistency",
    "check_cs_vs_consistency",
    "check_description_consistency",
    "check_valueset_import_descriptions",
    "check_module_codesystem_placement",
    "check_orphaned_codes",
    "check_requirements_missing_keys",
    "CodeDescription",
    "CodeSystemDef",
    "ErrorCode",
    "Finding",
    "ValueSetDef",
    "MAX_FIX_PASSES",
]
