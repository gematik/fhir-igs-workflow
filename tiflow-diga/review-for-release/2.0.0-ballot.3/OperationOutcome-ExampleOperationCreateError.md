# Error 400 - Beispiel für Create-Operation Fehlerantwort - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 400 - Beispiel für Create-Operation Fehlerantwort**

## Example OperationOutcome: Error 400 - Beispiel für Create-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCreateError",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
        "code" : "SVC_VALIDATION_FAILED"
      }],
      "text" : "FHIR Profile Validation Failed"
    },
    "diagnostics" : "Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem \nhttps://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: \nhttp://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); \nParameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem \nhttps://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: \nhttp://hl7.org/fhir/StructureDefinition/Coding|4.0.1);"
  }]
}

```
