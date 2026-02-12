# Example Activate operation error response - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Activate operation error response**

## Example OperationOutcome: Example Activate operation error response



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationActivateError",
  "issue" : [
    {
      "severity" : "error",
      "code" : "invalid",
      "details" : {
        "text" : "unknown or unexpected profile"
      },
      "diagnostics" : "Unable to determine profile type from name: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
    }
  ]
}

```
