# Medication Without code or system for Strength - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medication Without code or system for Strength**

## Example Medication: Medication Without code or system for Strength

Profile: [EU-Medication](StructureDefinition-GEM-ERPEU-PR-Medication.md)

**code**: Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung

**form**: Solution for infusion

**Exception Generating Narrative: Cannot invoke "String.equals(Object)" because the return value of "org.hl7.fhir.r5.renderers.utils.ResourceWrapper.primitiveValue(String)" is null **



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medication-Without-Strength-Numerator",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Medication"]
  },
  "code" : {
    "text" : "Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung"
  },
  "form" : {
    "coding" : [{
      "system" : "http://standardterms.edqm.eu",
      "code" : "11210000",
      "display" : "Solution for infusion"
    }]
  },
  "ingredient" : [{
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://fhir.de/CodeSystem/bfarm/atc",
        "version" : "2024",
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
