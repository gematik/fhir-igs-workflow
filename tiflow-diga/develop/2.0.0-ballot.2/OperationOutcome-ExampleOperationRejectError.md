# Beispiel für Reject-Operation Fehlerantwort - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Reject-Operation Fehlerantwort**

## Example OperationOutcome: Beispiel für Reject-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationRejectError",
  "issue" : [{
    "severity" : "error",
    "code" : "forbidden",
    "details" : {
      "text" : "Task not in status in progress, is: ready"
    }
  }]
}

```
