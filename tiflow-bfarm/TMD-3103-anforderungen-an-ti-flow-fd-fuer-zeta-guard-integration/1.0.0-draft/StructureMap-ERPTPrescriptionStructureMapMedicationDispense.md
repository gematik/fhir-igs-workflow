# E-T-Rezept Structure Map for MedicationDispense - TIFlow - Datenaustausch BfArM Webdienst v1.0.0-draft

TIFlow - Datenaustausch BfArM Webdienst

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for MedicationDispense**

## StructureMap: E-T-Rezept Structure Map for MedicationDispense 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedicationDispense | *Version*:1.0.0-draft |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapMedicationDispense |

 
Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapMedicationDispense",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedicationDispense",
  "version" : "1.0.0-draft",
  "name" : "ERPTPrescriptionStructureMapMedicationDispense",
  "title" : "E-T-Rezept Structure Map for MedicationDispense",
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
  "description" : "Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/MedicationDispense",
    "mode" : "source",
    "alias" : "gematikMedicationDispense"
  },
  {
    "url" : "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-dispense",
    "mode" : "target",
    "alias" : "bfarmMedicationDispense"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapMedicationDispense",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von gematik ERP MedicationDispense zu BfArM T-Prescription MedicationDispense",
    "input" : [{
      "name" : "gematikMedicationDispense",
      "type" : "gematikMedicationDispense",
      "mode" : "source"
    },
    {
      "name" : "bfarmMedicationDispense",
      "type" : "bfarmMedicationDispense",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "medicationDispenseExt",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "extension",
        "variable" : "extDosageMetaVar",
        "condition" : "url='http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta'"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "extension",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "extDosageMetaVar"
        }]
      }],
      "documentation" : "Kopiert Dosage Metadata Extension"
    },
    {
      "name" : "medicationDispenseExt",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "extension",
        "variable" : "extDosageRenderedVar",
        "condition" : "url='http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationDispense.renderedDosageInstruction'"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "extension",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "extDosageRenderedVar"
        }]
      }],
      "documentation" : "Kopiert RenderedDosageText"
    },
    {
      "name" : "medicationDispenseDosageInstruction",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "dosageInstruction",
        "variable" : "dosageInstructionVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "dosageInstruction",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "dosageInstructionVar"
        }]
      }],
      "documentation" : "Übernimmt die Dosierungsanweisungen aus der ursprünglichen Abgabe für den digitalen Durchschlag"
    },
    {
      "name" : "medicationDispenseWhenHandedOver",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "whenHandedOver",
        "variable" : "whenHandedOverVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "whenHandedOver",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "whenHandedOverVar"
        }]
      }],
      "documentation" : "Kopiert das Abgabedatum zur Dokumentation des Zeitpunkts der Medikamentenausgabe"
    },
    {
      "name" : "medicationReference",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "medication",
        "variable" : "medicationVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "medication",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "medicationVar"
        }]
      }],
      "documentation" : "Kopiert die Medikamentenreferenz - das referenzierte Medication wird separat gemappt"
    },
    {
      "name" : "medicationDispenseStatus",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "status",
        "variable" : "gematikMedicationDispenseStatus"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "completed"
        }]
      }],
      "documentation" : "Setzt den Status auf 'completed' da die Abgabe bereits erfolgt ist (digitaler Durchschlag)"
    },
    {
      "name" : "medicationDispenseQuantity",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "quantity",
        "variable" : "quantityVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "quantity",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "quantityVar"
        }]
      }],
      "documentation" : "Übernimmt die abgegebene Menge zur Dokumentation der tatsächlich ausgehändigten Medikamentenmenge"
    },
    {
      "name" : "medicationDispensePerformer",
      "source" : [{
        "context" : "gematikMedicationDispense",
        "element" : "performer",
        "variable" : "srcPerformerVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationDispense",
        "contextType" : "variable",
        "element" : "performer",
        "variable" : "tgtPerformerVar"
      }],
      "rule" : [{
        "name" : "medicationDispensePerformerActor",
        "source" : [{
          "context" : "srcPerformerVar",
          "element" : "actor",
          "variable" : "srcPerformerActorVar"
        }],
        "target" : [{
          "context" : "tgtPerformerVar",
          "contextType" : "variable",
          "element" : "actor",
          "variable" : "tgtPerformerActorVar"
        }],
        "rule" : [{
          "name" : "medicationDispensePerformerActorIdentifier",
          "source" : [{
            "context" : "srcPerformerActorVar",
            "element" : "identifier",
            "variable" : "srcPerformerActorIdentifierVar"
          }],
          "rule" : [{
            "name" : "medicationDispensePerformerActorIdentifierValue",
            "source" : [{
              "context" : "srcPerformerActorIdentifierVar",
              "element" : "value",
              "variable" : "srcPerformerActorIdentifierValueVar"
            }],
            "target" : [{
              "context" : "tgtPerformerActorVar",
              "contextType" : "variable",
              "element" : "reference",
              "transform" : "append",
              "parameter" : [{
                "valueString" : "Organization/"
              },
              {
                "valueId" : "srcPerformerActorIdentifierValueVar"
              }]
            }],
            "documentation" : "Wandelt Apotheken-Identifier in Organization-Referenz um (Organization/<telematik-id>)"
          }],
          "documentation" : "Extrahiert den Identifier der abgebenden Apotheke"
        }],
        "documentation" : "Verarbeitet den Actor (abgebende Apotheke) des Performers"
      }],
      "documentation" : "Transformiert Apotheken-Identifier zu Organization-Referenz für eindeutige Zuordnung der abgebenden Apotheke"
    }]
  }]
}

```
