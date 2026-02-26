#!/usr/bin/env python3
"""Verify requirement mapping coverage against A_ IDs in Excel files."""

import argparse
import csv
import json
from pathlib import Path
from typing import Dict, Iterable, List, Set

import openpyxl


def format_source(path: Path) -> str:
    stem = path.stem
    if "_V" in stem:
        base, version = stem.rsplit("_V", 1)
        return f"{base} {version}"
    return stem


def collect_excel_ids(xlsx_paths: Iterable[Path]) -> Dict[str, Set[str]]:
    all_ids: Dict[str, Set[str]] = {}
    for path in xlsx_paths:
        source = format_source(path)
        workbook = openpyxl.load_workbook(path, read_only=True, data_only=True)
        for sheet_name in workbook.sheetnames:
            sheet = workbook[sheet_name]
            rows = sheet.iter_rows(min_row=1, max_row=1, values_only=True)
            header = next(rows, [])
            if not header:
                continue
            index = {name: i for i, name in enumerate(header) if name is not None}
            if "ID" not in index:
                continue
            id_idx = index["ID"]
            for row in sheet.iter_rows(min_row=2, values_only=True):
                value = row[id_idx]
                if not value:
                    continue
                req_id = str(value).strip()
                if req_id:
                    all_ids.setdefault(req_id, set()).add(source)
    return all_ids


def load_mapping(mapping_path: Path) -> List[Dict[str, List[str]]]:
    data = json.loads(mapping_path.read_text(encoding="utf-8"))
    return data.get("requirement_mapping", [])


def write_csv(path: Path, header: List[str], rows: List[List[str]]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(header)
        writer.writerows(rows)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Verify requirement mapping coverage against Excel A_ IDs."
    )
    parser.add_argument(
        "--xlsx-dir",
        default=".temp",
        help="Directory containing requirement Excel files (default: .temp)",
    )
    parser.add_argument(
        "--mapping",
        default="qa/requirement-mapping.json",
        help="Path to requirement-mapping.json (default: requirement-mapping.json)",
    )
    parser.add_argument(
        "--output-dir",
        default="qa",
        help="Directory to write CSV reports (default: qa)",
    )
    args = parser.parse_args()

    xlsx_dir = Path(args.xlsx_dir)
    mapping_path = Path(args.mapping)
    output_dir = Path(args.output_dir)

    if not xlsx_dir.exists():
        raise FileNotFoundError(f"XLSX directory not found: {xlsx_dir}")
    if not mapping_path.exists():
        raise FileNotFoundError(f"Mapping file not found: {mapping_path}")

    output_dir.mkdir(parents=True, exist_ok=True)

    xlsx_paths = sorted(xlsx_dir.glob("*.xlsx"))
    excel_ids = collect_excel_ids(xlsx_paths)

    mapping_entries = load_mapping(mapping_path)
    mapping_ids = {entry.get("old_req") for entry in mapping_entries if entry.get("old_req")}

    missing_ids = sorted(set(excel_ids.keys()) - mapping_ids)

    duplicate_rows: List[List[str]] = []
    for entry in mapping_entries:
        old_req = entry.get("old_req")
        new_req = entry.get("new_req") or []
        if old_req and len(new_req) > 1:
            duplicate_rows.append(
                [old_req, ";".join(sorted(new_req)), ";".join(sorted(entry.get("igs") or []))]
            )

    missing_rows = [[req_id, ";".join(sorted(excel_ids.get(req_id, set())))] for req_id in missing_ids]

    write_csv(
        output_dir / "requirement-mapping-missing.csv",
        ["old_req", "source"],
        missing_rows,
    )
    write_csv(
        output_dir / "requirement-mapping-duplicate.csv",
        ["old_req", "new_req", "igs"],
        duplicate_rows,
    )


if __name__ == "__main__":
    main()
