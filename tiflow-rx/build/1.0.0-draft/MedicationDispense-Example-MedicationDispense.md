# Beispiel Medikamentenabgabe - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Medikamentenabgabe**

## Example MedicationDispense: Beispiel Medikamentenabgabe



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-MedicationDispense"]
  },
  "identifier" : [{
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "160.000.033.491.280.78"
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/SumatripanMedication"
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
