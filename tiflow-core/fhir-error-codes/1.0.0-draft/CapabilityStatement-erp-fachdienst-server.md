# ERP CapabilityStatement für den E-Rezept-Fachdienst - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP CapabilityStatement für den E-Rezept-Fachdienst**

## CapabilityStatement: ERP CapabilityStatement für den E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/core/CapabilityStatement/erp-fachdienst-server | *Version*:1.0.0-draft |
| Active as of 2025-12-15 | *Computable Name*:ERPFachdienstServer |

 
ERP CapabilityStatement für den E-Rezept-Fachdienst 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-server",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CapabilityStatement|1.6"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
    "valueString" : "http://tiflow"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "x-erp-user"
    },
    {
      "url" : "type",
      "valueString" : "string"
    },
    {
      "url" : "required",
      "valueBoolean" : true
    },
    {
      "url" : "description",
      "valueString" : "ÄUßERER REQUEST: Nutzergruppe zum Ermöglichen des Routings von nutzergruppenspezifischen Verarbeitungskontexten"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-header"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "x-erp-resource"
    },
    {
      "url" : "type",
      "valueString" : "string"
    },
    {
      "url" : "required",
      "valueBoolean" : true
    },
    {
      "url" : "description",
      "valueString" : "ÄUßERER REQUEST: Ressource zum Ermöglichen des Routings von Ressourcen-spezifischen Verarbeitungskontexten"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-header"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "content-type"
    },
    {
      "url" : "type",
      "valueString" : "string"
    },
    {
      "url" : "required",
      "valueBoolean" : true
    },
    {
      "url" : "description",
      "valueString" : "INNERER REQUEST: Content-Type des HTTP-Body"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-header"
  },
  {
    "extension" : [{
      "url" : "name",
      "valueString" : "authorization"
    },
    {
      "url" : "type",
      "valueString" : "string"
    },
    {
      "url" : "required",
      "valueBoolean" : true
    },
    {
      "url" : "description",
      "valueString" : "INNERER REQUEST: Bearer Token zur Authentifizierung gegenüber dem E-Rezept-Fachdienst"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-header"
  }],
  "url" : "https://gematik.de/fhir/tiflow/core/CapabilityStatement/erp-fachdienst-server",
  "version" : "1.0.0-draft",
  "name" : "ERPFachdienstServer",
  "title" : "ERP CapabilityStatement für den E-Rezept-Fachdienst",
  "status" : "active",
  "date" : "2025-12-15",
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
  "description" : "ERP CapabilityStatement für den E-Rezept-Fachdienst",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "kind" : "requirements",
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "patch"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true,
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "authored-on",
        "definition" : "http://hl7.org/fhir/SearchParameter/Task-authored-on",
        "type" : "date",
        "documentation" : "Task.authoredOn - Unterstützt die Suche nach dem Erstellungsdatum; default sort if _sort is not provided"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "status",
        "definition" : "http://hl7.org/fhir/SearchParameter/Task-status",
        "type" : "token",
        "documentation" : "Task.status - Unterstützt die Suche nach dem Status einer Task"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "expiry-date",
        "definition" : "https://gematik.de/fhir/workflow/core/SearchParameter/task-expiry-date-sp",
        "type" : "date",
        "documentation" : "Task.extension:expiryDate.valueDate - Unterstützt die Suche nach dem Verfallsdatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "accept-date",
        "definition" : "https://gematik.de/fhir/workflow/core/SearchParameter/task-accept-date-sp",
        "type" : "date",
        "documentation" : "Task.extension:acceptDate.valueDate - Unterstützt die Suche nach dem Akzeptanzdatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "modified",
        "definition" : "http://hl7.org/fhir/SearchParameter/Task-modified",
        "type" : "date",
        "documentation" : "Task.lastModified - Unterstützt die Suche nach dem zuletzt modifizierten Datum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_sort",
        "type" : "string",
        "documentation" : "Unterstützt das Sortieren nach unterstützten Task-Suchkriterien"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "number",
        "documentation" : "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_offset",
        "type" : "number",
        "documentation" : "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0"
      }],
      "operation" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "201"
          },
          {
            "url" : "description",
            "valueString" : "Resource created"
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
            "valueString" : "FHIR Profile Validation Failed"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "SVC_VALIDATION_FAILED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "unknown FHIR http operation"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_OPERATION"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Operation %s not allowed for resource %s"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "name" : "create",
        "definition" : "https://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition",
        "documentation" : "Creates a Task for a specific flow type"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          },
          {
            "url" : "responseType",
            "valueString" : "Parameters"
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
            "valueString" : "FHIR Profile Validation Failed"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "SVC_VALIDATION_FAILED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Access code mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_ACCESSCODE_MISMATCH"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Access role not allowed"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
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
            "valueString" : "Flow type mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_FLOWTYPE_MISMATCH"
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
            "valueString" : "IKNR invalid"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_IKNR_INVALID"
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
            "valueString" : "KVNR invalid"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_KVNR_INVALID"
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
            "valueString" : "LANR or ZANR invalid"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_LANR_ZANR_INVALID"
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
            "valueString" : "Signature authoredOn mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH"
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
            "valueString" : "Signature invalid"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_SIGNATURE_INVALID"
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
            "valueString" : "Task status mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_STATUS_MISMATCH"
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
            "valueString" : "Certificate invalid"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_CERTIFICATE_INVALID"
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
            "valueString" : "PZN invalid"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_EREZEPT_PZN_INVALID"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "512"
          },
          {
            "url" : "description",
            "valueString" : "Invalid OCSP response"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_OCSP_BACKEND_ERROR"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "name" : "activate",
        "definition" : "https://gematik.de/fhir/erp/OperationDefinition/ActivateOperationDefinition",
        "documentation" : "Activates the created Task using the signed ePrescription bundle"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Access code mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_ACCESSCODE_MISMATCH"
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
            "valueString" : "Task deleted"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_DELETED"
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
            "valueString" : "Task expired"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_EXPIRED"
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
            "valueString" : "Task status mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_STATUS_MISMATCH"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "name" : "accept",
        "definition" : "https://gematik.de/fhir/erp/OperationDefinition/AcceptOperationDefinition",
        "documentation" : "Pharmacy claims an ePrescription and sets Task status to in-progress"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "204"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation without response body"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Task secret mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_SECRET_MISMATCH"
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
            "valueString" : "Task status mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_STATUS_MISMATCH"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "name" : "reject",
        "definition" : "https://gematik.de/fhir/erp/OperationDefinition/RejectOperationDefinition",
        "documentation" : "Rejects dispensing and resets Task status to active"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
          },
          {
            "url" : "responseType",
            "valueString" : "Parameters"
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
            "valueString" : "FHIR Profile Validation Failed"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "SVC_VALIDATION_FAILED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Task secret mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_SECRET_MISMATCH"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "503"
          },
          {
            "url" : "description",
            "valueString" : "No OCSP response for signature"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_SIGNATURE_NO_OCSP_RESPONSE"
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
            "valueString" : "Task status mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_STATUS_MISMATCH"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "name" : "close",
        "definition" : "https://gematik.de/fhir/erp/OperationDefinition/CloseOperationDefinition",
        "documentation" : "Finishes the ePrescription workflow and sets Task status to completed"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "204"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation without response body"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "SVC_IDENTITY_MISMATCH"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "403"
          },
          {
            "url" : "description",
            "valueString" : "Access code mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_ACCESSCODE_MISMATCH"
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
            "valueString" : "Task status mismatch"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TASK_STATUS_MISMATCH"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "name" : "abort",
        "definition" : "https://gematik.de/fhir/erp/OperationDefinition/AbortOperationDefinition",
        "documentation" : "Aborts the ePrescription workflow and deletes Task related data"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "ChargeItem",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "201"
          },
          {
            "url" : "description",
            "valueString" : "Resource created"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_TYPE"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "create"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "update"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "patch"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "204"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation without response body"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "delete"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true,
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "entered-date",
        "definition" : "http://hl7.org/fhir/SearchParameter/ChargeItem-entered-date",
        "type" : "date",
        "documentation" : "ChargeItem.enteredDate - Unterstützt die Suche nach dem Eingangsdatum; default sort if _sort is not provided"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_lastUpdated",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated",
        "type" : "date",
        "documentation" : "ChargeItem.meta.lastUpdated - Unterstützt die Suche nach dem zuletzt aktualisierten Datum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_sort",
        "type" : "string",
        "documentation" : "Unterstützt das Sortieren nach unterstützten ChargeItem-Suchkriterien"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "number",
        "documentation" : "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_offset",
        "type" : "number",
        "documentation" : "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Consent",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "201"
          },
          {
            "url" : "description",
            "valueString" : "Resource created"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_TYPE"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "create"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "204"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation without response body"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "delete"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true,
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "category",
        "definition" : "http://hl7.org/fhir/SearchParameter/Consent-category",
        "type" : "token",
        "documentation" : "Consent.category - Unterstützt die Suche nach der Art der Einwilligung"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Communication",
      "supportedProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication",
      "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq",
      "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply",
      "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Representative"],
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
      },
      {
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "201"
          },
          {
            "url" : "description",
            "valueString" : "Resource created"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_TYPE"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "create"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "204"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation without response body"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_DELETED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "delete"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true,
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "sent",
        "definition" : "http://hl7.org/fhir/SearchParameter/Communication-sent",
        "type" : "date",
        "documentation" : "Communication.sent - Unterstützt die Suche nach dem Sendedatum; default sort if _sort is not provided"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "received",
        "definition" : "http://hl7.org/fhir/SearchParameter/Communication-received",
        "type" : "date",
        "documentation" : "Communication.received - Unterstützt die Suche nach dem Empfangsdatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "recipient",
        "definition" : "http://hl7.org/fhir/SearchParameter/Communication-recipient",
        "type" : "string",
        "documentation" : "Communication.recipient.identifier.value - Unterstützt die Suche nach dem Empfänger einer Nachricht"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "sender",
        "definition" : "http://hl7.org/fhir/SearchParameter/Communication-sender",
        "type" : "string",
        "documentation" : "Communication.sender.identifier.value - Unterstützt die Suche nach dem Absender einer Nachricht"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_sort",
        "type" : "string",
        "documentation" : "Unterstützt das Sortieren nach unterstützten Communication-Suchkriterien"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "number",
        "documentation" : "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_offset",
        "type" : "number",
        "documentation" : "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "AuditEvent",
      "supportedProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AuditEvent"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
        "name" : "date",
        "definition" : "http://hl7.org/fhir/SearchParameter/AuditEvent-date",
        "type" : "date",
        "documentation" : "AuditEvent.recorded - Unterstützt die Suche nach dem Aufzeichnungsdatum; default sort if _sort is not provided"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "entity",
        "definition" : "http://hl7.org/fhir/SearchParameter/AuditEvent-entity",
        "type" : "string",
        "documentation" : "AuditEvent.entity.what.identifier.value - Unterstützt die Suche nach betroffenen Entitäten"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_sort",
        "type" : "string",
        "documentation" : "Unterstützt das Sortieren nach unterstützten AuditEvent-Suchkriterien"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "number",
        "documentation" : "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_offset",
        "type" : "number",
        "documentation" : "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "MedicationDispense",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_TYPE"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "search-type"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true,
      "searchParam" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "whenhandedover",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover",
        "type" : "date",
        "documentation" : "MedicationDispense.whenHandedOver - Unterstützt die Suche nach dem Abgabedatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "whenprepared",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-whenprepared",
        "type" : "date",
        "documentation" : "MedicationDispense.whenPrepared - Unterstützt die Suche nach dem Herstellungsdatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "performer",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-performer",
        "type" : "string",
        "documentation" : "MedicationDispense.performer.actor.identifier.value - Unterstützt die Suche einer MedicationDispense zu einer Abgebenden LEI."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "identifier",
        "definition" : "http://hl7.org/fhir/SearchParameter/MedicationDispense-identifier",
        "type" : "token",
        "documentation" : "MedicationDispense.identifier - Unterstützt die Suche nach einer MedicationDispense zu einem E-Rezept."
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_sort",
        "type" : "string",
        "documentation" : "Unterstützt das Sortieren nach unterstützten MedicationDispense-Suchkriterien"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_count",
        "type" : "number",
        "documentation" : "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "_offset",
        "type" : "number",
        "documentation" : "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0"
      }]
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Device",
      "supportedProfile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device"],
      "_supportedProfile" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }]
      }],
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_TYPE"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "search-type"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "SHALL"
      }],
      "type" : "Subscription",
      "interaction" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "200"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation"
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
            "valueString" : "Unknown search parameter"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "TIFlowOperationOutcome"
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
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_AUTH_REQUIRED"
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
            "valueString" : "Invalid request"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_OP_NOT_ALLOWED"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "408"
          },
          {
            "url" : "description",
            "valueString" : "Request timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_TIMEOUT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "429"
          },
          {
            "url" : "description",
            "valueString" : "Too many requests"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_RATE_LIMIT"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal server error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        },
        {
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "201"
          },
          {
            "url" : "description",
            "valueString" : "Resource created"
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
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_UNKNOWN_TYPE"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "create"
      }],
      "versioning" : "versioned-update",
      "readHistory" : true
    }]
  }]
}

```
