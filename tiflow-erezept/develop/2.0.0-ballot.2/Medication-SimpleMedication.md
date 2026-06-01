# Einfaches Beispiel-Medikament - TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

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
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Medication|2.0"]
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
