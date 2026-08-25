# Error 400 - Beispiel für Close-Operation Fehlerantwort - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 400 - Beispiel für Close-Operation Fehlerantwort**

## Example OperationOutcome: Error 400 - Beispiel für Close-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCloseError",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
        "code" : "SVC_VALIDATION_FAILED"
      }],
      "text" : "FHIR Profile Validation Failed"
    }
  }]
}

```
