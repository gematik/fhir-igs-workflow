# Sample Simple Medication - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Sample Simple Medication**

## Example Medication: Sample Simple Medication

Profile: [EU-Medication](StructureDefinition-GEM-ERPEU-PR-Medication.md)

**code**: 06313728

### Batches

| | |
| :--- | :--- |
| - | **LotNumber** |
| * | 1234567890 |



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "SimpleMedication",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-Medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhir.de/CodeSystem/ifa/pzn",
      "code" : "06313728"
    }]
  },
  "batch" : {
    "lotNumber" : "1234567890"
  }
}

```
