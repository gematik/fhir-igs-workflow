# Beispiel Medikamentenabgabe mit Dosierung nach Interval - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Medikamentenabgabe mit Dosierung nach Interval**

## Example MedicationDispense: Beispiel Medikamentenabgabe mit Dosierung nach Interval



## Resource Content

```json
{
  "resourceType" : "MedicationDispense",
  "id" : "Example-MedicationDispense-Dosage-interval",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction",
      "valueMarkdown" : "alle 8 Tage: je 1 Stück"
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
          "frequency" : 1,
          "period" : 8,
          "periodUnit" : "d"
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
