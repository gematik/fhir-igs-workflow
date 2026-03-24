# Example Activate operation error response - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Activate operation error response**

## Example OperationOutcome: Example Activate operation error response



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationActivateError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "unknown or unexpected profile"
    },
    "diagnostics" : "Unable to determine profile type from name: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
  }]
}

```
