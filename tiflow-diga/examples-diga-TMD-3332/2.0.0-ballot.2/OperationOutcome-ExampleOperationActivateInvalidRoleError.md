# Error 400 - QES nicht durch berechtigte Berufsgruppe; Example Activate operation error response - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 400 - QES nicht durch berechtigte Berufsgruppe; Example Activate operation error response**

## Example OperationOutcome: Error 400 - QES nicht durch berechtigte Berufsgruppe; Example Activate operation error response



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationActivateInvalidRoleError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "code" : "TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE"
      }]
    }
  }]
}

```
