#!/bin/bash
#
# StructureMap Test Pipeline
# 
# This script runs the complete test pipeline for StructureMap transformations:
# 1. Finds all test case directories
# 2. Builds mapping bundles from individual resources
# 3. Transforms bundles using HAPI FHIR StructureMaps
# 4. Reports results
#
# Usage:
#   ./run-all-tests.sh [--clean] [--sushi] [--single]
#
# Options:
#   --clean    Remove all output files before running tests (default behavior)
#   --sushi    Run `sushi .` at the workspace root before executing the pipeline
#   --single   Only execute the first detected test case (useful for quick iterations)
#

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEST_CASES_DIR="$SCRIPT_DIR/test-cases"
OUTPUT_DIR="$SCRIPT_DIR/output"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"
INCLUDES_DIR="$PROJECT_ROOT/input/includes"

# Feature toggles
VALIDATE_CARBON_COPY="${VALIDATE_CARBON_COPY:-true}" # Set to 'true' to validate and 'false' to skip validation step
RUN_SUSHI=false
RUN_SINGLE=false
PERFORM_CLEAN=true

# Parse CLI arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --clean)
            PERFORM_CLEAN=true
            ;;
        --sushi)
            RUN_SUSHI=true
            ;;
        --single)
            RUN_SINGLE=true
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Usage: ./run-all-tests.sh [--clean] [--sushi] [--single]"
            exit 1
            ;;
    esac
    shift
done

# Scripts
BUILD_SCRIPT="$SCRIPTS_DIR/build-bundle.py"
TRANSFORM_SCRIPT="$SCRIPTS_DIR/transform-bundle.py"
ADD_SIGNATURE_SCRIPT="$SCRIPTS_DIR/add-prescription-signature-date.py"

# Counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0
VALIDATION_FAILURES=()
VALIDATION_SUMMARY_FILE="$OUTPUT_DIR/validation-summary.json"

if [[ "$PERFORM_CLEAN" == "true" ]]; then
    echo -e "${YELLOW}🧹 Cleaning output directory...${NC}"
    rm -rf "$OUTPUT_DIR"
    echo -e "${GREEN}✓ Output directory cleaned${NC}\n"
fi

# Create output directories
mkdir -p "$OUTPUT_DIR"

if [[ "$RUN_SUSHI" == "true" ]]; then
    echo -e "${YELLOW}🔄 Running SUSHI before executing tests...${NC}"
    if (cd "$PROJECT_ROOT" && sushi .); then
        echo -e "${GREEN}✓ SUSHI completed successfully${NC}\n"
    else
        echo -e "${RED}✗ SUSHI execution failed${NC}"
        exit 1
    fi
fi

echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   StructureMap Test Pipeline                  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

# Check if test cases directory exists
if [[ ! -d "$TEST_CASES_DIR" ]]; then
    echo -e "${RED}❌ Test cases directory not found: $TEST_CASES_DIR${NC}"
    exit 1
fi

# Find all test case directories
TEST_CASES=($(find "$TEST_CASES_DIR" -mindepth 1 -maxdepth 1 -type d | sort))

