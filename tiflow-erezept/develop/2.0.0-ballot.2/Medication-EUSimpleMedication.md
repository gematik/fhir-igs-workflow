# Sample Simple Medication - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Sample Simple Medication**

## Example Medication: Sample Simple Medication



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "EUSimpleMedication",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERPEU-PR-Medication"]
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
