# Rx MedicationDispense example - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Rx MedicationDispense example**

## Example MedicationDispense: Rx MedicationDispense example



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "ExampleRxMedicationDispense",
  "status" : "completed",
  "medicationCodeableConcept" : {
    "text" : "Sumatriptan 50 mg"
  },
  "subject" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789"
    }
  },
  "whenHandedOver" : "2026-03-20T11:10:00+01:00"
}

```
