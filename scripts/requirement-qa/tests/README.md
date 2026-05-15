# Requirement QA Tests

Unit tests for requirement quality assurance scripts:
- `check_requirement_quality.py`
- `check_requirement_page_actor_alignment.py`

## Running Tests

### Run all tests
```bash
cd scripts/requirement-qa
pytest
```

### Run specific test file
```bash
pytest tests/test_check_requirement_quality.py
pytest tests/test_check_requirement_page_actor_alignment.py
```

### Run specific test class or function
```bash
pytest tests/test_check_requirement_quality.py::TestModalVerbDetection
pytest tests/test_check_requirement_quality.py::TestModalVerbDetection::test_muss_to_shall
```

### Run with verbose output
```bash
pytest -v
```

### Run with coverage report
```bash
pip install pytest-cov
pytest --cov=. --cov-report=html
```

## Test Coverage

### test_check_requirement_quality.py

- **TestModalVerbDetection**: Tests detection of MUSS/SOLL/KANN modal verbs and conformance inference
- **TestSubjectDetection**: Tests detection of actor subjects (Der TI-Flow-Fachdienst, etc.)
- **TestUnknownSubjectDetection**: Tests detection of unknown/invalid actor subjects
- **TestActorConsistency**: Tests actor consistency, canonicalization, and legacy aliases
- **TestSubjectRulePriority**: Tests that subject detection rules are properly ordered by specificity

### test_check_requirement_page_actor_alignment.py

- **TestSuffixToActorMapping**: Tests mapping of file suffixes (-req-fd.md, etc.) to allowed actors
- **TestFileSuffixRegex**: Tests the regex pattern for file suffix detection
- **TestExpectedActorsForFile**: Tests extraction of expected actors from file paths
- **TestActorTagCloning**: Tests cloning and modification of actor tags
- **TestActorValidation**: Tests validation rules for allowed actors per file type
- **TestIntegrationWithFixtures**: Integration tests using temporary markdown files

## Key Features

- Tests cover both positive and negative cases
- Validates TI-Flow actor renaming (TI_Flow_FD → TI-Flow_FD, Anb_TI_Flow_FD → Anb_TI-Flow_FD)
- Covers modal verb detection and conformance mapping
- Tests actor consistency across requirement pages
- Integration tests with temporary file structures

## Development Notes

- Tests use pytest fixtures for reproducible test environments
- Temporary directories are automatically cleaned up
- Tests are isolated and can run in any order
- Add new tests to relevant Test* classes or create new Test* classes for new features
