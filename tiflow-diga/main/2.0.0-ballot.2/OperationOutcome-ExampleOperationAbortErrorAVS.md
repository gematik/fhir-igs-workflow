# Beispiel für Abort-Operation Fehlerantwort (AVS) - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

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
