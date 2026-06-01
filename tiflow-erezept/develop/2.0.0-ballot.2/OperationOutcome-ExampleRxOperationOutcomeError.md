# Example error response for Rx operations - TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

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
