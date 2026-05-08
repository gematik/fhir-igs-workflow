# E-T-Rezept Structure Map for Medication - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for Medication**

## StructureMap: E-T-Rezept Structure Map for Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapGEMMedication | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapGEMMedication |

 
Maps GEM ERP Medication to BfArM T-Prescription Medication format 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapGEMMedication",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapGEMMedication",
  "version" : "1.0.0-draft",
  "name" : "ERPTPrescriptionStructureMapGEMMedication",
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
  "description" : "Maps GEM ERP Medication to BfArM T-Prescription Medication format",
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
    "alias" : "gematikMedication"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "target",
    "alias" : "bfarmMedication"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapGEMMedication",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von gematik ERP-Medikamenten zu BfArM T-Prescription Format",
    "input" : [{
      "name" : "gematikMedication",
      "type" : "gematikMedication",
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
        "context" : "gematikMedication",
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
      "name" : "mapContainedRessources",
      "source" : [{
        "context" : "gematikMedication",
        "element" : "contained",
        "variable" : "ContainedVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "contained",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "ContainedVar"
        }]
      }],
      "documentation" : "Kopiert eingebettete Ressourcen (z.B. referenzierte Medications oder Organizations)"
    },
    {
      "name" : "medicationExtension",
      "source" : [{
        "context" : "gematikMedication",
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
          "documentation" : "Kopiert den Wert der Normgröße-Extension"
        }],
        "documentation" : "Übernimmt die Normgröße-Extension unverändert (deutsche Packungsgrößenangabe N1, N2, N3)"
      },
      {
        "name" : "copyPackagingExtensionUrl",
        "source" : [{
          "context" : "extVar",
          "condition" : "url='https://gematik.de/fhir/epa-medication/StructureDefinition/medication-formulation-packaging-extension'"
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
          "documentation" : "Kopiert den Wert der Verpackungs-Extension"
        }],
        "documentation" : "Übernimmt die gematik-Verpackungs-Extension für Formulierungen"
      }],
      "documentation" : "Mappt gematik-spezifische Medication-Extensions zu BfArM-Format"
    },
    {
      "name" : "medicationCode",
      "source" : [{
        "context" : "gematikMedication",
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
      "documentation" : "Kopiert den Medikamentencode (PZN oder andere Identifikation) des abgegebenen Arzneimittels"
    },
    {
      "name" : "medicationForm",
      "source" : [{
        "context" : "gematikMedication",
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
      "documentation" : "Übernimmt die Darreichungsform des tatsächlich abgegebenen Arzneimittels"
    },
    {
      "name" : "medicationAmount",
      "source" : [{
        "context" : "gematikMedication",
        "element" : "amount",
        "variable" : "amountVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "amount",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "amountVar"
        }]
      }],
      "documentation" : "Kopiert die Mengenangaben des abgegebenen Arzneimittels (tatsächlich ausgehändigte Menge)"
    },
    {
      "name" : "medicationIngredient",
      "source" : [{
        "context" : "gematikMedication",
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
      "documentation" : "Übernimmt Wirkstoffinformationen des abgegebenen Arzneimittels (falls vorhanden)"
    }]
  }]
}

```
