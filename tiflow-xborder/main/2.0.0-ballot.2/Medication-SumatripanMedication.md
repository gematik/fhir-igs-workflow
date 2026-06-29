# Sample Medication Sumatripan - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Sample Medication Sumatripan**

## Example Medication: Sample Medication Sumatripan

Profile: [EU-Medication](StructureDefinition-GEM-ERPEU-PR-Medication.md)

**DrugCategoryExtension**: epa-drug-category-cs: 00 (00)

**MedicationIsVaccineExtension**: false

**ExtensionNormgroesseDeBasis**: N1

**code**: Sumatriptan-1a Pharma 100 mg Tabletten

**form**: TAB

**amount**: 20 St/1

### Batches

| | |
| :--- | :--- |
| - | **LotNumber** |
| * | 1234567890 |



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "SumatripanMedication",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-xborder/StructureDefinition/GEM-ERPEU-PR-Medication"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs",
      "code" : "00"
    }
  },
  {
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension",
    "valueBoolean" : false
  },
  {
    "url" : "http://fhir.de/StructureDefinition/normgroesse",
    "valueCode" : "N1"
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "06313728"
    }],
    "text" : "Sumatriptan-1a Pharma 100 mg Tabletten"
  },
  "form" : {
    "coding" : [{
      "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_DARREICHUNGSFORM",
      "code" : "TAB"
    }]
  },
  "amount" : {
    "numerator" : {
      "extension" : [{
        "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-total-quantity-formulation-extension",
        "valueString" : "20"
      }],
      "value" : 20,
      "unit" : "St"
    },
    "denominator" : {
      "value" : 1
    }
  },
  "batch" : {
    "lotNumber" : "1234567890"
  }
}

```
