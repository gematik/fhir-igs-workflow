#!/usr/bin/env python3
"""Convenience wrapper — delegates to scripts/qa-for-requirements.py.

Run from repo root:
    python qa-for-requirements.py [options]
    python qa-for-requirements.py --fix
"""
import runpy
import sys

sys.path.insert(0, str(__import__("pathlib").Path(__file__).parent / "scripts"))
runpy.run_path(
    str(__import__("pathlib").Path(__file__).parent / "scripts" / "qa-for-requirements.py"),
    run_name="__main__",
)
