# Beispiel BfArM MedicationDispense - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel BfArM MedicationDispense**

## Example MedicationDispense: Beispiel BfArM MedicationDispense

Profile: [E-T-Rezept Medication Dispense](StructureDefinition-erp-tprescription-medication-dispense.md)

**status**: Completed

**medication**: [Medication 19201712](Medication-ExampleMedication2-Pomalidomid-T.md)

### Performers

| | |
| :--- | :--- |
| - | **Actor** |
| * | Identifier:`https://gematik.de/fhir/sid/telematik-id`/3-07.2.1234560000.10.789 |

**quantity**: 10 Tablette

**whenHandedOver**: 2026-04-02

### DosageInstructions

| | |
| :--- | :--- |
| - | **Text** |
| * | 1-1-1-1 nach Bedarf |



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "ExampleMedicationDispense-T",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-medication-dispense"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/ExampleMedication2-Pomalidomid-T"
  },
  "performer" : [{
    "actor" : {
      "identifier" : {
        "system" : "https://gematik.de/fhir/sid/telematik-id",
        "value" : "3-07.2.1234560000.10.789"
      }
    }
  }],
  "quantity" : {
    "value" : 10,
    "unit" : "Tablette"
  },
  "whenHandedOver" : "2026-04-02",
  "dosageInstruction" : [{
    "text" : "1-1-1-1 nach Bedarf"
  }]
}

```
