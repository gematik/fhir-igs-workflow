import pathlib
import re

root = pathlib.Path("/Users/gematik/dev/FHIR/fhir-igs-workflow/igs/rx/input/pagecontent")
req_re = re.compile(r"<requirement\b[\s\S]*?</requirement>", re.MULTILINE)
open_re = re.compile(r"^\s*<description>\s*$")
close_re = re.compile(r"^\s*</description>\s*$")

changed = []

for path in sorted(root.glob("*.md")):
    text = path.read_text(encoding="utf-8")
    replacements = []
    for match in req_re.finditer(text):
        block = match.group(0)
        lines = block.splitlines()
        if not lines:
            continue
        new_lines = []
        removed = False
        for line in lines:
            if open_re.match(line) or close_re.match(line):
                removed = True
                continue
            new_lines.append(line)
        if removed:
            replacements.append((match.start(), match.end(), "\n".join(new_lines)))
    if replacements:
        new_text = text
        for start, end, repl in reversed(replacements):
            new_text = new_text[:start] + repl + new_text[end:]
        if new_text != text:
            path.write_text(new_text, encoding="utf-8")
            changed.append(path)

print("Updated files:", len(changed))
for p in changed:
    print(p)
