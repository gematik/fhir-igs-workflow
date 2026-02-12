# Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Wochentags - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Wochentags**

## Example MedicationDispense: Beispiel Medikamentenabgabe mit Dosierung nach Kombination des Wochentags



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-Dosage-comb-dayofweek",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction",
      "valueMarkdown" : "montags 1-0-1-0, freitags 1-0-1-0 Stück"
    },
    {
      "extension" : [
        {
          "url" : "algorithmVersion",
          "valueString" : "1.0.0"
        },
        {
          "url" : "language",
          "valueCode" : "de-DE"
        }
      ],
      "url" : "http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta"
    }
  ],
  "identifier" : [
    {
      "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
      "value" : "160.000.033.491.280.78"
    }
  ],
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
  "performer" : [
    {
      "actor" : {
        "identifier" : {
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "3-SMC-B-Testkarte-883110000095957"
        }
      }
    }
  ],
  "whenHandedOver" : "2026-07-01",
  "dosageInstruction" : [
    {
      "timing" : {
        "repeat" : {
          "frequency" : 4,
          "period" : 1,
          "periodUnit" : "wk",
          "dayOfWeek" : ["mon", "fri"],
          "when" : ["MORN", "EVE"]
        }
      },
      "doseAndRate" : [
        {
          "doseQuantity" : {
            "value" : 1,
            "unit" : "Stück",
            "system" : "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_BMP_DOSIEREINHEIT",
            "code" : "1"
          }
        }
      ]
    }
  ]
}

```
