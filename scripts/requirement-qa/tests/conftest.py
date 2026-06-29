"""Pytest fixtures and configuration for requirement QA tests."""

import sys
from pathlib import Path
import tempfile
import shutil
import pytest


# Add parent directory to path so we can import the QA scripts
sys.path.insert(0, str(Path(__file__).parent.parent))


@pytest.fixture
def temp_igs_dir():
    """Create a temporary IGs directory structure for testing."""
    tmpdir = Path(tempfile.mkdtemp())
    
    # Create typical IG structure
    for ig_name in ["core", "bfarm", "diga"]:
        ig_dir = tmpdir / ig_name / "input" / "pagecontent"
        ig_dir.mkdir(parents=True, exist_ok=True)
    
    yield tmpdir
    
    # Cleanup
    shutil.rmtree(tmpdir, ignore_errors=True)


@pytest.fixture
def fixtures_dir():
    """Return path to fixtures directory."""
    return Path(__file__).parent / "fixtures"
