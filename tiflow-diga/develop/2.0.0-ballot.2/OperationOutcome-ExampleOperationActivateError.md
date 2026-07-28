# Example Activate operation error response - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Activate operation error response**

## Example OperationOutcome: Example Activate operation error response



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationActivateError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "unknown or unexpected profile"
    },
    "diagnostics" : "Unable to determine profile type from name: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"
  }]
}

```
