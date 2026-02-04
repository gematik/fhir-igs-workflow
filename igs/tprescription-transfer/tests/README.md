# StructureMap Test Pipeline

This directory contains a test pipeline for validating FHIR StructureMap transformations for the E-T-Rezept digital carbon copy.

## Overview

The pipeline automates the process of:
1. Creating mapping bundles from individual FHIR resources
2. Transforming bundles using HAPI FHIR with StructureMaps
3. Producing carbon copy outputs for validation
4. Generating comparison reports showing field mappings

## Directory Structure

```
tests/structuremap-pipeline/
├── README.md                  # This file
├── run-all-tests.sh           # Main test runner
├── scripts/                   # Helper scripts
│   ├── build-bundle.py        # Creates mapping bundles from resources
│   ├── transform-bundle.py    # Runs HAPI transformation  
│   ├── compare-mapping.py     # Generates field mapping comparison reports
│   ├── extract-test-case.py   # Helper to extract test cases from bundles
│   └── extract-from-bundle.py # (deprecated) Old extraction helper
├── test-cases/                # Test case directories
│   ├── example-case-01/       # Example test case
│   │   ├── KBV_Bundle.xml
│   │   ├── MedicationDispense_Parameters.xml
│   │   ├── Task.xml
│   │   └── VZDSearchSet.xml
│   └── your-case-02/          # Add more test cases here
└── output/                    # Generated files (per test case)
    └── example-case-01/
        ├── example-case-01-mapping-bundle.json
        ├── example-case-01-digitaler-durchschlag.json
        └── example-case-01-mapping-report.md
```

## Quick Start

### Prerequisites

1. **HAPI FHIR Validator** must be installed at:
   ```
   /Users/gematik/dev/validators/current_hapi_validator.jar
   ```
   Download from: https://github.com/hapifhir/org.hl7.fhir.core/releases

2. **Python 3** must be installed

3. **FHIR Resources must be generated** - Run SUSHI first:
   ```bash
   cd /Users/gematik/dev/FHIR/erp-t-prescription
   sushi
   ```

### Running All Tests

```bash
cd tests/structuremap-pipeline
./run-all-tests.sh
```

To clean output before running:
```bash
./run-all-tests.sh --clean
```

## Creating Test Cases

### Step 1: Create Test Case Directory

Create a new directory under `test-cases/`:

```bash
mkdir test-cases/my-test-case
```

### Step 2: Add FHIR Resource Files

Place the following XML or JSON files in your test case directory:

#### Required Files:

1. **KBV_Bundle.xml** or **KBV_Bundle.json** - KBV eRezept Bundle
   - Profile: `KBV_PR_ERP_Bundle`
   - Type: document
   - Contains: KBV_Prescription (MedicationRequest) and KBV_Medication

2. **MedicationDispense_Parameters.xml** or **MedicationDispense_Parameters.json** - Parameters resource
   - Contains GEM_MedicationDispense and GEM_Medication from workflow
   - Structure: Parameters with `rxDispensation` parameter

3. **Task.xml** or **Task.json** - Task in closed state
   - Profile: `GEM_ERP_PR_Task`
   - Status: completed

4. **VZDSearchSet.xml** or **VZDSearchSet.json** - VZD SearchSet Bundle
   - Contains pharmacy organization data
   - Type: searchset

**Note:** The scripts support both XML and JSON formats. XML files will be automatically parsed and converted to JSON for the mapping bundle.

### Step 3: Run Tests

```bash
./run-all-tests.sh
```

The pipeline will:
- ✓ Build a mapping bundle from your resources → `output/<test-case>/<test-case>-mapping-bundle.json`
- ✓ Transform it using the StructureMap
- ✓ Output the carbon copy result → `output/<test-case>/<test-case>-digitaler-durchschlag.json`

## Manual Usage

### Build a Single Bundle

```bash
python3 scripts/build-bundle.py test-cases/my-test-case output/my-test-case
```

This creates: `output/my-test-case/my-test-case-mapping-bundle.json`

### Transform a Single Bundle

```bash
python3 scripts/transform-bundle.py output/my-test-case/my-test-case-mapping-bundle.json output/my-test-case
```

This creates: `output/my-test-case/my-test-case-digitaler-durchschlag.json`

## Understanding the Files

### scripts/build-bundle.py

Creates a FHIR Bundle (type: collection) containing all resources from a test case directory. The bundle structure matches the format expected by the StructureMap.

**Supported formats:** XML and JSON  
**Input:** Directory with resource files (KBV_Bundle, MedicationDispense_Parameters, Task, VZDSearchSet)  
**Output:** `<test-case-name>-mapping-bundle.json` in specified output directory

**Resource extraction:**
- Extracts MedicationRequest and Medication from KBV_Bundle
- Extracts MedicationDispense and Medication from MedicationDispense_Parameters
- Adds Task and VZD SearchSet directly

### scripts/transform-bundle.py

