# Beispiel BfArM MedicationRequest - Implementation Guide TIFlow - Datenaustausch BfArM Webdienst v2.0.0-ballot.2

Implementation Guide

TIFlow - Datenaustausch BfArM Webdienst

Version 2.0.0-ballot.2 - ballot 

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
    "profile" : ["https://gematik.de/fhir/tiflow-bfarm/StructureDefinition/erp-tprescription-medication-request"]
  },
  "extension" : [{
    "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction",
    "valueMarkdown" : "1-1-1-1 nach Bedarf"
  },
  {
    "extension" : [{
      "url" : "algorithmVersion",
      "valueString" : "1.0.0"
    },
    {
      "url" : "language",
      "valueCode" : "de-DE"
    }],
    "url" : "http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta"
  },
  {
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
      "system" : "http://fhir.de/sid/gkv/kvid-10",
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
    "text" : "1-1-1-1 nach Bedarf"
  }],
  "dispenseRequest" : {
    "quantity" : {
      "value" : 10,
      "unit" : "Tablette"
    }
  }
}

```
