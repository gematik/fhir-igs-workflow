from pathlib import Path
import re

root = Path('.')

vs_re = re.compile(r'^(ValueSet:\s*)EFlowRxVS([A-Za-z0-9_]+)\s*$', re.M)
cs_re = re.compile(r'^(CodeSystem:\s*)EFlowRxCS([A-Za-z0-9_]+)\s*$', re.M)

changed = 0
for path in root.rglob('*.fsh'):
    text = path.read_text(encoding='utf-8')
    new_text = vs_re.sub(lambda m: f"{m.group(1)}EFlowRx{m.group(2).replace('_','')}VS", text)
    new_text = cs_re.sub(lambda m: f"{m.group(1)}EFlowRx{m.group(2).replace('_','')}CS", new_text)
    if new_text != text:
        path.write_text(new_text, encoding='utf-8')
        changed += 1

print(f"Updated {changed} file(s).")
