#!/usr/bin/env python3
"""Quality checks for requirement blocks in markdown files.

Checks:
- conformance value against requirement text modal verb:
  - MUSS -> SHALL
  - MUSS NICHT / DARF NICHT -> SHALL NOT
  - SOLL -> SHOULD
  - KANN / DARF -> MAY
- actor name against beginning of requirement text:
  - Der E-Rezept-Fachdienst -> E-Rezept-Fachdienst
  - Das E-Rezept-FdV -> eRp_FdV
  - Das PS der abgebenden LEI -> PS_E-Rezept_abgebend
  - Das PS der verordnenden LEI -> PS_E-Rezept_verordnend
    - Das Clientsystem Kostenträger -> CS_E-Rezept_KTR
    - Anbieter E-Rezept-Fachdienst -> Anb_eRp_FD
- reports unknown actor names
- canonicalizes alias subject phrase:
    - Das CS Kostenträger -> Das Clientsystem Kostenträger

Use --fix to apply safe automatic fixes.
"""

from __future__ import annotations

import argparse
import csv
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Set, Tuple


REQ_BLOCK_RE = re.compile(
    r"(?P<comment><!--\s*(?P<aid>A_\d+(?:-\d+)?)\s*-->\s*)?"
    r"(?P<block><requirement\b(?P<attrs>[^>]*)>(?P<body>.*?)</requirement>)",
    re.DOTALL,
)

ACTOR_RE = re.compile(r"<actor\b[^>]*\bname=\"([^\"]+)\"[^>]*>", re.DOTALL)
CONFORMANCE_RE = re.compile(r"\bconformance=\"([^\"]+)\"")
TAG_RE = re.compile(r"<[^>]+>")


KNOWN_ACTORS: Set[str] = {
    "E-Rezept-Fachdienst",
    "eRp_FdV",
    "PS_E-Rezept_abgebend",
    "PS_E-Rezept_verordnend",
    "CS_E-Rezept_KTR",
    "Anb_eRp_FD",
    "Anbieter E-Rezept-Fachdienst",
}


# Ordered by priority and specificity.
SUBJECT_RULES: List[Tuple[str, str, str]] = [
    ("Der E-Rezept-Fachdienst", "E-Rezept-Fachdienst", "Der E-Rezept-Fachdienst"),
    ("Das E-Rezept-FdV", "eRp_FdV", "Das E-Rezept-FdV"),
    ("Das PS der abgebenden LEI", "PS_E-Rezept_abgebend", "Das PS der abgebenden LEI"),
    ("Das PS der verordnenden LEI", "PS_E-Rezept_verordnend", "Das PS der verordnenden LEI"),
    ("Das Clientsystem Kostenträger", "CS_E-Rezept_KTR", "Das Clientsystem Kostenträger"),
    ("Das Clientsystem Kostentraeger", "CS_E-Rezept_KTR", "Das Clientsystem Kostenträger"),
    ("Das CS Kostenträger", "CS_E-Rezept_KTR", "Das Clientsystem Kostenträger"),
    ("Das CS Kostentraeger", "CS_E-Rezept_KTR", "Das Clientsystem Kostenträger"),
    ("Anbieter E-Rezept-Fachdienst", "Anb_eRp_FD", "Anbieter E-Rezept-Fachdienst"),
]

ACTOR_CANONICAL_SUBJECT: Dict[str, str] = {
    "E-Rezept-Fachdienst": "Der E-Rezept-Fachdienst",
    "eRp_FdV": "Das E-Rezept-FdV",
    "PS_E-Rezept_abgebend": "Das PS der abgebenden LEI",
    "PS_E-Rezept_verordnend": "Das PS der verordnenden LEI",
    "CS_E-Rezept_KTR": "Das Clientsystem Kostenträger",
    "Anb_eRp_FD": "Anbieter E-Rezept-Fachdienst",
}


@dataclass
class Finding:
    file_path: Path
    line: int
    aid: str
    message: str


@dataclass
class CheckResult:
    findings: List[Finding]
    unknown_actors: Set[str]
    changed: bool


def strip_tags(text: str) -> str:
    return TAG_RE.sub(" ", text)


