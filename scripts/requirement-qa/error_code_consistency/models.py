"""Data models for error code consistency checks."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import List, Set


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
