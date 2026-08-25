# Error 400 - QES nicht valide; Example Activate operation error response - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 400 - QES nicht valide; Example Activate operation error response**

## Example OperationOutcome: Error 400 - QES nicht valide; Example Activate operation error response



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationActivateInvalidRoleError",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/tiflow/CodeSystem/tiflow-operation-outcome-details-cs",
        "code" : "TIFLOW_SIGNATURE_INVALID"
      }]
    }
  }]
}

```