if [[ "$RUN_SINGLE" == "true" && ${#TEST_CASES[@]} -gt 1 ]]; then
    TEST_CASES=("${TEST_CASES[0]}")
fi

if [[ ${#TEST_CASES[@]} -eq 0 ]]; then
    echo -e "${YELLOW}⚠ No test cases found in: $TEST_CASES_DIR${NC}"
    echo -e "${YELLOW}  Create test case directories with FHIR resource JSON files.${NC}"
    exit 0
fi

echo -e "${BLUE}Found ${#TEST_CASES[@]} test case(s)${NC}\n"

BUILT_TEST_CASES=()

echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Phase 1: Build Mapping Bundles               ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

for test_case_path in "${TEST_CASES[@]}"; do
    test_case_name=$(basename "$test_case_path")
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}Test Case: $test_case_name${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    test_output_dir="$OUTPUT_DIR/$test_case_name"
    mkdir -p "$test_output_dir"

    bundle_file="$test_output_dir/${test_case_name}-mapping-bundle.json"

    echo -e "${YELLOW}[1/3] Building mapping bundle...${NC}"
    if python3 "$BUILD_SCRIPT" "$test_case_path" "$test_output_dir"; then
        echo -e "${GREEN}✓ Bundle created: $bundle_file${NC}\n"
        BUILT_TEST_CASES+=("$test_case_path")
    else
        echo -e "${RED}✗ Bundle creation failed${NC}\n"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
done

echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Phase 2: Transform Bundles                   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

for test_case_path in "${BUILT_TEST_CASES[@]}"; do
    test_case_name=$(basename "$test_case_path")

    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}Test Case: $test_case_name${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    test_output_dir="$OUTPUT_DIR/$test_case_name"
    bundle_file="$test_output_dir/${test_case_name}-mapping-bundle.json"
    result_file="$test_output_dir/${test_case_name}-digitaler-durchschlag.json"

    echo -e "${YELLOW}[2/3] Transforming with StructureMap...${NC}"
    if python3 "$TRANSFORM_SCRIPT" "$bundle_file" "$test_output_dir"; then
        echo -e "${GREEN}✓ Transformation successful: $result_file${NC}"

        if python3 "$ADD_SIGNATURE_SCRIPT" "$result_file"; then
            echo -e "${GREEN}✓ Injected prescription signature date${NC}"
        else
            echo -e "${RED}✗ Failed to inject prescription signature date${NC}"
            exit 1
        fi

        echo -e "\n${YELLOW}[3/3] Generating mapping comparison report...${NC}"

        mkdir -p "$INCLUDES_DIR"
        report_file="$INCLUDES_DIR/${test_case_name}-mapping-report.md"
        if python3 "$SCRIPTS_DIR/compare-mapping.py" "$test_output_dir" "$report_file"; then
            echo -e "${GREEN}✓ Report generated: $report_file${NC}"
        else
            echo -e "${YELLOW}⚠ Report generation failed (non-critical)${NC}"
        fi

        PASSED_TESTS=$((PASSED_TESTS + 1))
    else
        echo -e "${RED}✗ Transformation failed${NC}"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi

    echo ""
done

# Batch validation (optional)
if [[ "$VALIDATE_CARBON_COPY" == "true" ]]; then
    echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║   Batch Validation (HAPI)                      ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

    VALIDATION_INPUTS=()
    for test_case_path in "${TEST_CASES[@]}"; do
        test_case_name=$(basename "$test_case_path")
        result_file="$OUTPUT_DIR/$test_case_name/${test_case_name}-digitaler-durchschlag.json"
        if [[ -f "$result_file" ]]; then
            VALIDATION_INPUTS+=("$result_file")
        fi
    done

    if [[ ${#VALIDATION_INPUTS[@]} -eq 0 ]]; then
        echo -e "${YELLOW}⚠ No transformation outputs found to validate${NC}\n"
    else
        echo -e "${YELLOW}Validating ${#VALIDATION_INPUTS[@]} digitaler-durchschlag file(s) in one call...${NC}"
        # validate-carbon-copy.py will exit non-zero if any file fails.
        if python3 "$SCRIPTS_DIR/validate-carbon-copy.py" "${VALIDATION_INPUTS[@]}" --summary-json "$VALIDATION_SUMMARY_FILE"; then
            echo -e "${GREEN}✓ Batch validation successful${NC}\n"
        else
            echo -e "${RED}✗ Batch validation found failures${NC}\n"
        fi
    fi
else
    echo -e "${YELLOW}⚠ Validation skipped (VALIDATE_CARBON_COPY=false)${NC}\n"
fi

# Markdown results table
echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Markdown Results Table                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

python3 "$SCRIPTS_DIR/report-test-results.py" \
  --test-cases-dir "$TEST_CASES_DIR" \
  --output-dir "$OUTPUT_DIR" \
    --validation-summary "$VALIDATION_SUMMARY_FILE" | tee "$SCRIPT_DIR/test_result.md"

echo ""

# Copy all JSON files to fsh-generated/resources (flat structure)
echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Copying JSON files to fsh-generated         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

FSH_RESOURCES_DIR="$PROJECT_ROOT/fsh-generated/resources"
mkdir -p "$FSH_RESOURCES_DIR"

# Find all JSON files in output directory and copy them flat
find "$OUTPUT_DIR" -name "*.json" -type f | while read -r json_file; do
    filename=$(basename "$json_file")
    cp "$json_file" "$FSH_RESOURCES_DIR/$filename"
    echo -e "${GREEN}✓ Copied: $filename${NC}"
done

echo -e "\n${GREEN}✓ All JSON files copied to fsh-generated/resources${NC}\n"

if [[ "$VALIDATE_CARBON_COPY" == "true" && ${#VALIDATION_FAILURES[@]} -gt 0 ]]; then
    echo -e "${RED}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║   Validation Failures Detected                 ║${NC}"
    echo -e "${RED}╚════════════════════════════════════════════════╝${NC}"
    for case_name in "${VALIDATION_FAILURES[@]}"; do
        echo -e "${RED}  • ${case_name}${NC}"
    done
    echo -e "${RED}\nValidation failures detected; pipeline will exit with error after summary.${NC}"
fi

# Print summary
echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Test Results Summary                         ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}\n"

echo -e "Total test cases:  $TOTAL_TESTS"
echo -e "${GREEN}Passed:            $PASSED_TESTS${NC}"
echo -e "${RED}Failed:            $FAILED_TESTS${NC}\n"

if [[ $FAILED_TESTS -eq 0 ]]; then
    echo -e "${GREEN}✅ All tests passed!${NC}\n"
    exit 0
else
    echo -e "${RED}❌ Some tests failed!${NC}\n"
    exit 1
fi
