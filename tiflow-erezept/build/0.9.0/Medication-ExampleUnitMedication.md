# Beispiel-Medikament mit Einheiten - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

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
    "profile" : ["https://gematik.de/fhir/tiflow/erezept/StructureDefinition/GEM-ERP-PR-Medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "08585997"
    }],
    "text" : "Prospan® Hustensaft 100ml N1"
  },
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
