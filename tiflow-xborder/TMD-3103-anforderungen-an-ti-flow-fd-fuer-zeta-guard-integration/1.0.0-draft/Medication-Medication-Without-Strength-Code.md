# Medication Without code or system for Strength - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Medication Without code or system for Strength**

## Example Medication: Medication Without code or system for Strength

Profile: [EU-Medication](StructureDefinition-GEM-ERPEU-PR-Medication.md)

**code**: Infusion bestehend aus 85mg Doxorubicin aufgeloest zur Verabreichung in 250ml 5-%iger (50 mg/ml) Glucose-Infusionsloesung

**form**: Solution for infusion

### Ingredients

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Item[x]** | **IsActive** | **Strength** |
| * | Doxorubicin | true | 85 mg/250 Milliliter |



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medication-Without-Strength-Code",
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
        "value" : 85,
        "unit" : "mg"
      },
      "denominator" : {
        "value" : 250,
        "unit" : "Milliliter"
      }
    }
  }]
}

```
