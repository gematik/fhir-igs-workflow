# Beispiel für Create-Operation Fehlerantwort - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Create-Operation Fehlerantwort**

## Example OperationOutcome: Beispiel für Create-Operation Fehlerantwort

### Issues

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Severity** | **Code** | **Details** | **Diagnostics** |
| * | Error | Invalid Content | FHIR-Validation error | Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: http://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: http://hl7.org/fhir/StructureDefinition/Coding|4.0.1); |



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
