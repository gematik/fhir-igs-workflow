"""Entry point: python -m error_code_consistency [args]"""
import sys

from .cli import main

if __name__ == "__main__":
    sys.exit(main())
