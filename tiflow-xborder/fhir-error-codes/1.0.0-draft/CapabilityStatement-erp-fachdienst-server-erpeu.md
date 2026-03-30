# ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst**

## CapabilityStatement: ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/CapabilityStatement/erp-fachdienst-server-erpeu | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*: |

 
CapabilityStatement fuer den E-Rezept-Fachdienst (EU-Zugriff) 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-server-erpeu",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
    "valueString" : "https://tiflow.de"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "400 - Bad Request"
    },
    {
      "url" : "description",
      "valueString" : "TODO: description for SVC_VALIDATION_FAILED"
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
      "valueString" : "403 - Forbidden"
    },
    {
      "url" : "description",
      "valueString" : "Access permission invalid"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_ACCESS_PERMISSION_INVALID"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "403 - Forbidden"
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
      "valueString" : "403 - Forbidden"
    },
    {
      "url" : "description",
      "valueString" : "Consent missing"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_CONSENT_MISSING"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "400 - Bad Request"
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
      "valueString" : "400 - Bad Request"
    },
    {
      "url" : "description",
      "valueString" : "Access code invalid"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_ACCESS_CODE_INVALID"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "403 - Forbidden"
    },
    {
      "url" : "description",
      "valueString" : "Consent required"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_CONSENT_REQUIRED"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "409 - Conflict"
    },
    {
      "url" : "description",
      "valueString" : "Country code invalid"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_XBORDER_COUNTRY_CODE_INVALID"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "400 - Bad Request"
    },
    {
      "url" : "description",
      "valueString" : "TODO: description for SVC_VALIDATION_FAILED"
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
      "valueString" : "403 - Forbidden"
    },
    {
      "url" : "description",
      "valueString" : "Access permission invalid"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_ACCESS_PERMISSION_INVALID"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "403 - Forbidden"
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
      "valueString" : "403 - Forbidden"
    },
    {
      "url" : "description",
      "valueString" : "Consent required"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_CONSENT_REQUIRED"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  },
  {
    "extension" : [{
      "url" : "statusCode",
      "valueString" : "404 - Not Found"
    },
    {
      "url" : "description",
      "valueString" : "No prescriptions found"
    },
    {
      "url" : "responseType",
      "valueString" : "TIFlowOperationOutcome"
    },
    {
      "url" : "errorCode",
      "valueString" : "TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND"
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
  }],
  "url" : "https://gematik.de/fhir/tiflow/xborder/CapabilityStatement/erp-fachdienst-server-erpeu",
  "version" : "1.0.0-draft",
  "title" : "ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "CapabilityStatement fuer den E-Rezept-Fachdienst (EU-Zugriff)",
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
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
          },
          {
            "url" : "errorCode",
            "valueString" : "MSG_INTERNAL_ERROR"
          }],
          "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
        }],
        "code" : "read"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
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
        "name" : "_id",
        "definition" : "http://hl7.org/fhir/SearchParameter/Resource-id",
        "type" : "token",
        "documentation" : "Task.id - Unterstützt die Suche nach der Task-ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "prescription-id",
        "type" : "token",
        "documentation" : "Task.identifier - Unterstützt die Suche nach der E-Rezept-ID"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "access-code",
        "type" : "token",
        "documentation" : "Task.identifier - Unterstützt die Suche nach dem Zugriffscode"
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
        "name" : "authored-on",
        "type" : "date",
        "documentation" : "Task.authoredOn - Unterstützt die Suche nach dem Erstellungsdatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "accept-date",
        "type" : "date",
        "documentation" : "Task.extension:acceptDate.valueDate - Unterstützt die Suche nach dem Akzeptanzdatum"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "expiry-date",
        "type" : "date",
        "documentation" : "Task.extension:expiryDate.valueDate - Unterstützt die Suche nach dem Verfallsdatum"
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
        "name" : "__offset",
        "type" : "number",
        "documentation" : "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0"
      }],
      "operation" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
          "valueCode" : "SHALL"
        }],
        "name" : "eu-close",
        "definition" : "https://gematik.de/fhir/erp-eu/OperationDefinition/EUCloseOperationDefinition",
        "documentation" : "Finishes the EU ePrescription workflow and creates a signed receipt bundle"
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
            "valueString" : "401"
          },
          {
            "url" : "description",
            "valueString" : "Authentication is required and has failed or has not yet been provided"
          },
          {
            "url" : "responseType",
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "405"
          },
          {
            "url" : "description",
            "valueString" : "Method not allowed for this endpoint"
          },
          {
            "url" : "responseType",
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "EPAMSOperationOutcome"
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
            "valueString" : "201"
          },
          {
            "url" : "description",
            "valueString" : "Resource created"
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
        }],
        "code" : "create"
      },
      {
        "extension" : [{
          "extension" : [{
            "url" : "statusCode",
            "valueString" : "204"
          },
          {
            "url" : "description",
            "valueString" : "Successful operation without response body"
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
    }],
    "operation" : [{
      "extension" : [{
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "405"
        },
        {
          "url" : "description",
          "valueString" : "Method not allowed for this endpoint"
        },
        {
          "url" : "responseType",
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
        },
        {
          "url" : "errorCode",
          "valueString" : "MSG_INTERNAL_ERROR"
        }],
        "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
      }],
      "name" : "grant-eu-access-permission",
      "definition" : "https://gematik.de/fhir/erp-eu/OperationDefinition/Grant_Access_PermissionOperationDefinition",
      "documentation" : "Registers access code and country for EU prescription access"
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
        },
        {
          "url" : "responseType",
          "valueString" : "Parameters"
        }],
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "405"
        },
        {
          "url" : "description",
          "valueString" : "Method not allowed for this endpoint"
        },
        {
          "url" : "responseType",
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
        },
        {
          "url" : "errorCode",
          "valueString" : "MSG_INTERNAL_ERROR"
        }],
        "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
      }],
      "name" : "read-eu-access-permission",
      "definition" : "https://gematik.de/fhir/erp-eu/OperationDefinition/Read_Access_PermissionOperationDefinition",
      "documentation" : "Reads the currently registered EU access code"
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
          "valueString" : "401"
        },
        {
          "url" : "description",
          "valueString" : "Authentication is required and has failed or has not yet been provided"
        },
        {
          "url" : "responseType",
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "405"
        },
        {
          "url" : "description",
          "valueString" : "Method not allowed for this endpoint"
        },
        {
          "url" : "responseType",
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
        },
        {
          "url" : "errorCode",
          "valueString" : "MSG_INTERNAL_ERROR"
        }],
        "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
      }],
      "name" : "revoke-eu-access-permission",
      "definition" : "https://gematik.de/fhir/erp-eu/OperationDefinition/Revoke_Access_PermissionOperationDefinition",
      "documentation" : "Revokes the currently registered EU access code"
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
        },
        {
          "url" : "responseType",
          "valueString" : "Parameters"
        }],
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "405"
        },
        {
          "url" : "description",
          "valueString" : "Method not allowed for this endpoint"
        },
        {
          "url" : "responseType",
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
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
          "valueString" : "EPAMSOperationOutcome"
        },
        {
          "url" : "errorCode",
          "valueString" : "MSG_INTERNAL_ERROR"
        }],
        "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
      }],
      "name" : "get-eu-prescriptions",
      "definition" : "https://gematik.de/fhir/erp-eu/OperationDefinition/GET-Prescription-EUOperationDefinition",
      "documentation" : "Returns prescription information for EU ePrescription workflows"
    }]
  }]
}

```