def normalize_space(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip()


def get_modal_expected_conformance(text: str) -> Optional[str]:
    # Case-sensitive on purpose: only all-caps modals are normative markers.
    # This avoids matching incidental lowercase words like "... zuweisen kann".
    sentences = re.split(r"[.!?;]", text)

    # SHALL NOT when text contains DARF ... NICHT within one sentence fragment.
    for sentence in sentences:
        if re.search(r"\bDARF\b.*?\bNICHT\b", sentence):
            return "SHALL NOT"

    if re.search(r"\bMUSS\b", text):
        return "SHALL"

    if re.search(r"\bSOLL\b", text):
        return "SHOULD"

    if re.search(r"\bKANN\b", text):
        return "MAY"

    return None


def detect_subject(text: str) -> Optional[Tuple[str, str, str]]:
    for subject_prefix, actor, canonical_subject in SUBJECT_RULES:
        if text.startswith(subject_prefix):
            return subject_prefix, actor, canonical_subject
    return None


def line_for_offset(content: str, offset: int) -> int:
    return content.count("\n", 0, offset) + 1


def iter_target_files(targets: Sequence[str]) -> Iterable[Path]:
    if not targets:
        targets = ["igs"]

    seen: Set[Path] = set()
    for target in targets:
        path = Path(target)

        if any(ch in target for ch in "*?[]"):
            for matched in Path(".").glob(target):
                if matched.is_file() and matched.suffix.lower() == ".md":
                    resolved = matched.resolve()
                    if resolved not in seen:
                        seen.add(resolved)
                        yield matched
            continue

        if path.is_file() and path.suffix.lower() == ".md":
            resolved = path.resolve()
            if resolved not in seen:
                seen.add(resolved)
                yield path
            continue

        if path.is_dir():
            for md_file in path.rglob("*.md"):
                resolved = md_file.resolve()
                if resolved not in seen:
                    seen.add(resolved)
                    yield md_file


def check_file(file_path: Path, fix: bool) -> CheckResult:
    content = file_path.read_text(encoding="utf-8")
    findings: List[Finding] = []
    unknown_actors: Set[str] = set()
    changed = False

    output_parts: List[str] = []
    cursor = 0

    for match in REQ_BLOCK_RE.finditer(content):
        start, end = match.span("block")
        block = match.group("block")
        attrs = match.group("attrs") or ""
        body = match.group("body") or ""
        aid = match.group("aid") or "(ohne A_ID)"

        line = line_for_offset(content, start)

        actor_match = ACTOR_RE.search(body)
        actor_name = actor_match.group(1) if actor_match else ""

        if actor_name and actor_name not in KNOWN_ACTORS:
            unknown_actors.add(actor_name)

        body_after_actor = re.sub(r"^.*?</actor>", "", body, flags=re.DOTALL)
        body_plain = normalize_space(strip_tags(body_after_actor))

        expected_conf = get_modal_expected_conformance(body_plain)
        conf_match = CONFORMANCE_RE.search(attrs)
        actual_conf = conf_match.group(1) if conf_match else ""

        new_block = block

        if expected_conf and actual_conf and actual_conf != expected_conf:
            findings.append(
                Finding(
                    file_path=file_path,
                    line=line,
                    aid=aid,
                    message=(
                        f"conformance mismatch: '{actual_conf}' but text implies '{expected_conf}'"
                    ),
                )
            )
            if fix:
                new_block = re.sub(
                    r'\bconformance="[^"]+"',
                    f'conformance="{expected_conf}"',
                    new_block,
                    count=1,
                )

        subject_info = detect_subject(body_plain)
        if subject_info:
            subject_prefix, expected_actor, canonical_subject = subject_info

            if actor_name and actor_name != expected_actor:
                findings.append(
                    Finding(
                        file_path=file_path,
                        line=line,
                        aid=aid,
                        message=(
                            f"actor mismatch: actor='{actor_name}' but text starts with "
                            f"'{subject_prefix}' -> expected actor='{expected_actor}'"
                        ),
                    )
                )
                if fix and actor_match:
                    new_block = re.sub(
                        r'(<actor\b[^>]*\bname=")([^"]+)("[^>]*>)',
                        rf"\g<1>{expected_actor}\g<3>",
                        new_block,
                        count=1,
                    )
                    actor_name = expected_actor

            if actor_name == expected_actor and subject_prefix != canonical_subject:
                findings.append(
                    Finding(
                        file_path=file_path,
                        line=line,
                        aid=aid,
                        message=(
                            f"non-canonical actor subject: '{subject_prefix}' -> "
                            f"'{canonical_subject}'"
                        ),
                    )
                )
                if fix:
                    new_block = new_block.replace(subject_prefix, canonical_subject, 1)

        # If there is no recognizable subject, but actor is known, do not enforce.

        output_parts.append(content[cursor:start])
        output_parts.append(new_block)
        cursor = end

        if new_block != block:
            changed = True

    output_parts.append(content[cursor:])

    if fix and changed:
        file_path.write_text("".join(output_parts), encoding="utf-8")

    return CheckResult(findings=findings, unknown_actors=unknown_actors, changed=changed)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Quality checks for requirement blocks (conformance + actor consistency)."
    )
    parser.add_argument(
        "targets",
        nargs="*",
        help="Files/directories/globs to scan (default: igs)",
    )
    parser.add_argument(
        "--fix",
        action="store_true",
        help="Apply automatic fixes for conformance/actor/subject mismatches",
    )
    parser.add_argument(
        "--output",
        default="qa/requirement-quality-report.txt",
        help="Write report to this file (default: qa/requirement-quality-report.txt)",
    )
    parser.add_argument(
        "--output-csv",
        default="qa/requirement-quality-report.csv",
        help="Write CSV report to this file (default: qa/requirement-quality-report.csv)",
    )
    args = parser.parse_args()

    files = list(iter_target_files(args.targets))
    if not files:
        print("No markdown files found for the given targets.")
        return 1

    all_findings: List[Finding] = []
    all_unknown_actors: Set[str] = set()
    changed_files = 0

    for file_path in files:
        result = check_file(file_path, args.fix)
        all_findings.extend(result.findings)
        all_unknown_actors.update(result.unknown_actors)
        if result.changed:
            changed_files += 1

    report_lines: List[str] = []

    for finding in all_findings:
        report_lines.append(
            f"[ISSUE] {finding.file_path}:{finding.line} {finding.aid}: {finding.message}"
        )

    if all_unknown_actors:
        for actor in sorted(all_unknown_actors):
            report_lines.append(f"[UNKNOWN_ACTOR] unbekannten actor '{actor}' gefunden")

    report_lines.append(
        f"Checked {len(files)} file(s), found {len(all_findings)} issue(s), "
        f"unknown actors: {len(all_unknown_actors)}, changed files: {changed_files}."
    )

    report_text = "\n".join(report_lines) + "\n"

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(report_text, encoding="utf-8")

    csv_path = Path(args.output_csv)
    csv_path.parent.mkdir(parents=True, exist_ok=True)
    with csv_path.open("w", encoding="utf-8", newline="") as fp:
        writer = csv.writer(fp)
        writer.writerow(["type", "file", "line", "aid", "message"])
        for finding in all_findings:
            writer.writerow(
                [
                    "ISSUE",
                    str(finding.file_path),
                    finding.line,
                    finding.aid,
                    finding.message,
                ]
            )
        for actor in sorted(all_unknown_actors):
            writer.writerow(
                [
                    "UNKNOWN_ACTOR",
                    "",
                    "",
                    "",
                    f"unbekannten actor '{actor}' gefunden",
                ]
            )
        writer.writerow(
            [
                "SUMMARY",
                "",
                "",
                "",
                (
                    f"Checked {len(files)} file(s), found {len(all_findings)} issue(s), "
                    f"unknown actors: {len(all_unknown_actors)}, changed files: {changed_files}."
                ),
            ]
        )

    print(report_text, end="")
    print(f"Report written to: {output_path}")
    print(f"CSV report written to: {csv_path}")

    # Non-zero when issues remain (also in --fix mode, to force review).
    return 1 if all_findings else 0


if __name__ == "__main__":
    sys.exit(main())
