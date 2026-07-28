# Beispiel für Accept-Operation Fehlerantwort - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

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
