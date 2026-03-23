# E-T-Rezept Structure Map for CarbonCopy - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-T-Rezept Structure Map for CarbonCopy**

## StructureMap: E-T-Rezept Structure Map for CarbonCopy 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapCarbonCopy | *Version*:0.9.0 |
| Active as of 2025-12-19 | *Computable Name*:ERPTPrescriptionStructureMapCarbonCopy |

 
Diese Ressource beschreibt das Mapping und führt die Mappings aller Teilressourcen zusammen. Weitere Informationen und Beschreibungen zum Mapping können auf der Seite [Mapping des digitalen Durchschlag E-T-Rezept](./menu-technische-umsetzung-mapping.md#mapping-des-digitalen-durchschlags-e-t-rezept) eingesehen werden. 



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "ERPTPrescriptionStructureMapCarbonCopy",
  "url" : "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapCarbonCopy",
  "version" : "0.9.0",
  "name" : "ERPTPrescriptionStructureMapCarbonCopy",
  "title" : "E-T-Rezept Structure Map for CarbonCopy",
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
  "description" : "Diese Ressource beschreibt das Mapping und führt die Mappings aller Teilressourcen zusammen. Weitere Informationen und Beschreibungen zum Mapping können auf der Seite [Mapping des digitalen Durchschlag E-T-Rezept](./menu-technische-umsetzung-mapping.html#mapping-des-digitalen-durchschlags-e-t-rezept) eingesehen werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "structure" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/Bundle",
    "mode" : "source",
    "alias" : "bundle"
  },
  {
    "url" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-carbon-copy",
    "mode" : "target",
    "alias" : "erpTCarbonCopy"
  }],
  "import" : ["https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedicationDispense",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedicationRequest",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapOrganization",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapTask",
  "https://gematik.de/fhir/erp-t-prescription/StructureMap/ERPTPrescriptionStructureMapMedication"],
  "group" : [{
    "name" : "erpTPrescriptionCarbonCopy",
    "typeMode" : "none",
    "documentation" : "Mapping des digitalen Durchschlags T-Rezept aus einem E-Rezept Bundle in das BfArM CarbonCopy Format",
    "input" : [{
      "name" : "bundle",
      "type" : "bundle",
      "mode" : "source"
    },
    {
      "name" : "erpTCarbonCopy",
      "type" : "erpTCarbonCopy",
      "mode" : "target"
    }],
    "rule" : [{
      "name" : "tgtMeta",
      "source" : [{
        "context" : "bundle"
      }],
      "target" : [{
        "context" : "erpTCarbonCopy",
        "contextType" : "variable",
        "element" : "meta",
        "variable" : "erpTCarbonCopyMeta"
      }],
      "rule" : [{
        "name" : "tgtMetaProfile",
        "source" : [{
          "context" : "bundle"
        }],
        "target" : [{
          "context" : "erpTCarbonCopyMeta",
          "contextType" : "variable",
          "element" : "profile",
          "transform" : "copy",
          "parameter" : [{
            "valueString" : "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-carbon-copy|1.1"
          }]
        }],
        "documentation" : "Setzt das meta.profile des digitalen Durchschlags T-Rezept"
      }],
      "documentation" : "Setzt die Metadaten für den digitalen Durchschlag"
    },
    {
      "name" : "rxPrescriptionRule",
      "source" : [{
        "context" : "bundle"
      }],
      "target" : [{
        "context" : "erpTCarbonCopy",
        "contextType" : "variable",
        "element" : "parameter",
        "variable" : "tgtRxPrescription"
      },
      {
        "context" : "tgtRxPrescription",
        "contextType" : "variable",
        "element" : "part",
        "variable" : "tgtRxPrescriptionPartId"
      },
      {
        "context" : "tgtRxPrescription",
        "contextType" : "variable",
        "element" : "part",
        "variable" : "tgtRxPrescriptionPartMR"
      },
      {
        "context" : "tgtRxPrescription",
        "contextType" : "variable",
        "element" : "part",
        "variable" : "tgtRxPrescriptionPartMed"
      },
      {
        "context" : "tgtRxPrescription",
        "contextType" : "variable",
        "element" : "name",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "rxPrescription"
        }]
      }],
      "rule" : [{
        "name" : "bundleEntries",
        "source" : [{
          "context" : "bundle",
          "element" : "entry",
          "variable" : "srcEntryVar"
        }],
        "rule" : [{
          "name" : "rxPrescriptionParameter",
          "source" : [{
            "context" : "srcEntryVar",
            "element" : "resource",
            "variable" : "srcEntryResourceVar"
          }],
          "rule" : [{
            "name" : "parameterrXPrescriptionPart",
            "source" : [{
              "context" : "srcEntryResourceVar",
              "variable" : "srcEntryTaskVar",
              "condition" : "ofType(Task)"
            }],
            "target" : [{
              "context" : "tgtRxPrescriptionPartId",
              "contextType" : "variable",
              "element" : "name",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "prescriptionId"
              }]
            },
            {
              "context" : "tgtRxPrescriptionPartId",
              "contextType" : "variable",
              "element" : "value",
              "variable" : "newIdentifier",
              "transform" : "create",
              "parameter" : [{
                "valueString" : "Identifier"
              }]
            }],
            "rule" : [{
              "name" : "parameterrXPrescriptionPartIdentifier",
              "source" : [{
                "context" : "srcEntryTaskVar"
              }],
              "dependent" : [{
                "name" : "ERPTPrescriptionStructureMapTask",
                "variable" : ["srcEntryTaskVar", "newIdentifier"]
              }],
              "documentation" : "Mappt Task-Informationen auf Identifier für die Rezept-ID"
            }],
            "documentation" : "Extrahiert die E-Rezept-ID aus dem Task und erstellt den prescriptionId Parameter"
          },
          {
            "name" : "entryMedicationRequest",
            "source" : [{
              "context" : "srcEntryResourceVar",
              "variable" : "srcEntryBundleMRVar",
              "condition" : "ofType(MedicationRequest)"
            }],
            "target" : [{
              "context" : "tgtRxPrescriptionPartMR",
              "contextType" : "variable",
              "element" : "name",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "medicationRequest"
              }]
            }],
            "rule" : [{
              "name" : "entryMedicationRequestPart",
              "source" : [{
                "context" : "srcEntryBundleMRVar"
              }],
              "target" : [{
                "context" : "tgtRxPrescriptionPartMR",
                "contextType" : "variable",
                "element" : "resource",
                "variable" : "newMedicationRequest",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "MedicationRequest"
                }]
              }],
              "rule" : [{
                "name" : "entryMedicationRequestPartResourceSet",
                "source" : [{
                  "context" : "srcEntryBundleMRVar"
                }],
                "dependent" : [{
                  "name" : "ERPTPrescriptionStructureMapMedicationRequest",
                  "variable" : ["srcEntryBundleMRVar", "newMedicationRequest"]
                }],
                "documentation" : "Führt die detaillierte MedicationRequest-Transformation durch"
              }],
              "documentation" : "Transformiert KBV-MedicationRequest in BfArM MedicationRequest Format"
            }],
            "documentation" : "Erstellt den medicationRequest Parameter für Verschreibungsdetails"
          },
          {
            "name" : "entryMedicationRequestMedication",
            "source" : [{
              "context" : "srcEntryVar",
              "variable" : "srcMedicationRequestId",
              "condition" : "resource.ofType(MedicationRequest)"
            }],
            "target" : [{
              "context" : "tgtRxPrescriptionPartMed",
              "contextType" : "variable",
              "element" : "name",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "medication"
              }]
            }],
            "rule" : [{
              "name" : "prepMedication",
              "source" : [{
                "context" : "bundle",
                "element" : "entry",
                "variable" : "srcEntryVar2"
              }],
              "rule" : [{
                "name" : "entryMedicationPrescriptionMedicationPart",
                "source" : [{
                  "context" : "srcEntryVar2",
                  "variable" : "srcEntryBundleMRMedIdVar",
                  "condition" : "resource.ofType(Medication).where(id=%srcMedicationRequestId.resource.medicationReference.reference.replace('urn:uuid:', '').split('/').last())"
                }],
                "target" : [{
                  "context" : "tgtRxPrescriptionPartMed",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "newMedicationPrescriptionMedication",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "Medication"
                  }]
                }],
                "rule" : [{
                  "name" : "entryMedicationPrescriptionMedicationPartResourceSet",
                  "source" : [{
                    "context" : "srcEntryBundleMRMedIdVar",
                    "element" : "resource",
                    "variable" : "srcEntryBundleMRMedIdVarRes"
                  }],
                  "dependent" : [{
                    "name" : "ERPTPrescriptionStructureMapMedication",
                    "variable" : ["srcEntryBundleMRMedIdVarRes",
                    "newMedicationPrescriptionMedication"]
                  }],
                  "documentation" : "Führt die detaillierte Medication-Transformation für das verschriebene Arzneimittel durch"
                }],
                "documentation" : "Findet die vom MedicationRequest referenzierte Medication und transformiert sie in BfArM Format"
              }],
              "documentation" : "Bereitet die Suche nach der referenzierten Medication vor"
            }],
            "documentation" : "Erstellt den medication Parameter für das verschriebene Arzneimittel"
          }],
          "documentation" : "Extrahiert relevante Ressourcen für die Verschreibung"
        }],
        "documentation" : "Verarbeitet alle Einträge des Quell-Bundles für Verschreibungsinformationen"
      }],
      "documentation" : "Erstellt den rxPrescription Parameter mit allen Verschreibungsinformationen"
    },
    {
      "name" : "MedicationDispenseFromBundle",
      "source" : [{
        "context" : "bundle"
      }],
      "target" : [{
        "context" : "erpTCarbonCopy",
        "contextType" : "variable",
        "element" : "parameter",
        "variable" : "tgtRxDispensation"
      },
      {
        "context" : "tgtRxDispensation",
        "contextType" : "variable",
        "element" : "part",
        "variable" : "tgtRxDispensationPartOrg"
      },
      {
        "context" : "tgtRxDispensation",
        "contextType" : "variable",
        "element" : "name",
        "transform" : "copy",
        "parameter" : [{
          "valueString" : "rxDispensation"
        }]
      }],
      "rule" : [{
        "name" : "bundleEntries",
        "source" : [{
          "context" : "bundle",
          "element" : "entry",
          "variable" : "srcEntryVar"
        }],
        "rule" : [{
          "name" : "rxDispensationParameter",
          "source" : [{
            "context" : "srcEntryVar",
            "element" : "resource",
            "variable" : "srcEntryResourceVar"
          }],
          "rule" : [{
            "name" : "entryVZDSearchSet",
            "source" : [{
              "context" : "srcEntryResourceVar",
              "variable" : "srcEntryBundleOrgVar",
              "condition" : "ofType(Bundle).where(entry.first().fullUrl.contains('fhir-directory'))"
            }],
            "target" : [{
              "context" : "tgtRxDispensationPartOrg",
              "contextType" : "variable",
              "element" : "name",
              "transform" : "copy",
              "parameter" : [{
                "valueString" : "dispenseOrganization"
              }]
            }],
            "rule" : [{
              "name" : "entryOrganizationPart",
              "source" : [{
                "context" : "srcEntryBundleOrgVar"
              }],
              "target" : [{
                "context" : "tgtRxDispensationPartOrg",
                "contextType" : "variable",
                "element" : "resource",
                "variable" : "newOrganization",
                "transform" : "create",
                "parameter" : [{
                  "valueString" : "Organization"
                }]
              }],
              "rule" : [{
                "name" : "entryOrganizationPartResourceSet",
                "source" : [{
                  "context" : "srcEntryBundleOrgVar"
                }],
                "dependent" : [{
                  "name" : "ERPTPrescriptionStructureMapOrganization",
                  "variable" : ["srcEntryBundleOrgVar", "newOrganization"]
                }],
                "documentation" : "Führt die detaillierte Organization-Transformation durch"
              }],
              "documentation" : "Transformiert VZD SearchSet in BfArM Organization Format für die abgebende Apotheke"
            }],
            "documentation" : "Identifiziert VZD SearchSet Bundle für Apothekeninformationen"
          },
          {
            "name" : "entryMedicationDispense",
            "source" : [{
              "context" : "srcEntryResourceVar",
              "variable" : "srcEntryBundleMDVar",
              "condition" : "ofType(MedicationDispense)"
            }],
            "target" : [{
              "context" : "tgtRxDispensation",
              "contextType" : "variable",
              "element" : "part",
              "variable" : "tgtDispenseInformationPart"
            }],
            "rule" : [{
              "name" : "entryDispenseInformation",
              "source" : [{
                "context" : "srcEntryBundleMDVar"
              }],
              "target" : [{
                "context" : "tgtDispenseInformationPart",
                "contextType" : "variable",
                "element" : "name",
                "transform" : "copy",
                "parameter" : [{
                  "valueString" : "dispenseInformation"
                }]
              },
              {
                "context" : "tgtDispenseInformationPart",
                "contextType" : "variable",
                "element" : "part",
                "variable" : "tgtDispenseInformationMedDispPart"
              },
              {
                "context" : "tgtDispenseInformationPart",
                "contextType" : "variable",
                "element" : "part",
                "variable" : "tgtDispenseInformationMedicationPart"
              }],
              "rule" : [{
                "name" : "entryDispenseInformationMedicationDispense",
                "source" : [{
                  "context" : "srcEntryBundleMDVar"
                }],
                "target" : [{
                  "context" : "tgtDispenseInformationMedDispPart",
                  "contextType" : "variable",
                  "element" : "name",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "medicationDispense"
                  }]
                },
                {
                  "context" : "tgtDispenseInformationMedDispPart",
                  "contextType" : "variable",
                  "element" : "resource",
                  "variable" : "newMedicationDispense",
                  "transform" : "create",
                  "parameter" : [{
                    "valueString" : "MedicationDispense"
                  }]
                }],
                "rule" : [{
                  "name" : "entryMedicationDispensePartResourceSet",
                  "source" : [{
                    "context" : "srcEntryBundleMDVar"
                  }],
                  "dependent" : [{
                    "name" : "ERPTPrescriptionStructureMapMedicationDispense",
                    "variable" : ["srcEntryBundleMDVar", "newMedicationDispense"]
                  }],
                  "documentation" : "Führt die detaillierte MedicationDispense-Transformation durch"
                }],
                "documentation" : "Transformiert gematik MedicationDispense in BfArM MedicationDispense Format"
              },
              {
                "name" : "entryDispenseInformationMedication",
                "source" : [{
                  "context" : "srcEntryBundleMDVar"
                }],
                "target" : [{
                  "context" : "tgtDispenseInformationMedicationPart",
                  "contextType" : "variable",
                  "element" : "name",
                  "transform" : "copy",
                  "parameter" : [{
                    "valueString" : "medication"
                  }]
                }],
                "rule" : [{
                  "name" : "prepDispenseMedication",
                  "source" : [{
                    "context" : "bundle",
                    "element" : "entry",
                    "variable" : "srcEntryVarDisp"
                  }],
                  "rule" : [{
                    "name" : "entryDispenseMedicationPart",
                    "source" : [{
                      "context" : "srcEntryVarDisp",
                      "variable" : "srcEntryBundleMDMedIdVar",
                      "condition" : "resource.ofType(Medication).where(id=%srcEntryBundleMDVar.medicationReference.reference.replace('urn:uuid:', '').split('/').last())"
                    }],
                    "target" : [{
                      "context" : "tgtDispenseInformationMedicationPart",
                      "contextType" : "variable",
                      "element" : "resource",
                      "variable" : "newMedicationDispensationMedication",
                      "transform" : "create",
                      "parameter" : [{
                        "valueString" : "Medication"
                      }]
                    }],
                    "rule" : [{
                      "name" : "entryMedicationDispensationMedicationPartResourceSet",
                      "source" : [{
                        "context" : "srcEntryBundleMDMedIdVar",
                        "element" : "resource",
                        "variable" : "srcEntryBundleMDMedIdVarRes"
                      }],
                      "dependent" : [{
                        "name" : "ERPTPrescriptionStructureMapMedication",
                        "variable" : ["srcEntryBundleMDMedIdVarRes",
                        "newMedicationDispensationMedication"]
                      }],
                      "documentation" : "Führt die detaillierte Medication-Transformation für das abgegebene Arzneimittel durch"
                    }]
                  }],
                  "documentation" : "Bereitet die Suche nach der referenzierten Medication im Bundle vor"
                }],
                "documentation" : "Findet die vom MedicationDispense referenzierte Medication und transformiert sie in BfArM Format"
              }],
              "documentation" : "Bündelt MedicationDispense und zugehörige Medication unter dispenseInformation"
            }],
            "documentation" : "Erstellt eine dispenseInformation Part pro abgegebener MedicationDispense"
          }],
          "documentation" : "Extrahiert relevante Ressourcen für die Abgabe"
        }],
        "documentation" : "Verarbeitet alle Einträge des Quell-Bundles für Abgabeinformationen"
      }],
      "documentation" : "Erstellt den rxDispensation Parameter mit allen Abgabeinformationen"
    }]
  }]
}

```
