# Beispiel für Abort-Operation Fehlerantwort (AVS) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

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
