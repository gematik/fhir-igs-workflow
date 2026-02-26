# E-T-Rezept Structure Map for KBV PZN Medication - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for KBV PZN Medication**

## StructureMap: E-T-Rezept Structure Map for KBV PZN Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVPZNMedication | *Version*:1.0.0 |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapKBVPZNMedication |

 
Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapKBVPZNMedication",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVPZNMedication",
  "version" : "1.0.0",
  "name" : "ERPTPrescriptionStructureMapKBVPZNMedication",
  "title" : "E-T-Rezept Structure Map for KBV PZN Medication",
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
  "description" : "Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format",
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
    "alias" : "kbvMedicationPZN"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "target",
    "alias" : "bfarmMedication"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapKBVPZNMedication",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von KBV PZN-Medikamenten zu BfArM T-Prescription Format",
    "input" : [{
      "name" : "kbvMedicationPZN",
      "type" : "kbvMedicationPZN",
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
        "context" : "kbvMedicationPZN",
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
        "name" : "copyNormgroesseExtensionUrl",
        "source" : [{
          "context" : "extVar",
          "condition" : "url='http://fhir.de/StructureDefinition/normgroesse'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "http://fhir.de/StructureDefinition/normgroesse"
          }]
        }],
        "rule" : [{
          "name" : "copyExtensionValue",
          "source" : [{
            "context" : "extVar",
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
          "documentation" : "Kopiert den Wert der Normgröße-Extension (N1, N2, N3)"
        }],
        "documentation" : "Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe)"
      }],
      "documentation" : "Mappt Medication-Extensions von KBV- zu BfArM-Format"
    },
    {
      "name" : "medicationId",
      "source" : [{
        "context" : "kbvMedicationPZN",
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
        "context" : "kbvMedicationPZN",
        "element" : "code",
        "variable" : "codeVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "code",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "codeVar"
        }]
      }],
      "documentation" : "Kopiert den Medikamentencode (PZN - Pharmazentralnummer) für die eindeutige Identifikation"
    },
    {
      "name" : "medicationForm",
      "source" : [{
        "context" : "kbvMedicationPZN",
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
      "documentation" : "Übernimmt die Darreichungsform (Tabletten, Kapseln, Tropfen, etc.)"
    },
    {
      "name" : "medicationAmount",
      "source" : [{
        "context" : "kbvMedicationPZN",
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
        "documentation" : "Kopiert den Nenner der Mengenangabe (z.B. '1' für 'pro Packung')"
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
              "documentation" : "Übernimmt den Packungsgrößenwert unverändert"
            }],
            "documentation" : "Wandelt KBV-Packungsgrößen-Extension in gematik EPA-Medication Extension um"
          }],
          "documentation" : "Transformiert Packungsgrößen-Extensions von KBV- zu gematik-Format"
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
          "documentation" : "Kopiert den numerischen Wert der Menge (z.B. '20' für 20 Tabletten)"
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
          "documentation" : "Übernimmt die Mengeneinheit (Stück, ml, g, etc.)"
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
        "documentation" : "Mappt den Zähler der Mengenangabe mit allen Details (Wert, Einheit, Extensions)"
      }],
      "documentation" : "Mappt die Mengenangaben des Fertigarzneimittels (Packungsgröße und Inhalt)"
    },
    {
      "name" : "medicationIngredient",
      "source" : [{
        "context" : "kbvMedicationPZN",
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
      "documentation" : "Kopiert Wirkstoffinformationen (bei PZN-Medikamenten meist nicht detailliert angegeben)"
    }]
  }]
}

```
