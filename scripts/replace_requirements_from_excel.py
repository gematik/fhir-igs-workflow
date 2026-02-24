#!/usr/bin/env python3
"""Replace A_ requirement IDs in a markdown file with requirement blocks from an Excel sheet."""

import argparse
import html
import re
from pathlib import Path
from typing import Dict, List

import openpyxl


A_ID_PATTERN = re.compile(r"A_\d+(?:-\d+)?")
FULL_LINE_IDS_PATTERN = re.compile(r"^(A_\d+(?:-\d+)?)(\s+A_\d+(?:-\d+)?)*$")


def load_requirements(excel_path: Path, sheet_name: str) -> Dict[str, Dict[str, str]]:
    workbook = openpyxl.load_workbook(excel_path, read_only=True, data_only=True)
    if sheet_name not in workbook.sheetnames:
        raise ValueError(f"Sheet '{sheet_name}' not found in {excel_path}")

    sheet = workbook[sheet_name]
    header = [cell.value for cell in next(sheet.iter_rows(min_row=1, max_row=1))]
    index = {name: i for i, name in enumerate(header)}

    required_columns = {"ID", "Titel", "Beschreibung", "Verbindlichkeit"}
    missing_columns = required_columns - set(index)
    if missing_columns:
        raise ValueError(f"Missing columns in Excel sheet: {', '.join(sorted(missing_columns))}")

    requirements: Dict[str, Dict[str, str]] = {}
    for row in sheet.iter_rows(min_row=2, values_only=True):
        req_id = row[index["ID"]]
        if not req_id:
            continue
        requirements[str(req_id).strip()] = {
            "title": (row[index["Titel"]] or "").strip(),
            "desc": (row[index["Beschreibung"]] or "").strip(),
            "level": (row[index["Verbindlichkeit"]] or "").strip(),
        }
    return requirements


def map_conformance(level: str) -> str:
    level = level.upper()
    if level == "MUSS":
        return "SHALL"
    if level == "SOLL":
        return "SHOULD"
    if level in {"KANN", "DARF"}:
        return "MAY"
    return "SHALL"


def format_description(text: str) -> str:
    text = text.replace("\xa0", " ")
    text = " ".join(text.split())
    return html.escape(text, quote=False)


def build_block(req_id: str, req: Dict[str, str], actor: str, test_procedure: str) -> str:
    title = req["title"].replace('"', "&quot;")
    conformance = map_conformance(req["level"])
    description = format_description(req["desc"])
    return (
        f"<!-- {req_id} -->\n"
        f"<requirement conformance=\"{conformance}\" title=\"{title}\">\n"
        "    <meta lockversion=\"false\"/>\n"
        f"    <actor name=\"{actor}\">\n"
        f"        <testProcedure id=\"{test_procedure}\"/>\n"
        "    </actor>\n"
        f"     {description}\n"
        "</requirement>\n"
    )


def replace_in_markdown(content: str, requirements: Dict[str, Dict[str, str]], actor: str, test_procedure: str) -> str:
    lines = content.splitlines()
    output_lines: List[str] = []

    for line in lines:
        stripped = line.strip()
        if not stripped or not FULL_LINE_IDS_PATTERN.fullmatch(stripped):
            output_lines.append(line)
            continue

        ids = A_ID_PATTERN.findall(stripped)

        blocks = []
        for req_id in ids:
            if req_id not in requirements:
                raise ValueError(f"Requirement ID '{req_id}' not found in Excel")
            blocks.append(build_block(req_id, requirements[req_id], actor, test_procedure).rstrip())

        output_lines.append("\n\n".join(blocks))

    return "\n".join(output_lines).rstrip() + "\n"


def main() -> None:
    parser = argparse.ArgumentParser(description="Replace A_ requirement IDs in a markdown file.")
    parser.add_argument("--markdown", required=True, help="Path to the markdown file to update")
    parser.add_argument("--excel", required=True, help="Path to the Excel file with requirements")
    parser.add_argument("--sheet", default="Festlegungen", help="Sheet name in the Excel file")
    parser.add_argument("--actor", default="E-Rezept-Fachdienst", help="Actor name for the requirement block")
    parser.add_argument("--test-procedure", default="Produkttest", help="Test procedure id")

    args = parser.parse_args()

    markdown_path = Path(args.markdown)
    excel_path = Path(args.excel)

    requirements = load_requirements(excel_path, args.sheet)
    content = markdown_path.read_text(encoding="utf-8")
    updated = replace_in_markdown(content, requirements, args.actor, args.test_procedure)
    markdown_path.write_text(updated, encoding="utf-8")


if __name__ == "__main__":
    main()
