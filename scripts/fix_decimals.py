#!/usr/bin/env python3
"""
Ensures every "valueDecimal" field, and every "value" field inside a
"valueMoney" object, in the JSON files under fsh-generated/resources/
is written with exactly two decimal places.

Verbose logging included to make it obvious what the script is doing.
"""

import re
import sys
from pathlib import Path

FOLDER = Path("fsh-generated/resources")

# Matches: "valueDecimal": 5   or   "valueDecimal": 5.1   or   "valueDecimal": -3.456
DECIMAL_PATTERN = re.compile(r'("valueDecimal"\s*:\s*)(-?\d+(?:\.\d+)?)')

# Matches an entire "valueMoney": { ... } object (assumes no nested {} inside it,
# true for FHIR Money: just value + currency, in any order)
MONEY_BLOCK_PATTERN = re.compile(r'"valueMoney"\s*:\s*\{[^{}]*\}')

# Matches the "value": <number> pair inside a valueMoney block
MONEY_VALUE_PATTERN = re.compile(r'("value"\s*:\s*)(-?\d+(?:\.\d+)?)')


def fix_decimal(match: re.Match) -> str:
    prefix, num = match.groups()
    value = float(num)
    return f'{prefix}{value:.2f}'


def fix_money_block(match: re.Match) -> str:
    block = match.group(0)
    new_block, count = MONEY_VALUE_PATTERN.subn(fix_decimal, block)
    return new_block


def process_file(path: Path) -> int:
    print(f"[CHECK] {path}")
    text = path.read_text(encoding="utf-8")
    total_count = 0

    # --- valueDecimal ---
    raw_decimal_matches = DECIMAL_PATTERN.findall(text)
    for prefix, num in raw_decimal_matches:
        print(f"         found valueDecimal = {num}")
    text, decimal_count = DECIMAL_PATTERN.subn(fix_decimal, text)
    total_count += decimal_count

    # --- valueMoney.value ---
    raw_money_blocks = MONEY_BLOCK_PATTERN.findall(text)
    for block in raw_money_blocks:
        inner = MONEY_VALUE_PATTERN.search(block)
        if inner:
            print(f"         found valueMoney.value = {inner.group(2)}")
    text, money_block_subs = MONEY_BLOCK_PATTERN.subn(fix_money_block, text)
    # money_block_subs counts blocks touched, not individual value fields;
    # good enough for reporting purposes since each block has one "value"
    total_count += len(raw_money_blocks)

    if not raw_decimal_matches and not raw_money_blocks:
        print(f"         no valueDecimal or valueMoney field found")
        return 0

    original_text = path.read_text(encoding="utf-8")
    if text == original_text:
        print(f"         already formatted correctly, no changes needed")
        return 0

    path.write_text(text, encoding="utf-8")
    print(f"         [UPDATED] {total_count} field(s) rewritten in {path}")
    return total_count


def main() -> None:
    cwd = Path.cwd()
    print(f"[INFO] Current working directory: {cwd}")
    print(f"[INFO] Looking for folder: {FOLDER.resolve()}")

    if not FOLDER.exists():
        print(f"[ERROR] Folder not found: {FOLDER.resolve()}")
        print(f"[HINT] Run this script from the directory that contains 'fsh-generated/', "
              f"or edit the FOLDER variable to an absolute path.")
        sys.exit(1)

    json_files = sorted(FOLDER.rglob("*.json"))
    print(f"[INFO] Found {len(json_files)} .json file(s) under {FOLDER}")

    if not json_files:
        print(f"[WARN] No .json files found in {FOLDER.resolve()} — nothing to do.")
        return

    total_updated = 0
    files_changed = 0
    for path in json_files:
        updated = process_file(path)
        if updated:
            files_changed += 1
            total_updated += updated

    print("")
    print(f"[SUMMARY] Scanned {len(json_files)} file(s)")
    print(f"[SUMMARY] Modified {files_changed} file(s)")
    print(f"[SUMMARY] Rewrote {total_updated} valueDecimal/valueMoney field(s) total")


if __name__ == "__main__":
    main()