# KBVPrErpBundleMap - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **KBVPrErpBundleMap**

## StructureMap: KBVPrErpBundleMap 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpBundleMap | *Version*:1.0.0-draft |
| Draft as of 2026-02-02 | *Computable Name*:KBVPrErpBundleMap |

 

| | | |
| :--- | :--- | :--- |
| Auto-generated StructureMap for transformation KBV_PR_ERP_Bundle | 1.4.0 -> EPAOpProvidePrescriptionERPInputParameters | 1.3.0 |

 

### Feld-Mappings

| | | | |
| :--- | :--- | :--- | :--- |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.name` | Fester Wert | setzt festen Wert:`rxPrescription` |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.name` | Fester Wert | setzt festen Wert:`authoredOn` |
| `KBVPRERPBundle.entry.resource.authoredOn``[Bedingung: resource.meta.profile.where($this.contains('https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription')).exists()]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.value` | Kopiert | übernimmt Wert aus Quellvariable |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.name` | Fester Wert | setzt festen Wert:`medication` |
| `KBVPRERPBundle.entry``[Bedingung: resource is Medication]` | — | Dokumentiert | Bundle.entry:RezeptierdatenPZNVerordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_PZN|1.4.0 -> EPAMedication|1.3.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is Medication]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrErpMedicationPznMap](./StructureMap-KBVPrErpMedicationPznMap.md)Ressource: Medicationerstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
| `KBVPRERPBundle.entry``[Bedingung: resource is Medication]` | — | Dokumentiert | Bundle.entry:RezeptierdatenWirkstoffverordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is Medication]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrErpMedicationIngredientMap](./StructureMap-KBVPrErpMedicationIngredientMap.md)Ressource: Medicationerstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
| `KBVPRERPBundle.entry``[Bedingung: resource is Medication]` | — | Dokumentiert | Bundle.entry:RezeptierdatenRezepturverordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is Medication]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrErpMedicationCompoundingMap](./StructureMap-KBVPrErpMedicationCompoundingMap.md)Ressource: Medicationerstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
| `KBVPRERPBundle.entry``[Bedingung: resource is Medication]` | — | Dokumentiert | Bundle.entry:RezeptierdatenFreitextverordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is Medication]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrErpMedicationFreetextMap](./StructureMap-KBVPrErpMedicationFreetextMap.md)Ressource: Medicationerstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.name` | Fester Wert | setzt festen Wert:`medicationRequest` |
| `KBVPRERPBundle.entry``[Bedingung: resource is MedicationRequest]` | — | Dokumentiert | Bundle.entry:VerordnungArzneimittel.resource -> .parameter:rxPrescription.part:medicationRequest.resource using KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is MedicationRequest]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrErpPrescriptionMap](./StructureMap-KBVPrErpPrescriptionMap.md)Ressource: MedicationRequesterstellt neues https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.name` | Fester Wert | setzt festen Wert:`organization` |
| `KBVPRERPBundle.entry``[Bedingung: resource is Organization]` | — | Dokumentiert | Bundle.entry:Einrichtung.resource -> .parameter:rxPrescription.part:organization.resource using KBV_PR_FOR_Organization|1.3.0 -> OrganizationDirectory|1.0.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is Organization]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrForOrganizationMap](./StructureMap-KBVPrForOrganizationMap.md)Ressource: Organizationerstellt neues https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.name` | Fester Wert | setzt festen Wert:`practitioner` |
| `KBVPRERPBundle.entry``[Bedingung: resource is Practitioner]` | — | Dokumentiert | Bundle.entry:AusstellendeVerschreibendeVerantwortlichePerson.resource -> .parameter:rxPrescription.part:practitioner.resource using KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0 |
| `KBVPRERPBundle.entry.resource``[Bedingung: resource is Practitioner]` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.resource` | Erstellt · Delegiert | Verwendet StructureMap:[KBVPrForPractitionerMap](./StructureMap-KBVPrForPractitionerMap.md)Ressource: Practitionererstellt neues https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory |
| `KBVPRERPBundle` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.name` | Fester Wert | setzt festen Wert:`prescriptionId` |
| `KBVPRERPBundle.identifier.value` | `EPAOpProvidePrescriptionERPInputParameters.parameter.part.value` | Kopiert | übernimmt Wert aus Quellvariable |



