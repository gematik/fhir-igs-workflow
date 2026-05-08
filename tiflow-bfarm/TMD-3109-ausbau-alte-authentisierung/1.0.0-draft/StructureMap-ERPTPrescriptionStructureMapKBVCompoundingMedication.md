# E-T-Rezept Structure Map for KBV Compounding Medication - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for KBV Compounding Medication**

## StructureMap: E-T-Rezept Structure Map for KBV Compounding Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVCompoundingMedication | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapKBVCompoundingMedication |

 
Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapKBVCompoundingMedication",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVCompoundingMedication",
  "version" : "1.0.0-draft",
  "name" : "ERPTPrescriptionStructureMapKBVCompoundingMedication",
  "title" : "E-T-Rezept Structure Map for KBV Compounding Medication",
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
  "description" : "Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format",
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
    "alias" : "kbvMedicationCompounding"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "target",
    "alias" : "bfarmMedication"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapKBVCompoundingMedication",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von KBV Rezeptur-Medikamenten zu BfArM T-Prescription Format",
    "input" : [{
      "name" : "kbvMedicationCompounding",
      "type" : "kbvMedicationCompounding",
      "mode" : "source"
    },
    {
      "name" : "bfarmMedication",
      "type" : "bfarmMedication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "medicationExt",
      "source" : [{
        "context" : "kbvMedicationCompounding",
        "element" : "extension",
        "variable" : "extVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtExtVar"
      }],
      "rule" : [{
        "name" : "copyFormulaPackagingExtensionUrl",
        "source" : [{
          "context" : "extVar",
          "variable" : "extMatchVar",
          "condition" : "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Packaging'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension"
          }]
        }],
        "rule" : [{
          "name" : "copyExtensionValue",
          "source" : [{
            "context" : "extMatchVar",
            "element" : "value",
            "variable" : "extValVar"
          }],
          "target" : [{
            "context" : "tgtExtVar",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "extValVar"
            }]
          }],
          "documentation" : "Übernimmt den Verpackungswert für die Rezeptur"
        }],
        "documentation" : "Transformiert KBV-Verpackungs-Extension in gematik-Formulierungs-Verpackungs-Extension"
      }],
      "documentation" : "Mappt Rezeptur-spezifische Extensions von KBV- zu BfArM-Format"
    },
    {
      "name" : "medicationId",
      "source" : [{
        "context" : "kbvMedicationCompounding",
        "element" : "id",
        "variable" : "IdVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "id",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "IdVar"
        }]
      }],
      "documentation" : "Übernimmt die eindeutige Medication-ID unverändert"
    },
    {
      "name" : "medicationCode",
      "source" : [{
        "context" : "kbvMedicationCompounding",
        "element" : "code",
        "variable" : "srcCodeVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "code",
        "variable" : "tgtCodeVar"
      }],
      "rule" : [{
        "name" : "medicationCodeText",
        "source" : [{
          "context" : "srcCodeVar",
          "element" : "text",
          "variable" : "srcCodeTextVar"
        }],
        "target" : [{
          "context" : "tgtCodeVar",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcCodeTextVar"
          }]
        }],
        "documentation" : "Kopiert die Bezeichnung der Rezeptur (z.B. 'Hydrocortison-Salbe 1%')"
      }],
      "documentation" : "Mappt den Rezeptur-Code mit Bezeichnung"
    },
    {
      "name" : "medicationForm",
      "source" : [{
        "context" : "kbvMedicationCompounding",
        "element" : "form",
        "variable" : "formVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "form",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "formVar"
        }]
      }],
      "documentation" : "Übernimmt die Darreichungsform der Rezeptur (Salbe, Creme, Kapseln, etc.)"
    },
    {
      "name" : "medicationAmount",
      "source" : [{
        "context" : "kbvMedicationCompounding",
        "element" : "amount",
        "variable" : "amountVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "amount",
        "variable" : "tgtAmountVar"
      }],
      "rule" : [{
        "name" : "medicationAmountDenominator",
        "source" : [{
          "context" : "amountVar",
          "element" : "denominator",
          "variable" : "amountDenominatorVar"
        }],
        "target" : [{
          "context" : "tgtAmountVar",
          "contextType" : "variable",
          "element" : "denominator",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "amountDenominatorVar"
          }]
        }],
        "documentation" : "Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Rezeptur')"
      },
      {
        "name" : "medicationAmountNumerator",
        "source" : [{
          "context" : "amountVar",
          "element" : "numerator",
          "variable" : "amountNumeratorVar"
        }],
        "target" : [{
          "context" : "tgtAmountVar",
          "contextType" : "variable",
          "element" : "numerator",
          "variable" : "tgtAmountNumeratorVar"
        }],
        "rule" : [{
          "name" : "medicationAmountExt",
          "source" : [{
            "context" : "amountNumeratorVar",
            "element" : "extension",
            "variable" : "amountNumExtVar"
          }],
          "target" : [{
            "context" : "tgtAmountNumeratorVar",
            "contextType" : "variable",
            "element" : "extension",
            "variable" : "tgtAmountNumExtVar"
          }],
          "rule" : [{
            "name" : "copyPackagingSizeExtensionUrl",
            "source" : [{
              "context" : "amountNumExtVar",
              "condition" : "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_PackagingSize'"
            }],
            "target" : [{
              "context" : "tgtAmountNumExtVar",
              "contextType" : "variable",
              "element" : "url",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-packaging-size-extension"
              }]
            }],
            "documentation" : "Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um"
          },
          {
            "name" : "copyExtensionValue",
            "source" : [{
              "context" : "amountNumExtVar",
              "element" : "value",
              "variable" : "extValVar"
            }],
            "target" : [{
              "context" : "tgtAmountNumExtVar",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "extValVar"
              }]
            }],
            "documentation" : "Übernimmt den Packungsgrößenwert für die Rezeptur"
          }],
          "documentation" : "Transformiert Packungsgrößen-Extensions für Rezepturen"
        },
        {
          "name" : "medicationAmountNumeratorValue",
          "source" : [{
            "context" : "amountNumeratorVar",
            "element" : "value",
            "variable" : "amountNumeratorValueVar"
          }],
          "target" : [{
            "context" : "tgtAmountNumeratorVar",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "amountNumeratorValueVar"
            }]
          }],
          "documentation" : "Kopiert den numerischen Wert der Gesamtmenge (z.B. '50' für 50g Salbe)"
        },
        {
          "name" : "medicationAmountNumeratorUnit",
          "source" : [{
            "context" : "amountNumeratorVar",
            "element" : "unit",
            "variable" : "amountNumeratorUnitVar"
          }],
          "target" : [{
            "context" : "tgtAmountNumeratorVar",
            "contextType" : "variable",
            "element" : "unit",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "amountNumeratorUnitVar"
            }]
          }],
          "documentation" : "Übernimmt die Mengeneinheit für die Rezeptur (g, ml, Stück, etc.)"
        },
        {
          "name" : "medicationAmountNumeratorSystem",
          "source" : [{
            "context" : "amountNumeratorVar",
            "element" : "system",
            "variable" : "amountNumeratorSystemVar"
          }],
          "target" : [{
            "context" : "tgtAmountNumeratorVar",
            "contextType" : "variable",
            "element" : "system",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "amountNumeratorSystemVar"
            }]
          }],
          "documentation" : "Kopiert das Codesystem für die Mengeneinheit (meist UCUM)"
        },
        {
          "name" : "medicationAmountNumeratorCode",
          "source" : [{
            "context" : "amountNumeratorVar",
            "element" : "code",
            "variable" : "amountNumeratorCodeVar"
          }],
          "target" : [{
            "context" : "tgtAmountNumeratorVar",
            "contextType" : "variable",
            "element" : "code",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "amountNumeratorCodeVar"
            }]
          }],
          "documentation" : "Übernimmt den standardisierten Code für die Mengeneinheit"
        }],
        "documentation" : "Mappt die detaillierte Mengenangabe der Rezeptur"
      }],
      "documentation" : "Mappt die Gesamtmenge der herzustellenden Rezeptur"
    },
    {
      "name" : "medicationIngredient",
      "source" : [{
        "context" : "kbvMedicationCompounding",
        "element" : "ingredient",
        "variable" : "ingredientVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "ingredient",
        "variable" : "tgtIngredientVar"
      }],
      "rule" : [{
        "name" : "medicationIngredientItemValue",
        "source" : [{
          "context" : "ingredientVar",
          "element" : "item",
          "variable" : "IngredientItemValueVar"
        }],
        "target" : [{
          "context" : "tgtIngredientVar",
          "contextType" : "variable",
          "element" : "item",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "IngredientItemValueVar"
          }]
        }],
        "documentation" : "Kopiert die Referenz oder den Code des Rezeptur-Bestandteils"
      },
      {
        "name" : "medicationIngredientExt",
        "source" : [{
          "context" : "ingredientVar",
          "element" : "extension",
          "variable" : "IngredientExtVar"
        }],
        "target" : [{
          "context" : "tgtIngredientVar",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtIngredientExtVar"
        }],
        "rule" : [{
          "name" : "copyIngredientFormExtensionUrl",
          "source" : [{
            "context" : "IngredientExtVar",
            "condition" : "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Form'"
          }],
          "target" : [{
            "context" : "tgtIngredientExtVar",
            "contextType" : "variable",
            "element" : "url",
            "transform" : "copy",
            "parameter" : [{
              "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-darreichungsform-extension"
            }]
          }],
          "rule" : [{
            "name" : "copyExtensionValue",
            "source" : [{
              "context" : "IngredientExtVar",
              "element" : "value",
              "variable" : "extValVar"
            }],
            "target" : [{
              "context" : "tgtIngredientExtVar",
              "contextType" : "variable",
              "element" : "value",
              "transform" : "copy",
              "parameter" : [{
                "valueId" : "extValVar"
              }]
            }],
            "documentation" : "Übernimmt die Darreichungsform des Bestandteils"
          }],
          "documentation" : "Wandelt KBV-Bestandteil-Darreichungsform-Extension in gematik-Format um"
        }],
        "documentation" : "Transformiert Bestandteil-spezifische Extensions"
      },
      {
        "name" : "medicationIngredientStrength",
        "source" : [{
          "context" : "ingredientVar",
          "element" : "strength",
          "variable" : "IngredientStrengthValueVar"
        }],
        "target" : [{
          "context" : "tgtIngredientVar",
          "contextType" : "variable",
          "element" : "strength",
          "variable" : "IngredientStrengthValueVar"
        }],
        "rule" : [{
          "name" : "medicationIngredientDenominator",
          "source" : [{
            "context" : "IngredientStrengthValueVar",
            "element" : "denominator",
            "variable" : "ingredientDenominatorVar"
          }],
          "target" : [{
            "context" : "IngredientStrengthValueVar",
            "contextType" : "variable",
            "element" : "denominator",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "ingredientDenominatorVar"
            }]
          }],
          "documentation" : "Kopiert den Nenner für die Stärkeangabe (Bezugsmenge)"
        },
        {
          "name" : "medicationIngredientNumerator",
          "source" : [{
            "context" : "IngredientStrengthValueVar",
            "element" : "numerator",
            "variable" : "ingredientNumeratorVar"
          }],
          "target" : [{
            "context" : "IngredientStrengthValueVar",
            "contextType" : "variable",
            "element" : "numerator",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "ingredientNumeratorVar"
            }]
          }],
          "documentation" : "Kopiert den Zähler für die Stärkeangabe (Wirkstoffmenge)"
        },
        {
          "name" : "medicationIngredientStrengthExt",
          "source" : [{
            "context" : "IngredientStrengthValueVar",
            "element" : "extension",
            "variable" : "IngredientStrExtVar"
          }],
          "target" : [{
            "context" : "IngredientStrengthValueVar",
            "contextType" : "variable",
            "element" : "extension",
            "variable" : "tgtIngredientStrExtVar"
          }],
          "rule" : [{
            "name" : "copyIngredientAmountExtensionUrl",
            "source" : [{
              "context" : "IngredientStrExtVar",
              "condition" : "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Medication_Ingredient_Amount'"
            }],
            "target" : [{
              "context" : "tgtIngredientStrExtVar",
              "contextType" : "variable",
              "element" : "url",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/medication-ingredient-amount-extension"
              }]
            }],
            "rule" : [{
              "name" : "copyExtensionValue",
              "source" : [{
                "context" : "IngredientStrExtVar",
                "element" : "value",
                "variable" : "extValVar"
              }],
              "target" : [{
                "context" : "tgtIngredientStrExtVar",
                "contextType" : "variable",
                "element" : "value",
                "transform" : "copy",
                "parameter" : [{
                  "valueId" : "extValVar"
                }]
              }],
              "documentation" : "Übernimmt die Mengenangabe des Bestandteils"
            }],
            "documentation" : "Wandelt KBV-Bestandteil-Mengen-Extension in gematik-Format um"
          }],
          "documentation" : "Transformiert Bestandteil-Mengen-Extensions"
        }],
        "documentation" : "Mappt die Stärke/Konzentration des Bestandteils in der Rezeptur"
      }],
      "documentation" : "Mappt die Bestandteile der Rezeptur mit detaillierten Mengen- und Stärkeangaben"
    }]
  }]
}

```
