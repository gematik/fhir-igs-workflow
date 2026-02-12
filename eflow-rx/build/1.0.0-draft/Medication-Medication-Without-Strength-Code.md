# Medikament ohne Stärke-Code - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medikament ohne Stärke-Code**

## Example Medication: Medikament ohne Stärke-Code



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medication-Without-Strength-Code",
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
          "value" : 85,
          "unit" : "mg"
        },
        "denominator" : {
          "value" : 250,
          "unit" : "Milliliter"
        }
      }
    }
  ]
}

```
