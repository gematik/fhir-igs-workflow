# Fehler 403 - Beispiel für Create-Operation Fehlerantwort - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Fehler 403 - Beispiel für Create-Operation Fehlerantwort**

## Example OperationOutcome: Fehler 403 - Beispiel für Create-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleCreateOperationOutputError",
  "issue" : [{
    "severity" : "error",
    "code" : "forbidden",
    "details" : {
      "coding" : [{
        "code" : "BLOCKED_FLOWTYPE"
      }],
      "text" : "The Flowtype may not be used in the TI-Flow-Fachdienst"
    }
  }]
}

```
