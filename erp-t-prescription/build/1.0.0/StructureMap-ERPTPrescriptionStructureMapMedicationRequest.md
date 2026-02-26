# E-T-Rezept Structure Map for MedicationRequest - Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst v1.0.0

Datenaustausch E-Rezept-Fachdienst und BfArM Webdienst

Version 1.0.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for MedicationRequest**

## StructureMap: E-T-Rezept Structure Map for MedicationRequest 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedicationRequest | *Version*:1.0.0 |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapMedicationRequest |

 
Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapMedicationRequest",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedicationRequest",
  "version" : "1.0.0",
  "name" : "ERPTPrescriptionStructureMapMedicationRequest",
  "title" : "E-T-Rezept Structure Map for MedicationRequest",
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
  "description" : "Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription",
    "mode" : "source",
    "alias" : "kbvMedicationRequest"
  },
  {
    "url" : "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/erp-tprescription-medication-request",
    "mode" : "target",
    "alias" : "bfarmMedicationRequest"
  }],
  "group" : [{
    "name" : "ERPTPrescriptionStructureMapMedicationRequest",
    "typeMode" : "none",
    "documentation" : "Mapping-Anweisungen zur Transformation von KBV MedicationRequest zu BfArM T-Prescription MedicationRequest",
    "input" : [{
      "name" : "kbvMedicationRequest",
      "type" : "kbvMedicationRequest",
      "mode" : "source"
    },
    {
      "name" : "bfarmMedicationRequest",
      "type" : "bfarmMedicationRequest",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "medicationRequestStatus",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "status",
        "variable" : "srcStatus"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "status",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "completed"
        }]
      }],
      "documentation" : "Setzt den Status auf 'completed' für den digitalen Durchschlag (Verschreibung ist bereits abgeschlossen)"
    },
    {
      "name" : "medicationRequestIntent",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "intent"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "intent",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "order"
        }]
      }],
      "documentation" : "Setzt den Intent auf 'order' entsprechend der BfArM-Spezifikation für T-Prescription"
    },
    {
      "name" : "medicationRequestExt",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "extension",
        "variable" : "extVar",
        "condition" : "url='https://fhir.kbv.de/StructureDefinition/KBV_EX_ERP_Teratogenic'"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "extension",
        "variable" : "tgtExtVar"
      }],
      "rule" : [{
        "name" : "copyTPrescriptionExtensionUrl",
        "source" : [{
          "context" : "extVar",
          "variable" : "extMatchVar"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/teratogenic-extension"
          }]
        }],
        "documentation" : "Kopiert teratogene Extensions für T-Rezept Kennzeichnung"
      },
      {
        "name" : "mapOffLabelExtension",
        "source" : [{
          "context" : "extVar",
          "element" : "extension",
          "variable" : "offLabelVar",
          "condition" : "url='Off-Label'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtOffLabelExt",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtOffLabelExt",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "off-label"
          }]
        }],
        "rule" : [{
          "name" : "mapOffLabelValue",
          "source" : [{
            "context" : "offLabelVar",
            "element" : "value",
            "variable" : "offLabelValue"
          }],
          "target" : [{
            "context" : "tgtOffLabelExt",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "offLabelValue"
            }]
          }],
          "documentation" : "Übernimmt den Off-Label Booleschen Wert"
        }],
        "documentation" : "Mappt Off-Label Extension"
      },
      {
        "name" : "mapGebaerfaehigeFrauExtension",
        "source" : [{
          "context" : "extVar",
          "element" : "extension",
          "variable" : "gebaerfaehigeFrauVar",
          "condition" : "url='GebaerfaehigeFrau'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtGebaerfaehigeFrauExt",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtGebaerfaehigeFrauExt",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "childbearing-potential"
          }]
        }],
        "rule" : [{
          "name" : "mapGebaerfaehigeFrauValue",
          "source" : [{
            "context" : "gebaerfaehigeFrauVar",
            "element" : "value",
            "variable" : "gebaerfaehigeFrauValue"
          }],
          "target" : [{
            "context" : "tgtGebaerfaehigeFrauExt",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "gebaerfaehigeFrauValue"
            }]
          }],
          "documentation" : "Übernimmt den Booleschen Wert für childbearing-potential"
        }],
        "documentation" : "Mappt GebaerfaehigeFrau Extension zu childbearing-potential"
      },
      {
        "name" : "mapEinhaltungSicherheitsmassnahmenExtension",
        "source" : [{
          "context" : "extVar",
          "element" : "extension",
          "variable" : "sicherheitsVar",
          "condition" : "url='EinhaltungSicherheitsmassnahmen'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtSicherheitsExt",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtSicherheitsExt",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "security-compliance"
          }]
        }],
        "rule" : [{
          "name" : "mapEinhaltungSicherheitsmassnahmenValue",
          "source" : [{
            "context" : "sicherheitsVar",
            "element" : "value",
            "variable" : "sicherheitsValue"
          }],
          "target" : [{
            "context" : "tgtSicherheitsExt",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "sicherheitsValue"
            }]
          }],
          "documentation" : "Übernimmt den Booleschen Wert für security-compliance"
        }],
        "documentation" : "Mappt EinhaltungSicherheitsmassnahmen Extension zu security-compliance"
      },
      {
        "name" : "mapAushaendigungInformationsmaterialienExtension",
        "source" : [{
          "context" : "extVar",
          "element" : "extension",
          "variable" : "infoMatVar",
          "condition" : "url='AushaendigungInformationsmaterialien'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtInfoMatExt",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtInfoMatExt",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "hand-out-information-material"
          }]
        }],
        "rule" : [{
          "name" : "mapAushaendigungInformationsmaterialienValue",
          "source" : [{
            "context" : "infoMatVar",
            "element" : "value",
            "variable" : "infoMatValue"
          }],
          "target" : [{
            "context" : "tgtInfoMatExt",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "infoMatValue"
            }]
          }],
          "documentation" : "Übernimmt den Booleschen Wert für hand-out-information-material"
        }],
        "documentation" : "Mappt AushaendigungInformationsmaterialien Extension zu hand-out-information-material"
      },
      {
        "name" : "mapErklaerungSachkenntnisExtension",
        "source" : [{
          "context" : "extVar",
          "element" : "extension",
          "variable" : "sachkenntnisVar",
          "condition" : "url='ErklaerungSachkenntnis'"
        }],
        "target" : [{
          "context" : "tgtExtVar",
          "contextType" : "variable",
          "element" : "extension",
          "variable" : "tgtSachkenntnisExt",
          "transform" : "create",
          "parameter" : [{
            "valueString" : "Extension"
          }]
        },
        {
          "context" : "tgtSachkenntnisExt",
          "contextType" : "variable",
          "element" : "url",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "declaration-of-expertise"
          }]
        }],
        "rule" : [{
          "name" : "mapErklaerungSachkenntnisValue",
          "source" : [{
            "context" : "sachkenntnisVar",
            "element" : "value",
            "variable" : "sachkenntnisValue"
          }],
          "target" : [{
            "context" : "tgtSachkenntnisExt",
            "contextType" : "variable",
            "element" : "value",
            "transform" : "copy",
            "parameter" : [{
              "valueId" : "sachkenntnisValue"
            }]
          }],
          "documentation" : "Übernimmt den Booleschen Wert für declaration-of-expertise"
        }],
        "documentation" : "Mappt ErklaerungSachkenntnis Extension zu declaration-of-expertise"
      }],
      "documentation" : "Mappt T-Rezept spezifische Extensions vom KBV- zum BfArM-Format"
    },
    {
      "name" : "medicationRequestExt",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "extension",
        "variable" : "extDosageMetaVar",
        "condition" : "url='http://ig.fhir.de/igs/medication/StructureDefinition/GeneratedDosageInstructionsMeta'"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
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
      "name" : "medicationRequestExt",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "extension",
        "variable" : "extDosageRenderedVar",
        "condition" : "url='http://hl7.org/fhir/5.0/StructureDefinition/extension-MedicationRequest.renderedDosageInstruction'"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
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
      "name" : "medicationRequestsubject",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "subject",
        "variable" : "srcSubject"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "subject",
        "variable" : "tgtSubject"
      }],
      "rule" : [{
        "name" : "medicationRequestsubjectIdentifier",
        "source" : [{
          "context" : "kbvMedicationRequest",
          "element" : "subject",
          "variable" : "srcSubject"
        }],
        "target" : [{
          "context" : "tgtSubject",
          "contextType" : "variable",
          "element" : "identifier",
          "variable" : "tgtSubjectIdentifier"
        }],
        "rule" : [{
          "name" : "medicationRequestsubjectIdentifierExtension",
          "source" : [{
            "context" : "kbvMedicationRequest",
            "element" : "subject",
            "variable" : "srcSubject"
          }],
          "target" : [{
            "context" : "tgtSubjectIdentifier",
            "contextType" : "variable",
            "element" : "system",
            "variable" : "tgtSubjectIdentifierSystem"
          },
          {
            "context" : "tgtSubjectIdentifier",
            "contextType" : "variable",
            "element" : "value",
            "variable" : "tgtSubjectIdentifierValue"
          }],
          "rule" : [{
            "name" : "medicationRequestsubjectIdentifierSystem",
            "source" : [{
              "context" : "kbvMedicationRequest",
              "element" : "subject",
              "variable" : "srcSubject"
            }],
            "target" : [{
              "context" : "tgtSubjectIdentifierSystem",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "tgtSubjectIdentifierSystemEx"
            },
            {
              "context" : "tgtSubjectIdentifierValue",
              "contextType" : "variable",
              "element" : "extension",
              "variable" : "tgtSubjectIdentifierValueEx"
            }],
            "rule" : [{
              "name" : "medicationRequestsubjectIdentifierSystemExtension",
              "source" : [{
                "context" : "kbvMedicationRequest",
                "element" : "subject",
                "variable" : "srcSubject"
              }],
              "target" : [{
                "context" : "tgtSubjectIdentifierSystemEx",
                "contextType" : "variable",
                "element" : "url",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                }]
              },
              {
                "context" : "tgtSubjectIdentifierSystemEx",
                "contextType" : "variable",
                "element" : "value",
                "transform" : "cast",
                "parameter" : [{
                  "valueString" : "not-permitted"
                },
                {
                  "valueString" : "code"
                }]
              }],
              "documentation" : "Setzt data-absent-reason auf 'not-permitted' um Patientendaten zu anonymisieren"
            },
            {
              "name" : "medicationRequestsubjectIdentifierValueExtension",
              "source" : [{
                "context" : "kbvMedicationRequest",
                "element" : "subject",
                "variable" : "srcSubject"
              }],
              "target" : [{
                "context" : "tgtSubjectIdentifierValueEx",
                "contextType" : "variable",
                "element" : "url",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
                }]
              },
              {
                "context" : "tgtSubjectIdentifierValueEx",
                "contextType" : "variable",
                "element" : "value",
                "transform" : "cast",
                "parameter" : [{
                  "valueString" : "not-permitted"
                },
                {
                  "valueString" : "code"
                }]
              }],
              "documentation" : "Setzt data-absent-reason auf 'not-permitted' um Patientendaten zu anonymisieren"
            }],
            "documentation" : "Erstellt data-absent-reason Extension für Subject Identifier"
          }],
          "documentation" : "Erstellt data-absent-reason Extension für Subject Identifier"
        }]
      }],
      "documentation" : "Entfernt Patientenbezug durch data-absent-reason Extension für Datenschutz im digitalen Durchschlag"
    },
    {
      "name" : "medicationRequestAuthoredOn",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "authoredOn",
        "variable" : "srcAuthoredOnVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "authoredOn",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcAuthoredOnVar"
        }]
      }],
      "documentation" : "Übernimmt das Verschreibungsdatum unverändert vom KBV MedicationRequest"
    },
    {
      "name" : "medicationRequestDosageInstruction",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "dosageInstruction",
        "variable" : "srcDosageInstructionVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "dosageInstruction",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcDosageInstructionVar"
        }]
      }],
      "documentation" : "Kopiert die Dosierungsanweisungen vollständig für den digitalen Durchschlag"
    },
    {
      "name" : "medicationRequestDispenseRequest",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "dispenseRequest",
        "variable" : "srcDispenseRequestVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "dispenseRequest",
        "transform" : "copy",
        "parameter" : [{
          "valueId" : "srcDispenseRequestVar"
        }]
      }],
      "documentation" : "Übernimmt Abgabeanweisungen (Menge, Wiederholungen) aus der ursprünglichen Verschreibung"
    },
    {
      "name" : "medicationReference",
      "source" : [{
        "context" : "kbvMedicationRequest",
        "element" : "medicationReference",
        "variable" : "medicationVar"
      }],
      "target" : [{
        "context" : "bfarmMedicationRequest",
        "contextType" : "variable",
        "element" : "medication",
        "variable" : "tgtMedicationReference",
        "transform" : "create",
        "parameter" : [{
          "valueString" : "Reference"
        }]
      }],
      "rule" : [{
        "name" : "normalizeMedicationReference",
        "source" : [{
          "context" : "medicationVar",
          "element" : "reference",
          "variable" : "medicationReferenceValue"
        }],
        "rule" : [{
          "name" : "normalizeMedicationReferenceTransformation",
          "source" : [{
            "context" : "medicationReferenceValue"
          }],
          "target" : [{
            "context" : "tgtMedicationReference",
            "contextType" : "variable",
            "element" : "reference",
            "transform" : "evaluate",
            "parameter" : [{
              "valueString" : "iif(%medicationReferenceValue.startsWith('urn:uuid:'), %medicationReferenceValue, 'urn:uuid:' & %medicationReferenceValue.replaceMatches('.*[:/]', ''))"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
