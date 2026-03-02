from pathlib import Path
import re

root = Path("igs/rx/input/fsh")

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

# Build mapping from current EFlowRx names back to GEM_ERP_* names based on filenames.
name_map = {}
for path in root.rglob("*.fsh"):
    stem = path.stem
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
            else:  # GEM_ERP_VS_
                eflow_name = f"EFlowRx{compact}VS"
            name_map[eflow_name] = stem
            break

# Precompile replacement regexes for speed.
name_patterns = [
    (re.compile(rf"(?<![A-Za-z0-9_]){re.escape(src)}(?![A-Za-z0-9_])"), dst)
    for src, dst in name_map.items()
]

changed = 0
for path in root.rglob("*.fsh"):
    text = path.read_text(encoding="utf-8")
    new_text = text

    stem = path.stem
    for prefix, kind in prefixes.items():
        if stem.startswith(prefix):
            suffix = stem[len(prefix):]
            id_value = id_prefixes[prefix] + suffix.replace("_", "-")

            # Normalize definition headers based on filename.
            new_text = re.sub(rf"^{kind}:\s*.*$", f"{kind}: {stem}", new_text, flags=re.M)
            new_text = re.sub(r"^Id:\s*.*$", f"Id: {id_value}", new_text, flags=re.M)
            break

    # Replace references from EFlowRx* back to GEM_ERP_*.
    for pattern, repl in name_patterns:
        new_text = pattern.sub(repl, new_text)

    if new_text != text:
        path.write_text(new_text, encoding="utf-8")
        changed += 1

print(f"Updated {changed} file(s).")
