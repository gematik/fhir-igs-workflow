# Error 409 - Beispiel für Accept-Operation Fehlerantwort - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 409 - Beispiel für Accept-Operation Fehlerantwort**

## Example OperationOutcome: Error 409 - Beispiel für Accept-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAcceptError",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/tiflow/CodeSystem/tiflow-operation-outcome-details-cs",
        "code" : "TIFLOW_TASK_STATUS_MISMATCH"
      }],
      "text" : "Task has invalid status draft"
    }
  }]
}

```
