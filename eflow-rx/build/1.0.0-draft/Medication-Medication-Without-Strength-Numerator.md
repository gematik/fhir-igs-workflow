# Medikament ohne Stärke-Numerator - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medikament ohne Stärke-Numerator**

## Example Medication: Medikament ohne Stärke-Numerator



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medication-Without-Strength-Numerator",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medication"
    ]
  },
  "code" : {
    "text" : "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
  },
  "form" : {
    "coding" : [
      {
        "system" : "http://standardterms.edqm.eu",
        "code" : "11210000",
        "display" : "Solution for infusion"
      }
    ]
  },
  "ingredient" : [
    {
      "itemCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.de/CodeSystem/bfarm/atc",
            "version" : "2025",
            "code" : "L01DB01",
            "display" : "Doxorubicin"
          }
        ]
      },
      "isActive" : true,
      "strength" : {
        "numerator" : {
          "_value" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                "valueCode" : "unknown"
              }
            ]
          },
          "_system" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                "valueCode" : "unknown"
              }
            ]
          },
          "_code" : {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
                "valueCode" : "unknown"
              }
            ]
          }
        },
        "denominator" : {
          "value" : 1
        }
      }
    }
  ]
}

```
