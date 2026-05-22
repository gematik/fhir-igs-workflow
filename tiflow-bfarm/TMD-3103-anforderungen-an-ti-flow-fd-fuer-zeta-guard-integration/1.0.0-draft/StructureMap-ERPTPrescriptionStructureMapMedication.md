# E-T-Rezept Structure Map for Medication - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for Medication**

## StructureMap: E-T-Rezept Structure Map for Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedication | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapMedication |

 
Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapMedication",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedication",
  "version" : "1.0.0-draft",
  "name" : "ERPTPrescriptionStructureMapMedication",
  "title" : "E-T-Rezept Structure Map for Medication",
  "status" : "active",
  "experimental" : false,
  "date" : "2025-12-19",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "source",
    "alias" : "srcMedication"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "target",
    "alias" : "tgtMedication"
  }],
  "import" : ["https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapGEMMedication",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVCompoundingMedication",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVPZNMedication",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVFreeTextMedication",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVIngredientMedication"],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapMedication",
    "typeMode" : "none",
    "documentation" : "Router-Mapping zur Auswahl der korrekten Medication-Transformation basierend auf dem KBV/gematik Profil",
    "input" : [{
      "name" : "srcMedication",
      "type" : "srcMedication",
      "mode" : "source"
    },
    {
      "name" : "tgtMedication",
      "type" : "tgtMedication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "decideOnMedicationPZN",
      "source" : [{
        "context" : "srcMedication",
        "variable" : "srcPZN",
        "condition" : "meta.profile.contains('KBV_PR_ERP_Medication_PZN')"
      }],
      "rule" : [{
        "name" : "mapPZN",
        "source" : [{
          "context" : "srcPZN"
        }],
        "dependent" : [{
          "name" : "ERPTPrescriptionStructureMapKBVPZNMedication",
          "variable" : ["srcMedication", "tgtMedication"]
        }],
        "documentation" : "Führt die Transformation für PZN-Medikamente durch (Fertigarzneimittel mit Pharmazentralnummer)"
      }],
      "documentation" : "Erkennt PZN-basierte Medikamente und leitet an spezialisiertes PZN-Mapping weiter"
    },
    {
      "name" : "decideOnMedicationFreeText",
      "source" : [{
        "context" : "srcMedication",
        "variable" : "srcFreeText",
        "condition" : "meta.profile.contains('KBV_PR_ERP_Medication_FreeText')"
      }],
      "rule" : [{
        "name" : "mapFreeText",
        "source" : [{
          "context" : "srcFreeText"
        }],
        "dependent" : [{
          "name" : "ERPTPrescriptionStructureMapKBVFreeTextMedication",
          "variable" : ["srcMedication", "tgtMedication"]
        }],
        "documentation" : "Führt die Transformation für Freitext-Medikamente durch (nicht standardisierte Arzneimittelangaben)"
      }],
      "documentation" : "Erkennt Freitext-Medikamente und leitet an spezialisiertes FreeText-Mapping weiter"
    },
    {
      "name" : "decideOnMedicationIngredient",
      "source" : [{
        "context" : "srcMedication",
        "variable" : "srcIngredient",
        "condition" : "meta.profile.contains('KBV_PR_ERP_Medication_Ingredient')"
      }],
      "rule" : [{
        "name" : "mapIngredient",
        "source" : [{
          "context" : "srcIngredient"
        }],
        "dependent" : [{
          "name" : "ERPTPrescriptionStructureMapKBVIngredientMedication",
          "variable" : ["srcMedication", "tgtMedication"]
        }],
        "documentation" : "Führt die Transformation für wirkstoffbasierte Medikamente durch (Rezeptur nach Wirkstoffen)"
      }],
      "documentation" : "Erkennt wirkstoffbasierte Medikamente und leitet an spezialisiertes Ingredient-Mapping weiter"
    },
    {
      "name" : "decideOnMedicationCompounding",
      "source" : [{
        "context" : "srcMedication",
        "variable" : "srcCompounding",
        "condition" : "meta.profile.contains('KBV_PR_ERP_Medication_Compounding')"
      }],
      "rule" : [{
        "name" : "mapCompounding",
        "source" : [{
          "context" : "srcCompounding"
        }],
        "dependent" : [{
          "name" : "ERPTPrescriptionStructureMapKBVCompoundingMedication",
          "variable" : ["srcMedication", "tgtMedication"]
        }],
        "documentation" : "Führt die Transformation für Rezeptur-Medikamente durch (individuell hergestellte Arzneimittel)"
      }],
      "documentation" : "Erkennt Rezeptur-Medikamente und leitet an spezialisiertes Compounding-Mapping weiter"
    },
    {
      "name" : "decideOnMedicationGematik",
      "source" : [{
        "context" : "srcMedication",
        "variable" : "srcGemMed",
        "condition" : "meta.profile.contains('GEM_ERP_PR_Medication')"
      }],
      "rule" : [{
        "name" : "mapGemMed",
        "source" : [{
          "context" : "srcGemMed"
        }],
        "dependent" : [{
          "name" : "ERPTPrescriptionStructureMapGEMMedication",
          "variable" : ["srcMedication", "tgtMedication"]
        }],
        "documentation" : "Führt die Transformation für gematik-Medikamente durch (abgegebene Arzneimittel aus der Apotheke)"
      }],
      "documentation" : "Erkennt gematik-Medikamente und leitet an spezialisiertes gematik-Mapping weiter"
    }]
  }]
}

```
