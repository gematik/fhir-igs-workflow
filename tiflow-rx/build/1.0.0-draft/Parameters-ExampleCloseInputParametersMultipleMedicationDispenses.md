# Beispiel Close-Parameter mit mehreren MedicationDispenses - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Close-Parameter mit mehreren MedicationDispenses**

## Example Parameters: Beispiel Close-Parameter mit mehreren MedicationDispenses



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "ExampleCloseInputParametersMultipleMedicationDispenses",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-input-parameters"]
  },
  "parameter" : [{
    "name" : "rxDispensation",
    "part" : [{
      "name" : "medicationDispense",
      "resource" : {
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
    },
    {
      "name" : "medication",
      "resource" : {
        "resourceType" : "Medication",
        "id" : "SumatripanMedication",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Medication"]
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
    }]
  },
  {
    "name" : "rxDispensation",
    "part" : [{
      "name" : "medicationDispense",
      "resource" : {
        "resourceType" : "MedicationDispense",
        "id" : "Example-MedicationDispense-2",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-MedicationDispense"]
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
    },
    {
      "name" : "medication",
      "resource" : {
        "resourceType" : "Medication",
        "id" : "SimpleMedication",
        "meta" : {
          "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Medication"]
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
    }]
  }]
}

```
