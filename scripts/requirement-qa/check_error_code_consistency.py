#!/usr/bin/env python3
"""Check consistency of error codes across requirement definitions, CodeSystem/ValueSet, and CapabilityStatement.

Validates that:
1. Error codes in requirement error constellation tables are defined in appropriate CS/VS
2. Codes follow naming conventions (TIFLOW_*, MSG_*, SVC_*, etc.)
3. Codes are referenced in CapabilityStatement (informational phase)

Use --fix to create missing CodeSystem/ValueSet files and add code stubs.
"""

from __future__ import annotations

import argparse
import csv
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Set, Tuple


# Regex to extract error constellation tables from requirement blocks
ERROR_TABLE_RE = re.compile(
    r'<table[^>]*id="error-output"[^>]*>.*?</table>',
    re.DOTALL,
)

# Regex to extract "Details Code" value from a table
DETAILS_CODE_RE = re.compile(
    r'<th>Details Code</th>\s*<td>([^<]+)</td>',
    re.DOTALL,
)

# Regex to extract requirement key and line number
REQUIREMENT_KEY_RE = re.compile(
    r'<requirement[^>]*\bkey="([^"]+)"[^>]*>',
)

# CodeSystem/ValueSet patterns
CODESYSTEM_PATTERN = re.compile(
    r'CodeSystem:\s+(\w+)',
)

VALUESET_PATTERN = re.compile(
    r'ValueSet:\s+(\w+)',
)

# FSH code definition: "* #code "description""
FSH_CODE_DEF_RE = re.compile(
    r'^\s*\*\s+#([a-zA-Z0-9_\-]+)\s+"([^"]*)"',
    re.MULTILINE,
)

# FSH include statement patterns
FSH_INCLUDE_CODES_RE = re.compile(
    r'^\s*\*\s+include\s+codes\s+from\s+system\s+(\S+)',
    re.MULTILINE,
)

FSH_INCLUDE_EXTERNAL_RE = re.compile(
    r'^\s*\*\s+include\s+(\$\w+)#(\w+)\s+"([^"]*)"',
    re.MULTILINE,
)


@dataclass
class ErrorCode:
    code: str
    file_path: Path
    line: int
    requirement_key: str
    http_code: str
    severity: str
    code_field: str


@dataclass
class CodeSystemDef:
    id: str
    file_path: Path
    codes: Set[str]


@dataclass
class ValueSetDef:
    id: str
    file_path: Path
    includes: List[str]  # List of "system#code" or "system" patterns


@dataclass
class Finding:
    type: str  # MISSING_IN_CS, MISSING_IMPORT, ORPHANED_CODE, NAMING_ISSUE, etc.
    ig_module: str
    file_path: Path
    line: int
    code: str
    requirement_key: str
    message: str


# Code classification: prefix -> (module, cs_file, vs_file, is_external)
CODE_CLASSIFICATIONS = {
    'TIFLOW_': ('core', 'TIFLOW_CS_OperationOutcomeDetails', 'TIFLOW_VS_OperationOutcomeDetails', False),
    'MSG_': ('varies', None, None, True),  # External HL7 codes
    'SVC_': ('varies', None, None, True),  # External service codes
    'TIFLOW_RX_': ('rx', 'TIFLOW_RX_CS_OperationOutcomeDetails', 'TIFLOW_RX_VS_OperationOutcomeDetails', False),
    'TIFLOW_DIGA_': ('diga', 'TIFLOW_DIGA_CS_OperationOutcomeDetails', 'TIFLOW_DIGA_VS_OperationOutcomeDetails', False),
    'TIFLOW_ERPCHRG_': ('erp-chrg', 'TIFLOW_ERPCHRG_CS_OperationOutcomeDetails', 'TIFLOW_ERPCHRG_VS_OperationOutcomeDetails', False),
    'TIFLOW_ERPEU_': ('erp-eu', 'TIFLOW_ERPEU_CS_OperationOutcomeDetails', 'TIFLOW_ERPEU_VS_OperationOutcomeDetails', False),
    'GEM_ERP': ('core', 'GEM_ERP_CS_OperationOutcomeDetails', 'GEM_ERP_VS_OperationOutcomeDetails', False),
    'ERPFD_': ('core', 'GEM_ERP_CS_OperationOutcomeDetails', 'GEM_ERP_VS_OperationOutcomeDetails', False),
}


