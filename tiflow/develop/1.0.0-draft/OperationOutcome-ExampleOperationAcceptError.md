# Beispiel für Accept-Operation Fehlerantwort - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Accept-Operation Fehlerantwort**

## Example OperationOutcome: Beispiel für Accept-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAcceptError",
  "issue" : [{
    "severity" : "error",
    "code" : "conflict",
    "details" : {
      "text" : "Task has invalid status draft"
    }
  }]
}

```
