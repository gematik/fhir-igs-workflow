# Zweites Beispiel Medikamentenabgabe - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Zweites Beispiel Medikamentenabgabe**

## Example MedicationDispense: Zweites Beispiel Medikamentenabgabe



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-2",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/erezept/StructureDefinition/GEM-ERP-PR-MedicationDispense"]
  },
  "identifier" : [{
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "160.000.033.491.280.78"
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/SimpleMedication"
  },
  "subject" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789"
    }
  },
  "performer" : [{
    "actor" : {
      "identifier" : {
        "system" : "https://gematik.de/fhir/sid/telematik-id",
        "value" : "3-SMC-B-Testkarte-883110000095957"
      }
    }
  }],
  "whenHandedOver" : "2026-07-01"
}

```
