from pathlib import Path
import re
import subprocess

root = Path("igs/diga/input/fsh")

prefixes = {
    "GEM_ERP_PR_": "Profile",
    "GEM_ERP_EX_": "Extension",
    "GEM_ERP_CS_": "CodeSystem",
    "GEM_ERP_VS_": "ValueSet",
}

id_prefixes = {
    "GEM_ERP_PR_": "GEM-ERP-PR-",
    "GEM_ERP_EX_": "GEM-ERP-EX-",
    "GEM_ERP_CS_": "GEM-ERP-CS-",
    "GEM_ERP_VS_": "GEM-ERP-VS-",
}

raw = subprocess.check_output(
    ["git", "ls-tree", "-r", "main", "--name-only", "igs/diga/input/fsh"],
    text=True,
).strip().splitlines()

old_stems = []
for path in raw:
    p = Path(path)
    if p.suffix == ".fsh":
        old_stems.append(p.stem)

name_map = {}
for stem in old_stems:
    for prefix in prefixes:
        if stem.startswith(prefix):
            suffix = stem[len(prefix):]
            compact = suffix.replace("_", "")
            if prefix == "GEM_ERP_PR_":
                eflow_name = f"EFlowRx{compact}"
            elif prefix == "GEM_ERP_EX_":
                eflow_name = f"EFlowRx{compact}Extension"
            elif prefix == "GEM_ERP_CS_":
                eflow_name = f"EFlowRx{compact}CS"
            else:
                eflow_name = f"EFlowRx{compact}VS"
            name_map[eflow_name] = stem
            break

name_patterns = [
    (re.compile(rf"(?<![A-Za-z0-9_]){re.escape(src)}(?![A-Za-z0-9_])"), dst)
    for src, dst in name_map.items()
]

changed = 0
renamed = 0

for path in root.rglob("*.fsh"):
    text = path.read_text(encoding="utf-8")
    new_text = text

    current_stem = path.stem
    target_stem = name_map.get(current_stem, current_stem)

    for prefix, kind in prefixes.items():
        if target_stem.startswith(prefix):
            suffix = target_stem[len(prefix):]
            id_value = id_prefixes[prefix] + suffix.replace("_", "-")
            new_text = re.sub(rf"^{kind}:\s*.*$", f"{kind}: {target_stem}", new_text, flags=re.M)
            new_text = re.sub(r"^Id:\s*.*$", f"Id: {id_value}", new_text, flags=re.M)
            break

    for pattern, repl in name_patterns:
        new_text = pattern.sub(repl, new_text)

    if new_text != text:
        path.write_text(new_text, encoding="utf-8")
        changed += 1

    if current_stem != target_stem:
        new_path = path.with_name(target_stem + path.suffix)
        if not new_path.exists():
            path.rename(new_path)
            renamed += 1

print(f"Updated {changed} file(s), renamed {renamed} file(s).")
