# KBVPrErpMedicationCompoundingMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **KBVPrErpMedicationCompoundingMap**

## StructureMap: KBVPrErpMedicationCompoundingMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationCompoundingMap | *Version*:1.0.0-draft |
| Active as of 2026-02-02 | *Computable Name*:KBVPrErpMedicationCompoundingMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding | 1.4.0 -> EPAMedication | 1.3.0 |

 

### Feld-Mappings

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding` | `EPAMedication.extension` | Manuell | Fester Wert: 781405001, Medicinal product package (product) | Quelle: Medication.extension:type |

### Extensions

#### Extension: KBV_EX_Base_Medication_Type

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type']` | `EPAMedication.extension` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: Medication.extension:Kategorie |

#### Extension: KBV_EX_ERP_Medication_Category

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |
| `KBVPRERPMedicationCompounding.extension.value``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs` |

#### Extension: KBV_EX_ERP_Medication_Vaccine

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |

#### Extension: KBV_EX_ERP_Medication_CompoundingInstruction

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension` |

#### Extension: normgroesse

Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding.extension``[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`http://fhir.de/StructureDefinition/normgroesse` |

#### Extension: KBV_EX_ERP_Medication_Packaging

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationCompounding.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension` |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "KBVPrErpMedicationCompoundingMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationCompoundingMap",
  "version" : "1.0.0-draft",
  "name" : "KBVPrErpMedicationCompoundingMap",
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
  "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Compounding",
    "mode" : "source",
    "alias" : "KBVPRERPMedicationCompounding"
  },
  {
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
    "mode" : "target",
    "alias" : "EPAMedication"
  }],
  "group" : [{
    "name" : "KBVPrErpMedicationCompoundingMap",
    "typeMode" : "types",
    "documentation" : "Mapping generated for KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0",
    "input" : [{
      "name" : "KBVPRERPMedicationCompounding",
      "type" : "KBVPRERPMedicationCompounding",
      "mode" : "source"
    },
    {
      "name" : "EPAMedication",
      "type" : "EPAMedication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "MedicationAmountac45bfbc",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "amount",
        "variable" : "srcKBVPRERPMedicationCompoundingAmount143a90a8"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "amount",
        "variable" : "tgtEPAMedicationAmount30d45c22",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationCompoundingAmount143a90a8"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationBatch235a7d75",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "batch",
        "variable" : "srcKBVPRERPMedicationCompoundingBatch76856f17"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "batch",
        "variable" : "tgtEPAMedicationBatch90ce2ac1",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationCompoundingBatch76856f17"
        }]
      }],
      "documentation" : "Copied to 'Medication.batch'"
    },
    {
      "name" : "MedicationCoded98e85bf",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "code",
        "variable" : "srcKBVPRERPMedicationCompoundingCode19fc48cb"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "tgtEPAMedicationCodea6251800",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationCompoundingCode19fc48cb"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationExtension9f8d5121",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtension3e44d0a1",
        "condition" : "url != 'valueString' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url != 'normSizeCode' and url != 'http://fhir.de/StructureDefinition/normgroesse' and url != 'Impfstoff' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type' and url != 'valueBoolean' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging' and url != 'valueCodeableConcept' and url != 'packaging' and url != 'valueCoding' and url != 'Herstellungsanweisung' and url != 'type' and url != 'Verpackung' and url != 'Normgroesse' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' and url != 'manufacturingInstructions' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine' and url != 'Kategorie' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension' and url != 'drugCategory' and url != 'rxPrescriptionProcessIdentifier' and url != 'Arzneimittelkategorie' and url != 'isVaccine'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtension59cd7688",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationCompoundingExtension3e44d0a1"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationExtensionKategorie86255b0b",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtensionKategorie13839029",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionKategorie8e51c40c"
      }],
      "documentation" : "Feld wird nicht gemappt | Quelle: Medication.extension:Kategorie"
    },
    {
      "name" : "MedicationExtensionDrugcategorye963e601",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtensionArzneimittelkatego82a24",
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
          "context" : "srcKBVPRERPMedicationCompoundingExtensionArzneimittelkatego82a24",
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
          "name" : "MedicationExtensionDrugcategoryValueXSystem2cf01aef",
          "source" : [{
            "context" : "srcMedicationExtensionDrugcategoryValueXbd04993e",
            "variable" : "srcMedicationExtensionDrugcategoryValueXSystem2cf01aef"
          }],
          "target" : [{
            "context" : "tgtMedicationExtensionDrugcategoryValueXbd04993e",
            "contextType" : "variable",
            "element" : "system",
            "variable" : "tgtMedicationExtensionDrugcategoryValueXSystem2cf01aef",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs"
            }]
          }],
          "documentation" : "Fixed value 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension'"
        },
        {
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
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtensionImpfstoffb07a0850",
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
          "context" : "srcKBVPRERPMedicationCompoundingExtensionImpfstoffb07a0850",
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
      "name" : "MedicationExtensionManufacturinginstructionsa59676ae",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtensionHerstellungsanweisa314d",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_CompoundingInstruction'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionManufacturinginstructionsb88614b8",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationExtensionManufacturinginstructionsb88614b8",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-manufacturing-instructions-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationExtensionManufacturinginstructionsValueXb1e426a8",
        "source" : [{
          "context" : "srcKBVPRERPMedicationCompoundingExtensionHerstellungsanweisa314d",
          "element" : "value",
          "variable" : "srcMedicationExtensionManufacturinginstructionsValueXb1e426a8"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationExtensionManufacturinginstructionsb88614b8",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationExtensionManufacturinginstructionsValueXb1e426a8",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationExtensionManufacturinginstructionsValueXb1e426a8"
          }]
        }],
        "documentation" : "Copied from 'Medication.extension:Herstellungsanweisung.value[x]'"
      }],
      "documentation" : "Copied from 'Medication.extension:Herstellungsanweisung'"
    },
    {
      "name" : "MedicationExtensionNormsizecode34ece564",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtensionNormgroesse892c3ca8",
        "condition" : "url = 'http://fhir.de/StructureDefinition/normgroesse' and url = 'http://fhir.de/StructureDefinition/normgroesse'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionNormsizecode7bd0a39d",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationExtensionNormsizecode7bd0a39d",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "http://fhir.de/StructureDefinition/normgroesse"
        }]
      }],
      "documentation" : "Copied from 'Medication.extension:Normgroesse'"
    },
    {
      "name" : "MedicationExtensionPackaging2ff6a765",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationCompoundingExtensionVerpackung0c3db7a5",
        "condition" : "url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging' and url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtensionPackaging63847a7e",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Extension"
        }]
      },
      {
        "context" : "tgtEPAMedicationExtensionPackaging63847a7e",
        "contextType" : "variable",
        "element" : "url",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension"
        }]
      }],
      "rule" : [{
        "name" : "MedicationExtensionPackagingValueX38da2ad0",
        "source" : [{
          "context" : "srcKBVPRERPMedicationCompoundingExtensionVerpackung0c3db7a5",
          "element" : "value",
          "variable" : "srcMedicationExtensionPackagingValueX38da2ad0"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationExtensionPackaging63847a7e",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationExtensionPackagingValueX38da2ad0",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationExtensionPackagingValueX38da2ad0"
          }]
        }],
        "documentation" : "Copied from 'Medication.extension:Verpackung.value[x]'"
      }],
      "documentation" : "Copied from 'Medication.extension:Verpackung'"
    },
    {
      "name" : "MedicationExtensionType61374588",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
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
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "form",
        "variable" : "srcKBVPRERPMedicationCompoundingFormc5146e0b"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "form",
        "variable" : "tgtEPAMedicationForm691ed321",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationCompoundingFormc5146e0b"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationIngredient801affef",
      "source" : [{
        "context" : "KBVPRERPMedicationCompounding",
        "element" : "ingredient",
        "variable" : "srcKBVPRERPMedicationCompoundingIngredient3e616846"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "ingredient",
        "variable" : "tgtEPAMedicationIngredient78db398c",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "BackboneElement"
        }]
      }],
      "documentation" : "Automatic copy"
    }]
  }]
}

```
