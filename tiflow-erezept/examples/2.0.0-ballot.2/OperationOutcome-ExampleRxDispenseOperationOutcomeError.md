# Beispiel Operation Outcome für Rx $dispense Operation - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Operation Outcome für Rx $dispense Operation**

## Example OperationOutcome: Beispiel Operation Outcome für Rx $dispense Operation



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleRxDispenseOperationOutcomeError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs",
        "code" : "TIFLOW_TASK_STATUS_MISMATCH",
        "display" : "Task status mismatch"
      }],
      "text" : "Task has invalid status."
    }
  }]
}

```
