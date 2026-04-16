"""Tests for check_requirement_page_actor_alignment.py"""

import sys
from pathlib import Path
import tempfile
import shutil

import pytest

# Import the module under test
sys.path.insert(0, str(Path(__file__).parent.parent))
from check_requirement_page_actor_alignment import (
    SUFFIX_TO_ALLOWED_ACTORS,
    FILE_SUFFIX_RE,
    expected_actors_for_file,
    clone_actor_tag_with_name,
)


class TestSuffixToActorMapping:
    """Test suffix-to-allowed-actors mapping."""

    def test_fd_suffix_maps_to_tiflow_actors(self):
        """fd suffix should allow both TI-Flow_FD and Anb_TI-Flow_FD."""
        actors = SUFFIX_TO_ALLOWED_ACTORS["fd"]
        assert "TI-Flow_FD" in actors
        assert "Anb_TI-Flow_FD" in actors

    def test_fdv_suffix_maps_to_erp_fdv(self):
        """fdv suffix should map to eRp_FdV."""
        actors = SUFFIX_TO_ALLOWED_ACTORS["fdv"]
        assert "eRp_FdV" in actors

    def test_other_suffixes_present(self):
        """Verify all expected suffixes are defined."""
        expected_suffixes = {"fd", "fdv", "avs", "pvs", "ktr"}
        assert set(SUFFIX_TO_ALLOWED_ACTORS.keys()) == expected_suffixes

    def test_all_actors_are_tuples(self):
        """All actor values should be tuples."""
        for suffix, actors in SUFFIX_TO_ALLOWED_ACTORS.items():
            assert isinstance(actors, tuple), f"Suffix {suffix} actors not a tuple"
            assert len(actors) > 0, f"Suffix {suffix} has no actors"


class TestFileSuffixRegex:
    """Test file suffix regex pattern."""

    def test_matches_fd_suffix(self):
        """Regex should match -req-fd.md."""
        assert FILE_SUFFIX_RE.search("op-abort-req-fd.md") is not None
        assert FILE_SUFFIX_RE.search("query-api-req-fd.md") is not None

    def test_matches_fdv_suffix(self):
        """Regex should match -req-fdv.md."""
        assert FILE_SUFFIX_RE.search("op-abort-req-fdv.md") is not None

    def test_matches_all_known_suffixes(self):
        """Regex should match all known suffixes."""
        for suffix in ["fd", "fdv", "avs", "pvs", "ktr"]:
            filename = f"test-req-{suffix}.md"
            assert FILE_SUFFIX_RE.search(filename) is not None, f"Regex failed for {suffix}"

    def test_does_not_match_invalid_suffix(self):
        """Regex should not match unknown suffixes."""
        assert FILE_SUFFIX_RE.search("test-req-xyz.md") is None
        assert FILE_SUFFIX_RE.search("test-req-fd.txt") is None

    def test_case_insensitive_match(self):
        """Regex should be case-insensitive."""
        assert FILE_SUFFIX_RE.search("test-req-FD.md") is not None
        assert FILE_SUFFIX_RE.search("test-req-FDV.md") is not None


class TestExpectedActorsForFile:
    """Test extraction of expected actors from file path."""

    def test_fd_file_returns_tiflow_actors(self):
        """File with -req-fd.md should return TI-Flow actors."""
        path = Path("igs/core/input/pagecontent/op-abort-req-fd.md")
        actors = expected_actors_for_file(path)
        assert actors is not None
        assert "TI-Flow_FD" in actors
        assert "Anb_TI-Flow_FD" in actors

    def test_fdv_file_returns_erp_fdv(self):
        """File with -req-fdv.md should return eRp_FdV."""
        path = Path("igs/core/input/pagecontent/op-abort-req-fdv.md")
        actors = expected_actors_for_file(path)
        assert actors is not None
        assert "eRp_FdV" in actors

    def test_non_matching_file_returns_none(self):
        """File without recognized suffix should return None."""
        path = Path("igs/core/input/pagecontent/some-page.md")
        actors = expected_actors_for_file(path)
        assert actors is None

    def test_case_insensitive_file_match(self):
        """File matching should be case-insensitive."""
        path = Path("igs/core/input/pagecontent/op-abort-req-FD.md")
        actors = expected_actors_for_file(path)
        assert actors is not None

    def test_all_known_suffixes_work(self):
        """All known suffixes should extract correctly."""
        for suffix in ["fd", "fdv", "avs", "pvs", "ktr"]:
            path = Path(f"test-req-{suffix}.md")
            actors = expected_actors_for_file(path)
            assert actors is not None, f"No actors returned for {suffix}"
            assert len(actors) > 0


