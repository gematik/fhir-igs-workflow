# Beispiel für Abort-Operation Fehlerantwort (PVS) - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Abort-Operation Fehlerantwort (PVS)**

## Example OperationOutcome: Beispiel für Abort-Operation Fehlerantwort (PVS)



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAbortErrorPVS",
  "issue" : [{
    "severity" : "error",
    "code" : "forbidden",
    "details" : {
      "text" : "Task must not be in progress for users other than pharmacy, but is: in-progress"
    }
  }]
}

```
