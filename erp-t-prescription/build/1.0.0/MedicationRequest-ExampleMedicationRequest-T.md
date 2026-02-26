# Beispiel BfArM MedicationRequest - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel BfArM MedicationRequest**

## Example MedicationRequest: Beispiel BfArM MedicationRequest



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "ExampleMedicationRequest-T",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-request"]
  },
  "extension" : [{
    "extension" : [{
      "url" : "off-label",
      "valueBoolean" : true
    },
    {
      "url" : "childbearing-potential",
      "valueBoolean" : true
    },
    {
      "url" : "security-compliance",
      "valueBoolean" : false
    },
    {
      "url" : "hand-out-information-material",
      "valueBoolean" : false
    },
    {
      "url" : "declaration-of-expertise",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension"
  }],
  "status" : "completed",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/ExampleMedication1-Pomalidomid-T"
  },
  "subject" : {
    "identifier" : {
      "_system" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
          "valueCode" : "not-permitted"
        }]
      },
      "_value" : {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
          "valueCode" : "not-permitted"
        }]
      }
    }
  },
  "authoredOn" : "2026-04-01",
  "dosageInstruction" : [{
    "text" : "1-1-1-1"
  }],
  "dispenseRequest" : {
    "quantity" : {
      "value" : 10,
      "unit" : "Tablette"
    }
  }
}

```
