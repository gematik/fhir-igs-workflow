# Beispiel für Abort-Operation Fehlerantwort (AVS) - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Abort-Operation Fehlerantwort (AVS)**

## Example OperationOutcome: Beispiel für Abort-Operation Fehlerantwort (AVS)



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAbortErrorAVS",
  "issue" : [{
    "severity" : "error",
    "code" : "forbidden",
    "details" : {
      "text" : "Abort not expected for newly created Task"
    }
  }]
}

```
