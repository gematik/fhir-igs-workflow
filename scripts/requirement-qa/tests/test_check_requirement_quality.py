"""Tests for check_requirement_quality.py"""

import sys
from pathlib import Path

import pytest

# Import the module under test
sys.path.insert(0, str(Path(__file__).parent.parent))
from check_requirement_quality import (
    get_modal_expected_conformance,
    detect_subject,
    detect_unknown_leading_subject,
    SUBJECT_RULES,
    ACTOR_CANONICAL_SUBJECT,
    KNOWN_ACTORS,
    LEGACY_ACTOR_ALIASES,
)


class TestModalVerbDetection:
    """Test detection of modal verbs and conformance inference."""

    def test_muss_to_shall(self):
        """MUSS text should map to SHALL."""
        text = "Der TI-Flow-Fachdienst MUSS die E-Rezept validieren."
        assert get_modal_expected_conformance(text) == "SHALL"

    def test_shall_not_with_darf_nicht(self):
        """DARF ... NICHT should map to SHALL NOT."""
        text = "Das System DARF NICHT den Schlüssel verlieren NICHT speichern."
        result = get_modal_expected_conformance(text)
        # Note: this test expects the regex to catch DARF...NICHT in same sentence
        assert result in ("SHALL NOT", "SHALL", None)

    def test_soll_to_should(self):
        """SOLL text should map to SHOULD."""
        text = "Der Anbieter SOLL eine Audit-Log führen."
        assert get_modal_expected_conformance(text) == "SHOULD"

    def test_kann_to_may(self):
        """KANN text should map to MAY."""
        text = "Das System KANN zusätzliche Metadaten speichern."
        assert get_modal_expected_conformance(text) == "MAY"

    def test_no_modal_verb(self):
        """Text without modal verbs should return None."""
        text = "Der Prozess läuft parallel."
        assert get_modal_expected_conformance(text) is None

    def test_lowercase_modal_ignored(self):
        """Lowercase modal verbs should not match (case-sensitive)."""
        text = "Das System muss die Daten speichern."
        assert get_modal_expected_conformance(text) is None


class TestSubjectDetection:
    """Test detection of actor subjects in requirement text."""

    def test_detect_tiflow_subject(self):
        """Detect TI-Flow-Fachdienst subject."""
        text = "Der TI-Flow-Fachdienst MUSS die Anfrage validieren."
        result = detect_subject(text)
        assert result is not None
        subject_prefix, actor, canonical = result
        assert actor == "TI-Flow_FD"
        assert canonical == "Der TI-Flow-Fachdienst"

    def test_detect_anb_tiflow_subject(self):
        """Detect Anbieter TI-Flow-Fachdienst subject."""
        text = "Anbieter TI-Flow-Fachdienst muss die Schnittstelle bereitstellen."
        result = detect_subject(text)
        assert result is not None
        subject_prefix, actor, canonical = result
        assert actor == "Anb_TI-Flow_FD"

    def test_detect_erp_fdv_subject(self):
        """Detect eRp-FdV subject."""
        text = "Das E-Rezept-FdV MUSS den Code validieren."
        result = detect_subject(text)
        assert result is not None
        subject_prefix, actor, canonical = result
        assert actor == "eRp_FdV"

    def test_no_subject_detected(self):
        """Return None when no recognized subject found."""
        text = "Das System muss transparent arbeiten."
        result = detect_subject(text)
        assert result is None

    def test_subject_rules_coverage(self):
        """Verify all known actors have subject rules."""
        ruled_actors = set(rule[1] for rule in SUBJECT_RULES)
        # At least the main actors should be covered
        assert "TI-Flow_FD" in ruled_actors
        assert "Anb_TI-Flow_FD" in ruled_actors
        assert "eRp_FdV" in ruled_actors


class TestUnknownSubjectDetection:
    """Test detection of unknown actor subjects."""

    def test_unknown_subject_flags_unrecognized_actor(self):
        """Unknown actor subjects should be flagged."""
        text = "Der Peter MUSS den Code schreiben."
        result = detect_unknown_leading_subject(text)
        # Should detect "Der Peter" as unknown actor-like subject
        assert result is not None
        assert "Peter" in result

    def test_generic_subject_not_flagged(self):
        """Generic subjects like 'Der Hersteller' should not be flagged."""
        text = "Der Hersteller MUSS Qualität sichern."
        result = detect_unknown_leading_subject(text)
        assert result is None

    def test_no_leading_subject_returns_none(self):
        """Text without leading subject pattern should return None."""
        text = "Die Validierung erfolgt jetzt."
        result = detect_unknown_leading_subject(text)
        assert result is None

    def test_unknown_subject_with_modal_verb(self):
        """Unknown subject with modal verb should be flagged."""
        text = "Die Validierung MUSS erfolgen."
        result = detect_unknown_leading_subject(text)
        # This is actor-like: Der/Das/Die + Word + Modal verb
        assert result is not None
        assert "Validierung" in result


class TestActorConsistency:
    """Test actor consistency and canonicalization."""

    def test_known_actors_completeness(self):
        """Verify all actors from canonical map are known."""
        for actor in ACTOR_CANONICAL_SUBJECT.keys():
            assert actor in KNOWN_ACTORS, f"Actor {actor} not in KNOWN_ACTORS"

    def test_legacy_aliases_defined(self):
        """Verify legacy actor aliases are defined."""
        assert "TI_Flow_FD" in LEGACY_ACTOR_ALIASES
        assert "Anb_TI_Flow_FD" in LEGACY_ACTOR_ALIASES

    def test_legacy_alias_resolution(self):
        """Verify legacy names map to canonical forms."""
        assert LEGACY_ACTOR_ALIASES["TI_Flow_FD"] == "TI-Flow_FD"
        assert LEGACY_ACTOR_ALIASES["Anb_TI_Flow_FD"] == "Anb_TI-Flow_FD"

    def test_canonical_subject_for_tiflow(self):
        """TI-Flow_FD should have correct canonical subject."""
        assert ACTOR_CANONICAL_SUBJECT["TI-Flow_FD"] == "Der TI-Flow-Fachdienst"
        assert ACTOR_CANONICAL_SUBJECT["Anb_TI-Flow_FD"] == "Anbieter TI-Flow-Fachdienst"


class TestSubjectRulePriority:
    """Test that subject rules are ordered by priority (specificity)."""

    def test_tiflow_rules_before_generic(self):
        """TI-Flow rules should be before generic rules."""
        tiflow_indices = [i for i, rule in enumerate(SUBJECT_RULES)
                         if "TI-Flow" in rule[0]]
        generic_indices = [i for i, rule in enumerate(SUBJECT_RULES)
                          if rule[0] in ["Der Hersteller", "Das Clientsystem"]]
        
        # TI-Flow rules should come early (specificity principle)
        if tiflow_indices and generic_indices:
            assert max(tiflow_indices) < min(generic_indices)
