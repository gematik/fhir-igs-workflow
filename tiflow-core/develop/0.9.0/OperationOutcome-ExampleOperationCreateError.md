# Beispiel für Create-Operation Fehlerantwort - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Create-Operation Fehlerantwort**

## Example OperationOutcome: Beispiel für Create-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCreateError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "FHIR-Validation error"
    },
    "diagnostics" : "Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem \nhttps://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: \nhttp://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); \nParameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem \nhttps://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: \nhttp://hl7.org/fhir/StructureDefinition/Coding|4.0.1);"
  }]
}

```
