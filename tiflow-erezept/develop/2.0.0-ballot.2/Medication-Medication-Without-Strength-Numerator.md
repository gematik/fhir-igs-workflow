# Medikament ohne Stärke-Numerator - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

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
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication|2.0"]
  },
  "code" : {
    "text" : "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
  },
  "status" : "active",
  "form" : {
    "text" : "Solution for infusion"
  },
  "ingredient" : [{
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/bfarm/atc",
        "version" : "2025",
        "code" : "L01DB01",
        "display" : "Doxorubicin"
      }]
    },
    "isActive" : true,
    "strength" : {
      "numerator" : {
        "_value" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
          }]
        },
        "_system" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
          }]
        },
        "_code" : {
          "extension" : [{
            "url" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
          }]
        }
      },
      "denominator" : {
        "value" : 1
      }
    }
  }]
}

```