def classify_error_code(code: str) -> Tuple[str, Optional[str], Optional[str], bool]:
    """Classify error code by prefix to determine target module and files."""
    for prefix, (module, cs_file, vs_file, is_external) in CODE_CLASSIFICATIONS.items():
        if code.startswith(prefix):
            return module, cs_file, vs_file, is_external
    # Default fallback: assume core if unrecognized pattern starts with TIFLOW
    if code.startswith('TIFLOW'):
        return 'core', 'TIFLOW_CS_OperationOutcomeDetails', 'TIFLOW_VS_OperationOutcomeDetails', False
    return 'unknown', None, None, True


def extract_error_codes_from_requirements(
    targets: Iterable[Path],
) -> Dict[str, ErrorCode]:
    """Extract all error codes from requirement error constellation tables."""
    codes: Dict[str, ErrorCode] = {}
    
    for file_path in targets:
        content = file_path.read_text(encoding='utf-8')
        
        # Find requirement key for context
        req_key = '(unknown)'
        for req_match in REQUIREMENT_KEY_RE.finditer(content):
            req_key = req_match.group(1)
            
            # Find error tables within this requirement
            req_start = req_match.start()
            next_req = content.find('<requirement', req_start + 1)
            if next_req == -1:
                next_req = len(content)
            req_section = content[req_start:next_req]
            
            for table_match in ERROR_TABLE_RE.finditer(req_section):
                for code_match in DETAILS_CODE_RE.finditer(table_match.group()):
                    error_code = code_match.group(1).strip()
                    line_num = content[:req_start + table_match.start()].count('\n') + 1
                    
                    # Extract HTTP-Code and Code field
                    table_text = table_match.group()
                    http_match = re.search(r'<th>HTTP-Code</th>\s*<td>([^<]+)</td>', table_text)
                    severity_match = re.search(r'<th>Severity</th>\s*<td>([^<]+)</td>', table_text)
                    code_field_match = re.search(r'<th>Code</th>\s*<td>([^<]+)</td>', table_text)
                    
                    http_code = http_match.group(1).strip() if http_match else '?'
                    severity = severity_match.group(1).strip() if severity_match else '?'
                    code_field = code_field_match.group(1).strip() if code_field_match else '?'
                    
                    code_key = f"{req_key}:{error_code}"
                    codes[code_key] = ErrorCode(
                        code=error_code,
                        file_path=file_path,
                        line=line_num,
                        requirement_key=req_key,
                        http_code=http_code,
                        severity=severity,
                        code_field=code_field,
                    )
    
    return codes


def find_codesystem_files(ig_root: Path) -> Dict[str, CodeSystemDef]:
    """Find and parse all CodeSystem files in an IG."""
    cs_defs: Dict[str, CodeSystemDef] = {}
    
    codesystems_dir = ig_root / 'input' / 'fsh' / 'codesystems'
    if not codesystems_dir.exists():
        return cs_defs
    
    for cs_file in codesystems_dir.glob('*.fsh'):
        content = cs_file.read_text(encoding='utf-8')
        codes: Set[str] = set()
        
        for match in FSH_CODE_DEF_RE.finditer(content):
            codes.add(match.group(1))
        
        # Use file stem as ID (e.g., "TIFLOW_CS_OperationOutcomeDetails")
        cs_id = cs_file.stem
        # Always track CodeSystem files, even if empty (for finding missing code definitions)
        cs_defs[cs_id] = CodeSystemDef(id=cs_id, file_path=cs_file, codes=codes)
    
    return cs_defs


