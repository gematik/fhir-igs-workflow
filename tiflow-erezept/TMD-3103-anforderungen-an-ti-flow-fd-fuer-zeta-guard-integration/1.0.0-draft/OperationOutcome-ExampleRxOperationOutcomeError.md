# Example error response for Rx operations - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example error response for Rx operations**

## Example OperationOutcome: Example error response for Rx operations



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleRxOperationOutcomeError",
  "issue" : [{
    "severity" : "error",
    "code" : "conflict",
    "details" : {
      "text" : "Task has invalid status draft"
    },
    "diagnostics" : "Operation requires Task status ready or in-progress"
  }]
}

```
