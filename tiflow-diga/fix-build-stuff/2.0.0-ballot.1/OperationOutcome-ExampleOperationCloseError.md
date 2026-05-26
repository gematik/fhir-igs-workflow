# Beispiel für Close-Operation Fehlerantwort - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Close-Operation Fehlerantwort**

## Example OperationOutcome: Beispiel für Close-Operation Fehlerantwort

### Issues

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Severity** | **Code** | **Details** | **Diagnostics** |
| * | Error | Invalid Content | FHIR-Validation error | MedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are [http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown (from profile: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2); MedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are [http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, [http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown (from profile: http://hl7.org/fhir/StructureDefinition/MedicationDispense|4.0.1); MedicationDispense.status: error: value must match fixed value: "completed" (but is "closed") (from profile: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2); |



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCloseError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "FHIR-Validation error"
    },
    "diagnostics" : "MedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown \n(from profile: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2); \nMedicationDispense.status: error: Value closed not allowed for ValueSet binding, allowed are \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]cancelled, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]completed, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]declined, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]entered-in-error, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]in-progress, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]on-hold, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]preparation, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]stopped, \n[http://terminology.hl7.org/CodeSystem/medicationdispense-status]unknown \n(from profile: http://hl7.org/fhir/StructureDefinition/MedicationDispense|4.0.1); \nMedicationDispense.status: error: value must match fixed value: \"completed\" (but is \"closed\") \n(from profile: https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.2);"
  }]
}

```
