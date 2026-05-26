# Example error response for DiGA operations - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example error response for DiGA operations**

## Example OperationOutcome: Example error response for DiGA operations

### Issues

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Severity** | **Code** | **Details** | **Diagnostics** |
| * | Error | Invalid Content | Task has invalid status for requested operation | Expected status ready but found completed |



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleDiGAOperationOutcomeError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "Task has invalid status for requested operation"
    },
    "diagnostics" : "Expected status ready but found completed"
  }]
}

```
