# Antwortbundle fuer GET /MedicationDispense - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwortbundle fuer GET /MedicationDispense**

## Example Bundle: Antwortbundle fuer GET /MedicationDispense



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "example-searchset-medicationdispense",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/MedicationDispense?whenhandedover=ge2025-01-01"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/MedicationDispense/Example-MedicationDispense",
    "resource" : {
      "resourceType" : "MedicationDispense",
      "id" : "Example-MedicationDispense",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense|1.6"]
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
  }]
}

```
