# Einfaches Beispiel-Medikament - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

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
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication|1.6"]
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
