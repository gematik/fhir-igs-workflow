# CapabilityStatement für den TI-Flow-Fachdienst - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CapabilityStatement für den TI-Flow-Fachdienst**

## CapabilityStatement: CapabilityStatement für den TI-Flow-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/CapabilityStatement/ti-flow-fachdienst-server | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowFachdienstServer |
| **Copyright/Legal**: gematik GmbH / Dieser Implementation Guide ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
CapabilityStatement für den TI-Flow-Fachdienst 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ti-flow-fachdienst-server",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
    "valueString" : "https://tiflow.de"
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
      "valueString" : "INNERER REQUEST: Bearer Token zur Authentifizierung gegenüber dem TI-Flow-Fachdienst"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-header"
  }],
  "url" : "https://gematik.de/fhir/tiflow/CapabilityStatement/ti-flow-fachdienst-server",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowFachdienstServer",
  "title" : "CapabilityStatement für den TI-Flow-Fachdienst",
  "status" : "active",
  "date" : "2028-04-01",
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
  "description" : "CapabilityStatement für den TI-Flow-Fachdienst",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieser Implementation Guide ist lizenziert unter [Apache License](./license.html), Version 2.0.",
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
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal Server Error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_INTERNAL_ERROR"
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
            "valueString" : "Timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TIMEOUT"
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
      "type" : "AuditEvent",
      "supportedProfile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-audit-event-rest"],
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
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal Server Error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_INTERNAL_ERROR"
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
            "valueString" : "Timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TIMEOUT"
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
            "valueString" : "500"
          },
          {
            "url" : "description",
            "valueString" : "Internal Server Error"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_INTERNAL_ERROR"
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
            "valueString" : "Timeout"
          },
          {
            "url" : "responseType",
            "valueString" : "TIFlowOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "TIFLOW_TIMEOUT"
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
        "type" : "reference",
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
    }]
  }]
}

```
