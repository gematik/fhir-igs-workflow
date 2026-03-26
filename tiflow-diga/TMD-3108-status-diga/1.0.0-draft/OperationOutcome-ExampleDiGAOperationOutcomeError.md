# Example error response for DiGA operations - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

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
