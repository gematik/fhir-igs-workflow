# Beispiel für Abort-Operation Fehlerantwort (PVS) - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Abort-Operation Fehlerantwort (PVS)**

## Example OperationOutcome: Beispiel für Abort-Operation Fehlerantwort (PVS)



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAbortErrorPVS",
  "issue" : [
    {
      "severity" : "error",
      "code" : "forbidden",
      "details" : {
        "text" : "Task must not be in progress for users other than pharmacy, but is: in-progress"
      }
    }
  ]
}

```
