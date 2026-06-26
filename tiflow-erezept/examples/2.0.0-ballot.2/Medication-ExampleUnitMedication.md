# Beispiel-Medikament mit Einheiten - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel-Medikament mit Einheiten**

## Example Medication: Beispiel-Medikament mit Einheiten



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "ExampleUnitMedication",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication|2.0"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "08585997"
    }],
    "text" : "Prospan® Hustensaft 100ml N1"
  },
  "status" : "active",
  "amount" : {
    "numerator" : {
      "value" : 1,
      "system" : "http://bfarm.de/DimensionsloseEinheiten",
      "code" : "Packungen"
    },
    "denominator" : {
      "value" : 1
    }
  },
  "ingredient" : [{
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/ask",
        "code" : "11704"
      }],
      "text" : "Efeublätter, TE mit Ethanol/Ethanol-Wasser"
    },
    "strength" : {
      "numerator" : {
        "value" : 7,
        "system" : "http://unitsofmeasure.org",
        "code" : "ml"
      },
      "denominator" : {
        "value" : 1
      }
    }
  }]
}

```
