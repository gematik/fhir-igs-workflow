# Beispiel für Accept-Operation Fehlerantwort - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

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