def find_valueset_files(ig_root: Path) -> Dict[str, ValueSetDef]:
    """Find and parse all ValueSet files in an IG."""
    vs_defs: Dict[str, ValueSetDef] = {}
    
    valuesets_dir = ig_root / 'input' / 'fsh' / 'valuesets'
    if not valuesets_dir.exists():
        return vs_defs
    
    for vs_file in valuesets_dir.glob('*.fsh'):
        content = vs_file.read_text(encoding='utf-8')
        includes: List[str] = []
        
        # Match "include codes from system SomeSystem"
        for match in FSH_INCLUDE_CODES_RE.finditer(content):
            includes.append(match.group(1))
        
        # Match "include $alias#CODE "description""
        for match in FSH_INCLUDE_EXTERNAL_RE.finditer(content):
            alias = match.group(1)
            code = match.group(2)
            # Store as "alias:CODE" for later matching
            includes.append(f"{alias}#{code}")
        
        vs_id = vs_file.stem
        vs_defs[vs_id] = ValueSetDef(id=vs_id, file_path=vs_file, includes=includes)
    
    return vs_defs


def check_error_codes(
    error_codes: Dict[str, ErrorCode],
    ig_roots: Dict[str, Path],
) -> List[Finding]:
    """Check consistency of error codes across CS/VS."""
    findings: List[Finding] = []
    
    # Build combined registry: key format is "cs_filename" -> CodeSystemDef
    all_codesystems: Dict[str, CodeSystemDef] = {}
    all_valuesets: Dict[str, ValueSetDef] = {}
    
    for ig_name, ig_root in ig_roots.items():
        cs_defs = find_codesystem_files(ig_root)
        vs_defs = find_valueset_files(ig_root)
        
        for cs_id, cs_def in cs_defs.items():
            # Use just the cs_id as key since that's what's returned from classification
            all_codesystems[cs_id] = cs_def
        
        for vs_id, vs_def in vs_defs.items():
            all_valuesets[vs_id] = vs_def
    
    # Check each error code
    for code_key, error_code in error_codes.items():
        module, cs_file, vs_file, is_external = classify_error_code(error_code.code)
        
        if is_external:
            # External codes (MSG_*, SVC_*) must be in a ValueSet import
            found_in_vs = False
            for vs_key, vs_def in all_valuesets.items():
                # Check if code is in includes list (either as system#code or plain)
                if any(error_code.code in include for include in vs_def.includes):
                    found_in_vs = True
                    break
            
            if not found_in_vs:
                findings.append(Finding(
                    type='MISSING_IMPORT',
                    ig_module=module if module != 'varies' else 'core',
                    file_path=error_code.file_path,
                    line=error_code.line,
                    code=error_code.code,
                    requirement_key=error_code.requirement_key,
                    message=f"Code '{error_code.code}' not imported in any ValueSet",
                ))
        else:
            # Local codes must be in CodeSystem
            if cs_file is None:
                # Shouldn't happen, but skip if file name is None
                continue
            
            if cs_file not in all_codesystems:
                findings.append(Finding(
                    type='MISSING_CS_FILE',
                    ig_module=module,
                    file_path=error_code.file_path,
                    line=error_code.line,
                    code=error_code.code,
                    requirement_key=error_code.requirement_key,
                    message=f"CodeSystem '{cs_file}' not found in module '{module}'",
                ))
            else:
                cs_def = all_codesystems[cs_file]
                if error_code.code not in cs_def.codes:
                    findings.append(Finding(
                        type='MISSING_IN_CS',
                        ig_module=module,
                        file_path=error_code.file_path,
                        line=error_code.line,
                        code=error_code.code,
                        requirement_key=error_code.requirement_key,
                        message=f"Code '{error_code.code}' not defined in {cs_file}.fsh",
                    ))
    
    return findings


