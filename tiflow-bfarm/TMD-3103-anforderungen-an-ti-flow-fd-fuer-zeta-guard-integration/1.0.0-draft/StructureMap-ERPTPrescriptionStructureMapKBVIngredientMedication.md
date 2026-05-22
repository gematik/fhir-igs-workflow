# E-T-Rezept Structure Map for KBV Ingredient Medication - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for KBV Ingredient Medication**

## StructureMap: E-T-Rezept Structure Map for KBV Ingredient Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVIngredientMedication | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapKBVIngredientMedication |

 
Maps KBV-Ingredient ERP Medication to BfArM T-Prescription Medication format 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapKBVIngredientMedication",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVIngredientMedication",
  "version" : "1.0.0-draft",
  "name" : "ERPTPrescriptionStructureMapKBVIngredientMedication",
  "title" : "E-T-Rezept Structure Map for KBV Ingredient Medication",
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
  "description" : "Maps KBV-Ingredient ERP Medication to BfArM T-Prescription Medication format",
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
    "alias" : "kbvMedicationIngredient"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "target",
    "alias" : "bfarmMedication"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapKBVIngredientMedication",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von KBV Wirkstoff-Medikamenten zu BfArM T-Prescription Format",
    "input" : [{
      "name" : "kbvMedicationIngredient",
      "type" : "kbvMedicationIngredient",
      "mode" : "source"
    },
    {
      "name" : "bfarmMedication",
      "type" : "bfarmMedication",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "medicationId",
      "source" : [{
        "context" : "kbvMedicationIngredient",
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
      "name" : "medicationForm",
      "source" : [{
        "context" : "kbvMedicationIngredient",
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
      "documentation" : "Kopiert die gewünschte Darreichungsform für die Wirkstoff-Verordnung (Kapseln, Salbe, Lösung, etc.)"
    },
    {
      "name" : "medicationAmount",
      "source" : [{
        "context" : "kbvMedicationIngredient",
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
        "documentation" : "Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Herstellung')"
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
            "rule" : [{
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
              "documentation" : "Übernimmt den Packungsgrößenwert"
            }],
            "documentation" : "Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um"
          }],
          "documentation" : "Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format für Wirkstoff Verordnung"
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
          "documentation" : "Kopiert den numerischen Wert der Gesamtmenge (z.B. '100' für 100g Salbe)"
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
          "documentation" : "Übernimmt die Mengeneinheit (g, ml, Stück, etc.)"
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
        "documentation" : "Mappt die detaillierte Mengenangabe"
      }],
      "documentation" : "Mappt die Gesamtmenge der herzustellenden Wirkstoff-Verordnung"
    },
    {
      "name" : "medicationIngredient",
      "source" : [{
        "context" : "kbvMedicationIngredient",
        "element" : "ingredient",
        "variable" : "ingredientVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "ingredient",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "ingredientVar"
        }]
      }],
      "documentation" : "Kopiert die detaillierten Wirkstoffinformationen mit Konzentrationen und Mengenangaben"
    }]
  }]
}

```
