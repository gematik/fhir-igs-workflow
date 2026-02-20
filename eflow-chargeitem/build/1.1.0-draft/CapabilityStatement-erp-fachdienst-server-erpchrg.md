# ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst**

## CapabilityStatement: ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/OperationDefinition/ERPFachdienstServerChrgOperationDefinition | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:ERPFachdienstServerChrg |

 
CapabilityStatement für den E-Rezept-Fachdienst (PKV-Abrechnungsinformationen) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-server-erpchrg",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
    "valueString" : "erp.zentral.erp.splitdns.ti-dienste.de"
  }],
  "url" : "https://gematik.de/fhir/erpchrg/OperationDefinition/ERPFachdienstServerChrgOperationDefinition",
  "version" : "1.1.0-draft",
  "name" : "ERPFachdienstServerChrg",
  "title" : "ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst",
  "status" : "draft",
  "date" : "2025-04-10",
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
  "description" : "CapabilityStatement für den E-Rezept-Fachdienst (PKV-Abrechnungsinformationen)",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "kind" : "requirements",
  "imports" : ["https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server"],
  "_imports" : [{
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
      "valueCode" : "SHALL"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [{
    "mode" : "server",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Task",
      "supportedProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "search-type"
      },
      {
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "ChargeItem",
      "supportedProfile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "search-type"
      },
      {
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true,
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "Resource.meta.lastUpdated"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/ChargeItem-enteredDate",
        "type" : "token",
        "documentation" : "ChargeItem.identifier"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Consent",
      "supportedProfile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Consent"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "search-type"
      },
      {
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Communication",
      "supportedProfile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq",
      "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "search-type"
      },
      {
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
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
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    }]
  }]
}

```