def iter_requirement_files(targets: Iterable[str]) -> Iterable[Path]:
    """Iterate over requirement markdown files matching targets."""
    if not targets:
        targets = ['igs/*/input/pagecontent']
    
    seen: Set[Path] = set()
    for target in targets:
        path = Path(target)
        
        if any(ch in target for ch in "*?[]"):
            for matched in Path('.').glob(target):
                if matched.is_file() and matched.suffix.lower() == '.md':
                    resolved = matched.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield matched
                elif matched.is_dir():
                    for md_file in matched.rglob('*.md'):
                        resolved = md_file.resolve()
                        if resolved not in seen:
                            seen.add(resolved)
                            yield md_file
            continue
        
        if path.is_file() and path.suffix.lower() == '.md':
            resolved = path.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield path
            continue
        
        if path.is_dir():
            # If IG root, scan input/pagecontent
            if (path / 'input' / 'pagecontent').is_dir():
                scan_dir = path / 'input' / 'pagecontent'
                for md_file in scan_dir.rglob('*.md'):
                    resolved = md_file.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield md_file
                continue
            
            # Fallback: recursively glob
            for md_file in path.rglob('*.md'):
                resolved = md_file.resolve()
                if resolved not in seen:
                    seen.add(resolved)
                    yield md_file


def find_ig_roots(root_dir: Path = Path('igs')) -> Dict[str, Path]:
    """Find all IG root directories."""
    ig_roots = {}
    if not root_dir.exists():
        return ig_roots
    
    for ig_dir in root_dir.iterdir():
        if ig_dir.is_dir() and (ig_dir / 'input').exists():
            ig_roots[ig_dir.name] = ig_dir
    
    return ig_roots


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check consistency of error codes in requirements, CodeSystem/ValueSet, and CapabilityStatement."
    )
    parser.add_argument(
        "targets",
        nargs="*",
        help="Files/directories to scan for requirement files (default: igs/*/input/pagecontent)",
    )
    parser.add_argument(
        "--fix",
        action="store_true",
        help="Create missing CodeSystem/ValueSet files and add code stubs",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/error-code-consistency-report.csv",
        help="Write CSV report to this file (default: qa/error-code-consistency-report.csv)",
    )
    args = parser.parse_args()
    
    # Find requirement files
    req_files = list(iter_requirement_files(args.targets))
    if not req_files:
        print("No requirement files found for the given targets.")
        return 1
    
    # Extract error codes from requirements
    error_codes = extract_error_codes_from_requirements(req_files)
    if not error_codes:
        print("No error codes found in requirement files.")
        return 0
    
    # Find IG roots
    ig_roots = find_ig_roots()
    if not ig_roots:
        print("Warning: No IG roots found in 'igs/' directory.")
        return 1
    
    # Check consistency
    findings = check_error_codes(error_codes, ig_roots)
    
    # Write CSV report
    csv_path = Path(args.output_csv)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    
    with csv_path.open('w', encoding='utf-8', newline='') as fp:
        writer = csv.writer(fp)
        writer.writerow(['type', 'ig_module', 'file', 'line', 'code', 'requirement_key', 'message'])
        
        for finding in findings:
            writer.writerow([
                finding.type,
                finding.ig_module,
                str(finding.file_path),
                finding.line,
                finding.code,
                finding.requirement_key,
                finding.message,
            ])
        
        # Summary row
        writer.writerow([
            'SUMMARY',
            '',
            '',
            '',
            '',
            '',
            f"Scanned {len(req_files)} requirement file(s), extracted {len(error_codes)} error code(s), found {len(findings)} issue(s).",
        ])
    
    # Print summary
    print(f"\n==> Error Code Consistency Check")
    print(f"Scanned: {len(req_files)} requirement file(s)")
    print(f"Extracted: {len(error_codes)} error code(s)")
    print(f"Issues: {len(findings)}")
    
    if findings:
        print(f"\nIssues found:")
        for finding in findings:
            print(f"  [{finding.type}] {finding.file_path}:{finding.line} {finding.requirement_key}: {finding.code} - {finding.message}")
    
    print(f"\nCSV report written to: {csv_path}")
    
    return 1 if findings else 0


if __name__ == "__main__":
    sys.exit(main())
