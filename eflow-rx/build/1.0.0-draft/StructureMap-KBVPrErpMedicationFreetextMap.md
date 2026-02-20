# KBVPrErpMedicationFreetextMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **KBVPrErpMedicationFreetextMap**

## StructureMap: KBVPrErpMedicationFreetextMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationFreetextMap | *Version*:1.0.0-draft |
| Active as of 2026-02-02 | *Computable Name*:KBVPrErpMedicationFreetextMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for KBV_PR_ERP_Medication_FreeText | 1.4.0 -> EPAMedication | 1.3.0 |

 

### Feld-Mappings

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationFreeText` | `EPAMedication.extension` | Manuell | Fester Wert: 781405001, Medicinal product package (product) | Quelle: Medication.extension:type |
| `KBVPRERPMedicationFreeText.meta` | `EPAMedication.meta.profile` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication` |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationFreeText.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |

#### Extension: KBV_EX_ERP_Medication_Vaccine

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationFreeText.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "KBVPrErpMedicationFreetextMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationFreetextMap",
  "version" : "1.0.0-draft",
  "name" : "KBVPrErpMedicationFreetextMap",
  "status" : "active",
  "date" : "2026-02-02",
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
  "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_FreeText",
    "mode" : "source",
    "alias" : "KBVPRERPMedicationFreeText"
  },
  {
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
    "mode" : "target",
    "alias" : "EPAMedication"
  }],
  "group" : [{
    "name" : "KBVPrErpMedicationFreetextMap",
    "typeMode" : "types",
    "documentation" : "Mapping generated for KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0",
    "input" : [{
      "name" : "KBVPRERPMedicationFreeText",
      "type" : "KBVPRERPMedicationFreeText",
      "mode" : "source"
    },
    {
      "name" : "EPAMedication",
      "type" : "EPAMedication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MedicationBatch235a7d75",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "batch",
        "variable" : "srcKBVPRERPMedicationFreeTextBatchb0aceee1"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "batch",
        "variable" : "tgtEPAMedicationBatch90ce2ac1",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationFreeTextBatchb0aceee1"
        }]
      }],
      "documentation" : "Copied to 'Medication.batch'"
    },
    {
      "name" : "MedicationCoded98e85bf",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "code",
        "variable" : "srcKBVPRERPMedicationFreeTextCode4b0e0f30"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "tgtEPAMedicationCodea6251800",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationFreeTextCode4b0e0f30"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationExtension9f8d5121",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationFreeTextExtensionb00bf49a",
        "condition" : "url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url != 'normSizeCode' and url != 'http://fhir.de/StructureDefinition/normgroesse' and url != 'Impfstoff' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type' and url != 'valueBoolean' and url != 'packaging' and url != 'valueCoding' and url != 'type' and url != 'Normgroesse' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' and url != 'manufacturingInstructions' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine' and url != 'Kategorie' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension' and url != 'drugCategory' and url != 'rxPrescriptionProcessIdentifier' and url != 'Arzneimittelkategorie' and url != 'isVaccine'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtension59cd7688",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationFreeTextExtensionb00bf49a"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationExtensionDrugcategorye963e601",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationFreeTextExtensionArzneimittelkategoriefdd08",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionDrugcategory059b5c6b",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationExtensionDrugcategory059b5c6b",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationExtensionDrugcategoryValueXbd04993e",
        "source" : [{
          "context" : "srcKBVPRERPMedicationFreeTextExtensionArzneimittelkategoriefdd08",
          "element" : "value",
          "variable" : "srcMedicationExtensionDrugcategoryValueXbd04993e"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationExtensionDrugcategory059b5c6b",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationExtensionDrugcategoryValueXbd04993e",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Coding"
          }]
        }],
        "rule" : [{
          "name" : "MedicationExtensionDrugcategoryValueXCodec72163f2",
          "source" : [{
            "context" : "srcMedicationExtensionDrugcategoryValueXbd04993e",
            "element" : "code",
            "variable" : "srcMedicationExtensionDrugcategoryValueXCodec72163f2"
          }],
          "target" : [{
            "context" : "tgtMedicationExtensionDrugcategoryValueXbd04993e",
            "contextType" : "variable",
            "element" : "code",
            "variable" : "tgtMedicationExtensionDrugcategoryValueXCodec72163f2",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "srcMedicationExtensionDrugcategoryValueXCodec72163f2"
            }]
          }],
          "documentation" : "Copied drugCategory code"
        }],
        "documentation" : "Copied from 'Medication.extension:Arzneimittelkategorie.value[x]'"
      }],
      "documentation" : "Copied from 'Medication.extension:Arzneimittelkategorie'"
    },
    {
      "name" : "MedicationExtensionIsvaccine98c25b06",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationFreeTextExtensionImpfstoff0967a597",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionIsvaccinea7742b5a",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationExtensionIsvaccinea7742b5a",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationExtensionIsvaccineValueXac9b8b1e",
        "source" : [{
          "context" : "srcKBVPRERPMedicationFreeTextExtensionImpfstoff0967a597",
          "element" : "value",
          "variable" : "srcMedicationExtensionIsvaccineValueXac9b8b1e"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationExtensionIsvaccinea7742b5a",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationExtensionIsvaccineValueXac9b8b1e",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationExtensionIsvaccineValueXac9b8b1e"
          }]
        }],
        "documentation" : "Copied from 'Medication.extension:Impfstoff.value[x]'"
      }],
      "documentation" : "Copied from 'Medication.extension:Impfstoff'"
    },
    {
      "name" : "MedicationExtensionType61374588",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "variable" : "manualsrcMedicationExtensionType61374588"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionType1a2ef415"
      }],
      "documentation" : "Manual action required | Fester Wert: 781405001, Medicinal product package (product) | Quelle: Medication.extension:type"
    },
    {
      "name" : "MedicationForm5a0bbd5f",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "form",
        "variable" : "srcKBVPRERPMedicationFreeTextForm27d26e2d"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "form",
        "variable" : "tgtEPAMedicationForm691ed321",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationFreeTextForm27d26e2d"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationMetaf9f176bc",
      "source" : [{
        "context" : "KBVPRERPMedicationFreeText",
        "element" : "meta",
        "variable" : "srcKBVPRERPMedicationFreeTextMeta8de074d5"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "tgtEPAMedicationMeta8591b307",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Meta"
        }]
      }],
      "rule" : [{
        "name" : "MedicationMetaProfile399adfc6",
        "source" : [{
          "context" : "srcKBVPRERPMedicationFreeTextMeta8de074d5",
          "variable" : "srcMedicationMetaProfile399adfc6"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationMeta8591b307",
          "contextType" : "variable",
          "element" : "profile",
          "variable" : "tgtMedicationMetaProfile399adfc6",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication"
          }]
        }],
        "documentation" : "Fixed value 'https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication'"
      }],
      "documentation" : "Automatic copy"
    }]
  }]
}

```
