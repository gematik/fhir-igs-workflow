# KBVPrErpMedicationIngredientMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **KBVPrErpMedicationIngredientMap**

## StructureMap: KBVPrErpMedicationIngredientMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationIngredientMap | *Version*:1.0.0-draft |
| Active as of 2026-02-02 | *Computable Name*:KBVPrErpMedicationIngredientMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for KBV_PR_ERP_Medication_Ingredient | 1.4.0 -> EPAMedication | 1.3.0 |

 

### Feld-Mappings

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationIngredient` | `EPAMedication.extension` | Nicht Übertragen | Feld wird nicht gemappt | Quelle: Medication.extension:Kategorie |
| `KBVPRERPMedicationIngredient` | `EPAMedication.extension` | Manuell | Fester Wert: 781405001, Medicinal product package (product) | Quelle: Medication.extension:type |

### Extensions

#### Extension: KBV_EX_ERP_Medication_Category

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationIngredient.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension` |
| `KBVPRERPMedicationIngredient.extension.value``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category']` | `EPAMedication.extension.value.system` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/CodeSystem/epa-drug-category-cs` |

#### Extension: KBV_EX_ERP_Medication_Vaccine

Bedingung: url = `https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationIngredient.extension``[Bedingung: url = 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension` |

#### Extension: normgroesse

Bedingung: url = `http://fhir.de/StructureDefinition/normgroesse`

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPMedicationIngredient.extension``[Bedingung: url = 'http://fhir.de/StructureDefinition/normgroesse']` | `EPAMedication.extension.url` | Fester Wert | setzt festen Wert:`http://fhir.de/StructureDefinition/normgroesse` |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "KBVPrErpMedicationIngredientMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationIngredientMap",
  "version" : "1.0.0-draft",
  "name" : "KBVPrErpMedicationIngredientMap",
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
  "description" : "Auto-generated StructureMap for KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Medication_Ingredient",
    "mode" : "source",
    "alias" : "KBVPRERPMedicationIngredient"
  },
  {
    "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication",
    "mode" : "target",
    "alias" : "EPAMedication"
  }],
  "group" : [{
    "name" : "KBVPrErpMedicationIngredientMap",
    "typeMode" : "types",
    "documentation" : "Mapping generated for KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0",
    "input" : [{
      "name" : "KBVPRERPMedicationIngredient",
      "type" : "KBVPRERPMedicationIngredient",
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
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "amount",
        "variable" : "srcKBVPRERPMedicationIngredientAmountf5b60baf"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "amount",
        "variable" : "tgtEPAMedicationAmount30d45c22",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationIngredientAmountf5b60baf"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationBatch235a7d75",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "batch",
        "variable" : "srcKBVPRERPMedicationIngredientBatch57ffbfae"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "batch",
        "variable" : "tgtEPAMedicationBatch90ce2ac1",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationIngredientBatch57ffbfae"
        }]
      }],
      "documentation" : "Copied to 'Medication.batch'"
    },
    {
      "name" : "MedicationCoded98e85bf",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "code",
        "variable" : "srcKBVPRERPMedicationIngredientCode7037abb6"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "tgtEPAMedicationCodea6251800",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationIngredientCode7037abb6"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationExtension9f8d5121",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationIngredientExtensionc921117b",
        "condition" : "url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Category' and url != 'normSizeCode' and url != 'http://fhir.de/StructureDefinition/normgroesse' and url != 'Impfstoff' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_Base_Medication_Type' and url != 'valueCode' and url != 'valueBoolean' and url != 'packaging' and url != 'valueCoding' and url != 'type' and url != 'Normgroesse' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/medication-id-vaccine-extension' and url != 'manufacturingInstructions' and url != 'https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Vaccine' and url != 'Kategorie' and url != 'https://gematik.de/fhir/epa-medication/StructureDefinition/drug-category-extension' and url != 'drugCategory' and url != 'rxPrescriptionProcessIdentifier' and url != 'Arzneimittelkategorie' and url != 'isVaccine'"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtEPAMedicationExtension59cd7688",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationIngredientExtensionc921117b"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationExtensionKategorie86255b0b",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
        "variable" : "manualsrcMedicationExtensionKategorie86255b0b"
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
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationIngredientExtensionArzneimittelkategorac38b",
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
          "context" : "srcKBVPRERPMedicationIngredientExtensionArzneimittelkategorac38b",
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
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationIngredientExtensionImpfstoff70658b91",
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
          "context" : "srcKBVPRERPMedicationIngredientExtensionImpfstoff70658b91",
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
      "name" : "MedicationExtensionNormsizecode34ece564",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "extension",
        "variable" : "srcKBVPRERPMedicationIngredientExtensionNormgroesse8c0ff3f5",
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
      "rule" : [{
        "name" : "MedicationExtensionNormsizecodeValueX145c1bd0",
        "source" : [{
          "context" : "srcKBVPRERPMedicationIngredientExtensionNormgroesse8c0ff3f5",
          "element" : "value",
          "variable" : "srcMedicationExtensionNormsizecodeValueX145c1bd0"
        }],
        "target" : [{
          "context" : "tgtEPAMedicationExtensionNormsizecode7bd0a39d",
          "contextType" : "variable",
          "element" : "value",
          "variable" : "tgtMedicationExtensionNormsizecodeValueX145c1bd0",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcMedicationExtensionNormsizecodeValueX145c1bd0"
          }]
        }],
        "documentation" : "Copied from 'Medication.extension:Normgroesse.value[x]'"
      }],
      "documentation" : "Copied from 'Medication.extension:Normgroesse'"
    },
    {
      "name" : "MedicationExtensionType61374588",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
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
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "form",
        "variable" : "srcKBVPRERPMedicationIngredientForm850ae199"
      }],
      "target" : [{
        "context" : "EPAMedication",
        "contextType" : "variable",
        "element" : "form",
        "variable" : "tgtEPAMedicationForm691ed321",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcKBVPRERPMedicationIngredientForm850ae199"
        }]
      }],
      "documentation" : "Automatic copy"
    },
    {
      "name" : "MedicationIngredient801affef",
      "source" : [{
        "context" : "KBVPRERPMedicationIngredient",
        "element" : "ingredient",
        "variable" : "srcKBVPRERPMedicationIngredientIngredient7253216c"
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