Runs HAPI FHIR validator with the StructureMap transformation to convert the mapping bundle into a carbon copy format.

**Input:** Mapping bundle JSON  
**Output:** `<test-case-name>-digitaler-durchschlag.json` in specified output directory

Uses the StructureMap:
```
https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapCarbonCopy
```

Command line equivalent:
```bash
java -jar validator.jar <bundle.json> \
  -transform https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapCarbonCopy \
  -version 4.0.1 \
  -ig ./fsh-generated/resources \
  -ig de.gematik.erezept-workflow.r4 \
  -ig kbv.ita.erp \
  -ig de.gematik.fhir.directory \
  -ig de.gematik.ti \
  -output <output.json>
```

### run-all-tests.sh

Main orchestrator that:
1. Finds all test case directories
2. Runs `scripts/build-bundle.py` for each
3. Runs `scripts/transform-bundle.py` for each
4. Reports success/failure summary

### scripts/extract-test-case.py

Helper script to extract resources from an existing mapping bundle and organize them into test case files:
```bash
python3 scripts/extract-test-case.py ../../fsh-generated/resources/Bundle-Mapping-Bundle.json test-cases/new-case/
```

## Output Files

Results are written to the `output/<test-case-name>/` directory:

- `<test-case-name>-mapping-bundle.json` - Generated mapping bundle (type: collection)
- `<test-case-name>-digitaler-durchschlag.json` - Transformed carbon copy (Parameters resource)

## Tips

### Extracting Resources from Examples

You can extract resources from the existing example bundle:

```bash
# View existing examples
ls -la fsh-generated/resources/

# Extract resources to create a new test case
python3 scripts/extract-test-case.py fsh-generated/resources/Bundle-Mapping-Bundle.json test-cases/new-case/
```

### Validating Individual Resources

Before adding to test cases, validate individual resources:

```bash
java -jar /Users/gematik/dev/validators/current_hapi_validator.jar \
  test-cases/my-case/KBV_Prescription.json \
  -ig kbv.ita.erp
```

### Debugging Transformations

Check HAPI output for detailed error messages. The transform script shows both stdout and stderr.

Common issues:
- Missing required IG packages
- Invalid resource profiles
- Missing required fields in resources

## Integration with CI/CD

Add to your GitHub Actions workflow:

```yaml
- name: Run StructureMap Tests
  run: |
    cd tests/structuremap-pipeline
    ./run-all-tests.sh
```

## Examples

The `test-cases/example-case-01/` directory will be populated with example resources that you can use as a template for creating new test cases.

## Understanding Mapping Reports

After each successful transformation, a mapping comparison report is automatically generated at:
```
tests/output/<test-case-name>/<test-case-name>-mapping-report.md
```

### Report Contents

The report provides:

1. **Overall Statistics**
   - Total source fields analyzed
   - Overall mapping coverage percentage
   - Number of mapped/unmapped fields
   - New fields created by transformation

2. **Per-Resource Analysis**
   - Which source fields were successfully mapped
   - Which source fields were not mapped (lost in transformation)
   - Which fields were newly created in the target

3. **Field-Level Details**
   - Expandable sections for mapped, unmapped, and new fields
   - Dot-notation field paths for easy identification
   - Status indicators (✅ Mapped, ⚠️ Not mapped, 🆕 Created)

### Example Report Structure

```markdown
### MedicationRequest
#### Source: `MedicationRequest/abc-123`
**Target:** `rxPrescription.medicationRequest:MedicationRequest`
**Coverage:** 75.0% (30/40 fields mapped)

<details>
<summary>✅ Mapped Fields (30)</summary>
| Field Path | Status |
|------------|--------|
| `status` | ✅ Mapped |
| `intent` | ✅ Mapped |
...
</details>
```

### Using Reports for Validation

- **High unmapped percentage?** Review StructureMap logic for missing mappings
- **Unexpected new fields?** Check transformation rules for unwanted data creation
- **Missing critical fields?** Verify source data contains expected values

### Manual Report Generation

To generate a report for a specific test case manually:

```bash
python3 tests/scripts/compare-mapping.py \
  tests/output/example-case-01 \
  tests/output/example-case-01/custom-report.md
```

## Troubleshooting

### HAPI Validator Not Found

Ensure the validator is at the expected path:
```bash
ls -la /Users/gematik/dev/validators/current_hapi_validator.jar
```

### Transformation Fails

1. Check that SUSHI has been run: `sushi`
2. Verify all required resources are present
3. Check HAPI output for specific validation errors
4. Ensure resource profiles match expected types

### Bundle Creation Issues

- Verify JSON files are valid FHIR resources
- Check that resourceType is set correctly
- Ensure required fields are populated

## Reference

- [FHIR StructureMap](https://www.hl7.org/fhir/structuremap.html)
- [HAPI FHIR Core](https://github.com/hapifhir/org.hl7.fhir.core)
- [Project Documentation](../../input/pagecontent/trezept.md)
