# ERP Capability Statement für Clients des E-Rezept-Fachdienst - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP Capability Statement für Clients des E-Rezept-Fachdienst**

## CapabilityStatement: ERP Capability Statement für Clients des E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-client | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:ERPFachdienstClient |

 
Dieses Capability Statement legt die Anforderungen an Clients des E-Rezept-Fachdienst fest. Es definiert die unterstützten Interaktionen, erforderliche HTTP Header sowie erwartete Status Codes. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-client",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
      "valueString" : "http://todo"
    },
    {
      "extension" : [
        {
          "url" : "statusCode",
          "valueString" : "423"
        },
        {
          "url" : "description",
          "valueString" : "If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."
        },
        {
          "url" : "responseType",
          "valueString" : "application/json"
        },
        {
          "url" : "errorCode",
          "valueString" : "locked"
        }
      ],
      "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
    }
  ],
  "url" : "https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-client",
  "version" : "1.0.0-draft",
  "name" : "ERPFachdienstClient",
  "title" : "ERP Capability Statement für Clients des E-Rezept-Fachdienst",
  "status" : "draft",
  "date" : "2025-12-15",
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
  "description" : "Dieses Capability Statement legt die Anforderungen an Clients des E-Rezept-Fachdienst fest. Es definiert die unterstützten Interaktionen, erforderliche HTTP Header sowie erwartete Status Codes.",
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
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [
    {
      "mode" : "client",
      "resource" : [
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "SHALL"
            }
          ],
          "type" : "MedicationDispense",
          "supportedProfile" : [
            "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-medicationdispense"
          ],
          "_supportedProfile" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ]
            }
          ],
          "interaction" : [
            {
              "extension" : [
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "200"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Successful operation"
                    }
                  ],
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "400"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Unknown search parameter"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_PARAM_UNKNOWN"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "400"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Invalid query parameter(s)"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_BAD_SYNTAX"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "404"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Unknown resource type"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_UNKNOWN_TYPE"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                }
              ],
              "code" : "search-type"
            },
            {
              "extension" : [
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "200"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Successful operation"
                    }
                  ],
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "400"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Invalid request"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_BAD_FORMAT"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "404"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Unknown resource type"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_UNKNOWN_TYPE"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "404"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Resource is not known"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_RESOURCE_ID_FAIL"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                },
                {
                  "extension" : [
                    {
                      "url" : "statusCode",
                      "valueString" : "410"
                    },
                    {
                      "url" : "description",
                      "valueString" : "Resource was deleted"
                    },
                    {
                      "url" : "responseType",
                      "valueString" : "EPAMSOperationOutcome"
                    },
                    {
                      "url" : "errorCode",
                      "valueString" : "MSG_DELETED"
                    }
                  ],
                  "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
                }
              ],
              "code" : "read"
            }
          ],
          "versioning" : "versioned-update",
          "readHistory" : true,
          "searchInclude" : [
            "MedicationDispense:medication",
            "MedicationDispense:performer",
            "MedicationDispense:prescription"
          ],
          "searchParam" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_id",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
              "type" : "token",
              "documentation" : "Resource.id"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_lastUpdated",
              "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
              "type" : "date",
              "documentation" : "Resource.meta.lastUpdated"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "_has",
              "type" : "string",
              "documentation" : "Return resources linked to by the given target"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "identifier",
              "definition" : "http://hl7.org/fhir/SearchParameter/clinical-identifier",
              "type" : "token",
              "documentation" : "MedicationDispense.identifier"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "whenhandedover",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover",
              "type" : "date",
              "documentation" : "MedicationDispense.whenHandedOver"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "prescription",
              "definition" : "http://hl7.org/fhir/SearchParameter/medications-prescription",
              "type" : "reference",
              "documentation" : "MedicationDispense.authorizingPrescription"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "performer",
              "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-performer",
              "type" : "reference",
              "documentation" : "MedicationDispense.performer.actor"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "status",
              "definition" : "http://hl7.org/fhir/SearchParameter/medications-status",
              "type" : "token",
              "documentation" : "MedicationDispense.status"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "MAY"
                }
              ],
              "name" : "medication",
              "definition" : "http://hl7.org/fhir/SearchParameter/medications-medication",
              "type" : "reference",
              "documentation" : "MedicationDispense.medication as Reference"
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
              "valueCode" : "MAY"
            }
          ],
          "type" : "Task",
          "versioning" : "versioned-update",
          "readHistory" : true,
          "operation" : [
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "createOperation",
              "definition" : "https://gematik.de/fhir/erp/OperationDefinition/CreateOperation"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "activateOperation",
              "definition" : "https://gematik.de/fhir/erp/OperationDefinition/ActivateOperation"
            },
            {
              "extension" : [
                {
                  "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
                  "valueCode" : "SHALL"
                }
              ],
              "name" : "abortOperation",
              "definition" : "https://gematik.de/fhir/erp/OperationDefinition/AbortOperation"
            }
          ]
        }
      ]
    }
  ]
}

```
