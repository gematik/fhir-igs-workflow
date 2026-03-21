# Einfaches Beispiel-Medikament - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Einfaches Beispiel-Medikament**

## Example Medication: Einfaches Beispiel-Medikament



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "SimpleMedication",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/erezept/StructureDefinition/GEM-ERP-PR-Medication"]
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