## Resource Content

```json
{
  "resourceType" : "StructureMap",
  "id" : "KBVPrErpBundleMap",
  "url" : "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpBundleMap",
  "version" : "1.0.0-draft",
  "name" : "KBVPrErpBundleMap",
  "status" : "draft",
  "date" : "2026-02-02",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Auto-generated StructureMap for transformation KBV_PR_ERP_Bundle|1.4.0 -> EPAOpProvidePrescriptionERPInputParameters|1.3.0",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "structure" : [
    {
      "url" : "https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle",
      "mode" : "source",
      "alias" : "KBVPRERPBundle"
    },
    {
      "url" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-op-provide-prescription-erp-input-parameters",
      "mode" : "target",
      "alias" : "EPAOpProvidePrescriptionERPInputParameters"
    }
  ],
  "import" : [
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationCompoundingMap",
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationFreetextMap",
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationIngredientMap",
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpMedicationPznMap",
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrErpPrescriptionMap",
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrForOrganizationMap",
    "https://gematik.de/fhir/structure-comparer/StructureMap/KBVPrForPractitionerMap"
  ],
  "group" : [
    {
      "name" : "KBVPrErpBundleMap",
      "typeMode" : "types",
      "documentation" : "Transformation generated for KBV_PR_ERP_Bundle|1.4.0 -> EPAOpProvidePrescriptionERPInputParameters|1.3.0",
      "input" : [
        {
          "name" : "KBVPRERPBundle",
          "type" : "KBVPRERPBundle",
          "mode" : "source"
        },
        {
          "name" : "EPAOpProvidePrescriptionERPInputParameters",
          "type" : "EPAOpProvidePrescriptionERPInputParameters",
          "mode" : "target"
        }
      ],
      "rule" : [
        {
          "name" : "ParameterRxprescriptionContainer",
          "source" : [
            {
              "context" : "KBVPRERPBundle"
            }
          ],
          "target" : [
            {
              "context" : "EPAOpProvidePrescriptionERPInputParameters",
              "contextType" : "variable",
              "element" : "parameter",
              "variable" : "targetParameterRxprescriptionParameter77d85b46"
            }
          ],
          "rule" : [
            {
              "name" : "SetParameterRxprescriptionName",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "name",
                  "transform" : "copy",
                  "parameter" : [
                    {
                      "valueString" : "rxPrescription"
                    }
                  ]
                }
              ]
            },
            {
              "name" : "PartAuthoredonPartContainer",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "part",
                  "variable" : "targetPartAuthoredonPartb106c48f"
                }
              ],
              "rule" : [
                {
                  "name" : "SetPartAuthoredonName",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "targetPartAuthoredonPartb106c48f",
                      "contextType" : "variable",
                      "element" : "name",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "authoredOn"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "InlineParametersParameterRxprescriptionPartAuthoredonValueX1c6fc",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "inlinesourceParametersParameterRxprescriptionPartAuthoredonValue",
                      "condition" : "resource.meta.profile.where($this.contains('https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Prescription')).exists()"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "InlineParametersParameterRxprescriptionPartAuthoredonValueX1c6fc",
                      "source" : [
                        {
                          "context" : "inlinesourceParametersParameterRxprescriptionPartAuthoredonValue",
                          "element" : "resource",
                          "variable" : "inlinesourceParametersParameterRxprescriptionPartAuthoredonValue"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "InlineParametersParameterRxprescriptionPartAuthoredonValueX1c6fc",
                          "source" : [
                            {
                              "context" : "inlinesourceParametersParameterRxprescriptionPartAuthoredonValue",
                              "element" : "authoredOn",
                              "variable" : "inlinesourceParametersParameterRxprescriptionPartAuthoredonValue"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartAuthoredonPartb106c48f",
                              "contextType" : "variable",
                              "element" : "value",
                              "variable" : "inlinetargetParametersParameterRxprescriptionPartAuthoredonValue",
                              "transform" : "copy",
                              "parameter" : [
                                {
                                  "valueId" : "inlinesourceParametersParameterRxprescriptionPartAuthoredonValue"
                                }
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Automatic copy"
                }
              ],
              "documentation" : "Creates part:authoredOn part container aggregating 1 child rule(s)"
            },
            {
              "name" : "PartMedicationPartContainer",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "part",
                  "variable" : "targetPartMedicationPart88f31ec4"
                }
              ],
              "rule" : [
                {
                  "name" : "SetPartMedicationName",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "targetPartMedicationPart88f31ec4",
                      "contextType" : "variable",
                      "element" : "name",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "medication"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "BundleEntryRezeptierdatenpznverordnungResource7400f329",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryRezeptierdatenpznverordnungResource0Entry4c4ad0",
                      "condition" : "resource is Medication"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryRezeptierdatenpznverordnungResource7400f329",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryRezeptierdatenpznverordnungResource0Entry4c4ad0",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryRezeptierdatenpznverordnungResource1Resource3bd"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprerpmedicationpznmap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryRezeptierdatenpznverordnungResource1Resource3bd"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartMedicationPart88f31ec4",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartMedicationResourceResource38c62",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrErpMedicationPznMap",
                              "variable" : [
                                "sourceBundleEntryRezeptierdatenpznverordnungResource1Resource3bd",
                                "targetParameterRxprescriptionPartMedicationResourceResource38c62"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:RezeptierdatenPZNVerordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_PZN|1.4.0 -> EPAMedication|1.3.0"
                },
                {
                  "name" : "BundleEntryRezeptierdatenwirkstoffverordnungResource7400f329",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryRezeptierdatenwirkstoffverordnungResource0Ent6b",
                      "condition" : "resource is Medication"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryRezeptierdatenwirkstoffverordnungResource7400f329",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryRezeptierdatenwirkstoffverordnungResource0Ent6b",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryRezeptierdatenwirkstoffverordnungResource1Res9f"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprerpmedicationingredientmap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryRezeptierdatenwirkstoffverordnungResource1Res9f"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartMedicationPart88f31ec4",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartMedicationResourceResource38c62",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrErpMedicationIngredientMap",
                              "variable" : [
                                "sourceBundleEntryRezeptierdatenwirkstoffverordnungResource1Res9f",
                                "targetParameterRxprescriptionPartMedicationResourceResource38c62"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:RezeptierdatenWirkstoffverordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_Ingredient|1.4.0 -> EPAMedication|1.3.0"
                },
                {
                  "name" : "BundleEntryRezeptierdatenrezepturverordnungResource7400f329",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryRezeptierdatenrezepturverordnungResource0Entr83",
                      "condition" : "resource is Medication"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryRezeptierdatenrezepturverordnungResource7400f329",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryRezeptierdatenrezepturverordnungResource0Entr83",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryRezeptierdatenrezepturverordnungResource1Resocd"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprerpmedicationcompoundingmap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryRezeptierdatenrezepturverordnungResource1Resocd"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartMedicationPart88f31ec4",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartMedicationResourceResource38c62",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrErpMedicationCompoundingMap",
                              "variable" : [
                                "sourceBundleEntryRezeptierdatenrezepturverordnungResource1Resocd",
                                "targetParameterRxprescriptionPartMedicationResourceResource38c62"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:RezeptierdatenRezepturverordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_Compounding|1.4.0 -> EPAMedication|1.3.0"
                },
                {
                  "name" : "BundleEntryRezeptierdatenfreitextverordnungResource7400f329",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryRezeptierdatenfreitextverordnungResource0Entrb4",
                      "condition" : "resource is Medication"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryRezeptierdatenfreitextverordnungResource7400f329",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryRezeptierdatenfreitextverordnungResource0Entrb4",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryRezeptierdatenfreitextverordnungResource1Resob3"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprerpmedicationfreetextmap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryRezeptierdatenfreitextverordnungResource1Resob3"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartMedicationPart88f31ec4",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartMedicationResourceResource38c62",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrErpMedicationFreetextMap",
                              "variable" : [
                                "sourceBundleEntryRezeptierdatenfreitextverordnungResource1Resob3",
                                "targetParameterRxprescriptionPartMedicationResourceResource38c62"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:RezeptierdatenFreitextverordnung.resource -> .parameter:rxPrescription.part:medication.resource using KBV_PR_ERP_Medication_FreeText|1.4.0 -> EPAMedication|1.3.0"
                }
              ],
              "documentation" : "Creates part:medication part container aggregating 4 child rule(s)"
            },
            {
              "name" : "PartMedicationrequestPartContainer",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "part",
                  "variable" : "targetPartMedicationrequestPart3ea10d80"
                }
              ],
              "rule" : [
                {
                  "name" : "SetPartMedicationrequestName",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "targetPartMedicationrequestPart3ea10d80",
                      "contextType" : "variable",
                      "element" : "name",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "medicationRequest"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "BundleEntryVerordnungarzneimittelResource890c831b",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryVerordnungarzneimittelResource0Entry3c6c2e1b",
                      "condition" : "resource is MedicationRequest"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryVerordnungarzneimittelResource890c831b",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryVerordnungarzneimittelResource0Entry3c6c2e1b",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryVerordnungarzneimittelResource1Resource61f06fbc"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprerpprescriptionmap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryVerordnungarzneimittelResource1Resource61f06fbc"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartMedicationrequestPart3ea10d80",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartMedicationrequestResourceReso52",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/epa-medication/StructureDefinition/epa-medication-request"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrErpPrescriptionMap",
                              "variable" : [
                                "sourceBundleEntryVerordnungarzneimittelResource1Resource61f06fbc",
                                "targetParameterRxprescriptionPartMedicationrequestResourceReso52"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:VerordnungArzneimittel.resource -> .parameter:rxPrescription.part:medicationRequest.resource using KBV_PR_ERP_Prescription|1.4.0 -> EPAMedicationRequest|1.3.0"
                }
              ],
              "documentation" : "Creates part:medicationRequest part container aggregating 1 child rule(s)"
            },
            {
              "name" : "PartOrganizationPartContainer",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "part",
                  "variable" : "targetPartOrganizationPart5252e12d"
                }
              ],
              "rule" : [
                {
                  "name" : "SetPartOrganizationName",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "targetPartOrganizationPart5252e12d",
                      "contextType" : "variable",
                      "element" : "name",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "organization"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "BundleEntryEinrichtungResourceB36f36fb",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryEinrichtungResource0Entry6bfa77fa",
                      "condition" : "resource is Organization"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryEinrichtungResourceB36f36fb",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryEinrichtungResource0Entry6bfa77fa",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryEinrichtungResource1Resource45328e4f"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprfororganizationmap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryEinrichtungResource1Resource45328e4f"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartOrganizationPart5252e12d",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartOrganizationResourceResource43b",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/directory/StructureDefinition/OrganizationDirectory"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrForOrganizationMap",
                              "variable" : [
                                "sourceBundleEntryEinrichtungResource1Resource45328e4f",
                                "targetParameterRxprescriptionPartOrganizationResourceResource43b"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:Einrichtung.resource -> .parameter:rxPrescription.part:organization.resource using KBV_PR_FOR_Organization|1.3.0 -> OrganizationDirectory|1.0.0"
                }
              ],
              "documentation" : "Creates part:organization part container aggregating 1 child rule(s)"
            },
            {
              "name" : "PartPractitionerPartContainer",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "part",
                  "variable" : "targetPartPractitionerParte111e9d1"
                }
              ],
              "rule" : [
                {
                  "name" : "SetPartPractitionerName",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "targetPartPractitionerParte111e9d1",
                      "contextType" : "variable",
                      "element" : "name",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "practitioner"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "BundleEntryAusstellendeverschreibendeverantwortlichepersonResour",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "entry",
                      "variable" : "sourceBundleEntryAusstellendeverschreibendeverantwortlichepersb5",
                      "condition" : "resource is Practitioner"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "BundleEntryAusstellendeverschreibendeverantwortlichepersonResour",
                      "source" : [
                        {
                          "context" : "sourceBundleEntryAusstellendeverschreibendeverantwortlichepersb5",
                          "element" : "resource",
                          "variable" : "sourceBundleEntryAusstellendeverschreibendeverantwortlicheperse9"
                        }
                      ],
                      "rule" : [
                        {
                          "name" : "CallKbvprforpractitionermap",
                          "source" : [
                            {
                              "context" : "sourceBundleEntryAusstellendeverschreibendeverantwortlicheperse9"
                            }
                          ],
                          "target" : [
                            {
                              "context" : "targetPartPractitionerParte111e9d1",
                              "contextType" : "variable",
                              "element" : "resource",
                              "variable" : "targetParameterRxprescriptionPartPractitionerResourceResource62d",
                              "transform" : "create",
                              "parameter" : [
                                {
                                  "valueString" : "https://gematik.de/fhir/directory/StructureDefinition/PractitionerDirectory"
                                }
                              ]
                            }
                          ],
                          "dependent" : [
                            {
                              "name" : "KBVPrForPractitionerMap",
                              "variable" : [
                                "sourceBundleEntryAusstellendeverschreibendeverantwortlicheperse9",
                                "targetParameterRxprescriptionPartPractitionerResourceResource62d"
                              ]
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Bundle.entry:AusstellendeVerschreibendeVerantwortlichePerson.resource -> .parameter:rxPrescription.part:practitioner.resource using KBV_PR_FOR_Practitioner|1.3.0 -> PractitionerDirectory|1.0.0"
                }
              ],
              "documentation" : "Creates part:practitioner part container aggregating 1 child rule(s)"
            },
            {
              "name" : "PartPrescriptionidPartContainer",
              "source" : [
                {
                  "context" : "KBVPRERPBundle"
                }
              ],
              "target" : [
                {
                  "context" : "targetParameterRxprescriptionParameter77d85b46",
                  "contextType" : "variable",
                  "element" : "part",
                  "variable" : "targetPartPrescriptionidPartee663288"
                }
              ],
              "rule" : [
                {
                  "name" : "SetPartPrescriptionidName",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle"
                    }
                  ],
                  "target" : [
                    {
                      "context" : "targetPartPrescriptionidPartee663288",
                      "contextType" : "variable",
                      "element" : "name",
                      "transform" : "copy",
                      "parameter" : [
                        {
                          "valueString" : "prescriptionId"
                        }
                      ]
                    }
                  ]
                },
                {
                  "name" : "InlineParametersParameterRxprescriptionPartPrescriptionidValueX9",
                  "source" : [
                    {
                      "context" : "KBVPRERPBundle",
                      "element" : "identifier",
                      "variable" : "inlinesourceParametersParameterRxprescriptionPartPrescriptionidV"
                    }
                  ],
                  "rule" : [
                    {
                      "name" : "InlineParametersParameterRxprescriptionPartPrescriptionidValueX9",
                      "source" : [
                        {
                          "context" : "inlinesourceParametersParameterRxprescriptionPartPrescriptionidV",
                          "element" : "value",
                          "variable" : "inlinesourceParametersParameterRxprescriptionPartPrescriptionidV"
                        }
                      ],
                      "target" : [
                        {
                          "context" : "targetPartPrescriptionidPartee663288",
                          "contextType" : "variable",
                          "element" : "value",
                          "variable" : "inlinetargetParametersParameterRxprescriptionPartPrescriptionidV",
                          "transform" : "copy",
                          "parameter" : [
                            {
                              "valueId" : "inlinesourceParametersParameterRxprescriptionPartPrescriptionidV"
                            }
                          ]
                        }
                      ]
                    }
                  ],
                  "documentation" : "Automatic copy"
                }
              ],
              "documentation" : "Creates part:prescriptionId part container aggregating 1 child rule(s)"
            }
          ],
          "documentation" : "Creates parameter:rxPrescription parameter container aggregating 6 part(s)"
        }
      ]
    }
  ]
}

```
