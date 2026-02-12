# Beispiel für Close-Operation Fehlerantwort - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Close-Operation Fehlerantwort**

## Example OperationOutcome: Beispiel für Close-Operation Fehlerantwort



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCloseError",
  "issue" : [
    {
      "severity" : "error",
      "code" : "invalid",
      "details" : {
        "text" : "FHIR-Validation error"
      },
      "diagnostics" : "MedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown \n(from profile: https://gematik.de/fhir/erp/StructureDefinition/EFlowRxMedicationDispense|1.2); \nMedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown \n(from profile: http://hl7.org/fhir/StructureDefinition/MedicationDispense|4.0.1); \nMedicationDispense.status: error: value must match fixed value: \"completed\" (but is \"closed\") \n(from profile: https://gematik.de/fhir/erp/StructureDefinition/EFlowRxMedicationDispense|1.2);"
    }
  ]
}

```