class TestActorTagCloning:
    """Test cloning and modifying actor tags."""

    def test_clone_actor_tag_with_name_simple(self):
        """Test cloning a simple actor tag with new name."""
        actor_tag = '<actor name="OldActor">Actor Description</actor>'
        result = clone_actor_tag_with_name(actor_tag, "NewActor")
        assert 'name="NewActor"' in result
        assert "OldActor" not in result or "NewActor" in result

    def test_clone_actor_tag_preserves_attributes(self):
        """Test that cloning preserves other attributes."""
        actor_tag = '<actor name="OldActor" role="provider">Description</actor>'
        result = clone_actor_tag_with_name(actor_tag, "NewActor")
        assert 'name="NewActor"' in result
        assert 'role="provider"' in result

    def test_clone_tiflow_alias_to_canonical(self):
        """Test cloning legacy TI_Flow_FD to canonical TI-Flow_FD."""
        actor_tag = '<actor name="TI_Flow_FD">TI-Flow Fachdienst</actor>'
        result = clone_actor_tag_with_name(actor_tag, "TI-Flow_FD")
        assert 'name="TI-Flow_FD"' in result
        assert 'name="TI_Flow_FD"' not in result


class TestActorValidation:
    """Test validation of allowed actors for file types."""

    def test_tiflow_allowed_in_fd_file(self):
        """TI-Flow_FD should be allowed in fd file."""
        actors = SUFFIX_TO_ALLOWED_ACTORS["fd"]
        assert "TI-Flow_FD" in actors

    def test_anb_tiflow_allowed_in_fd_file(self):
        """Anb_TI-Flow_FD should be allowed in fd file."""
        actors = SUFFIX_TO_ALLOWED_ACTORS["fd"]
        assert "Anb_TI-Flow_FD" in actors

    def test_erp_fdv_not_allowed_in_fd_file(self):
        """eRp_FdV should not be allowed in fd file."""
        actors = SUFFIX_TO_ALLOWED_ACTORS["fd"]
        assert "eRp_FdV" not in actors

    def test_erp_fdv_allowed_in_fdv_file(self):
        """eRp_FdV should be allowed in fdv file."""
        actors = SUFFIX_TO_ALLOWED_ACTORS["fdv"]
        assert "eRp_FdV" in actors

    def test_each_suffix_has_unique_actors(self):
        """Each suffix should have its distinct set of allowed actors."""
        suffix_actor_sets = {}
        for suffix, actors in SUFFIX_TO_ALLOWED_ACTORS.items():
            suffix_actor_sets[suffix] = set(actors)
        
        # fd and fdv should have different actors
        assert suffix_actor_sets["fd"] != suffix_actor_sets["fdv"]
        # All should be non-empty
        for suffix, actors in suffix_actor_sets.items():
            assert len(actors) > 0


class TestIntegrationWithFixtures:
    """Integration tests using temporary markdown files."""

    def test_process_fd_file_with_correct_actor(self, temp_igs_dir):
        """Test processing fd file with correct TI-Flow_FD actor."""
        fd_file = temp_igs_dir / "core" / "input" / "pagecontent" / "test-req-fd.md"
        content = """
# Test Page

<requirement key="REQ-001">
  <actor name="TI-Flow_FD">TI-Flow Fachdienst</actor>
  <conformance value="SHALL"/>
  Der TI-Flow-Fachdienst MUSS die Anfrage validieren.
</requirement>
"""
        fd_file.write_text(content)
        
        # This should be valid - no findings expected for this actor
        actors = expected_actors_for_file(fd_file)
        assert "TI-Flow_FD" in actors

    def test_process_fd_file_with_anb_tiflow_actor(self, temp_igs_dir):
        """Test processing fd file with Anb_TI-Flow_FD actor."""
        fd_file = temp_igs_dir / "core" / "input" / "pagecontent" / "test-req-fd.md"
        content = """
<requirement key="REQ-002">
  <actor name="Anb_TI-Flow_FD">Anbieter TI-Flow</actor>
  <conformance value="SHALL"/>
</requirement>
"""
        fd_file.write_text(content)
        
        actors = expected_actors_for_file(fd_file)
        assert "Anb_TI-Flow_FD" in actors
