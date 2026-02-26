# E-T-Rezept Structure Map for KBV FreeText Medication - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for KBV FreeText Medication**

## StructureMap: E-T-Rezept Structure Map for KBV FreeText Medication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVFreeTextMedication | *Version*:1.0.0 |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapKBVFreeTextMedication |

 
Maps KBV FreeText Medication to BfArM T-Prescription Medication format 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapKBVFreeTextMedication",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapKBVFreeTextMedication",
  "version" : "1.0.0",
  "name" : "ERPTPrescriptionStructureMapKBVFreeTextMedication",
  "title" : "E-T-Rezept Structure Map for KBV FreeText Medication",
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
  "description" : "Maps KBV FreeText Medication to BfArM T-Prescription Medication format",
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
    "alias" : "kbvMedicationFreeText"
  },
  {
    "url" : "http://hl7.org/fhir/StructureDefinition/Medication",
    "mode" : "target",
    "alias" : "bfarmMedication"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapKBVFreeTextMedication",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von KBV Freitext-Medikamenten zu BfArM T-Prescription Format",
    "input" : [{
      "name" : "kbvMedicationFreeText",
      "type" : "kbvMedicationFreeText",
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
        "context" : "kbvMedicationFreeText",
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
        "context" : "kbvMedicationFreeText",
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
        "documentation" : "Kopiert die Freitext-Bezeichnung des Medikaments (z.B. 'Aspirin 500mg Tabletten')"
      }],
      "documentation" : "Mappt den Medikamentencode mit Freitext-Beschreibung"
    },
    {
      "name" : "medicationForm",
      "source" : [{
        "context" : "kbvMedicationFreeText",
        "element" : "form",
        "variable" : "srcFormVar"
      }],
      "target" : [{
        "context" : "bfarmMedication",
        "contextType" : "variable",
        "element" : "form",
        "variable" : "tgtFormVar"
      }],
      "rule" : [{
        "name" : "medicationFormText",
        "source" : [{
          "context" : "srcFormVar",
          "element" : "text",
          "variable" : "srcformTextVar"
        }],
        "target" : [{
          "context" : "tgtFormVar",
          "contextType" : "variable",
          "element" : "text",
          "transform" : "copy",
          "parameter" : [{
            "valueId" : "srcformTextVar"
          }]
        }],
        "documentation" : "Übernimmt die Freitext-Darreichungsform (z.B. 'Tabletten', 'Tropfen zum Einnehmen')"
      }],
      "documentation" : "Mappt die Darreichungsform als Freitext"
    }]
  }]
}

```
