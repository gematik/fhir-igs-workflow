# Beispiel Operation Outcome für Rx $activate Operation - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Operation Outcome für Rx $activate Operation**

## Example OperationOutcome: Beispiel Operation Outcome für Rx $activate Operation



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleRxActivateOperationOutcomeError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
        "code" : "SVC_VALIDATION_FAILED"
      }]
    }
  }]
}

```
