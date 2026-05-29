# Telemetry Data Status Codes Concept Map - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Telemetry Data Status Codes Concept Map**

## ConceptMap: Telemetry Data Status Codes Concept Map 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/ConceptMap/TIFLOW-CM-TelemetryDataStatusCodes | *Version*:2.0.0-ballot.1 |
| Draft as of 2026-05-04 | *Computable Name*: |

 
Maps operation outcome codes to the telemetry data status codes 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "TIFLOW-CM-TelemetryDataStatusCodes",
  "url" : "https://gematik.de/fhir/tiflow/ConceptMap/TIFLOW-CM-TelemetryDataStatusCodes",
  "version" : "2.0.0-ballot.1",
  "title" : "Telemetry Data Status Codes Concept Map",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-05-04",
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
  "description" : "Maps operation outcome codes to the telemetry data status codes",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "group" : [{
    "source" : "https://gematik.de/fhir/erp/CodeSystem/tiflow-operation-outcome-details-cs",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "TIFLOW_OCSP_BACKEND_ERROR",
      "target" : [{
        "code" : "79001",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_ACCESSCODE_MISMATCH",
      "target" : [{
        "code" : "79200",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_ACCESS_CODE_INVALID",
      "target" : [{
        "code" : "79201",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_ACCESS_PERMISSION_INVALID",
      "target" : [{
        "code" : "79202",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_ALTERNATIVE_IK_FORBIDDEN",
      "target" : [{
        "code" : "79203",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_AUTH_NOT_OWNER",
      "target" : [{
        "code" : "79204",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED",
      "target" : [{
        "code" : "79205",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_BOM_DETECTED",
      "target" : [{
        "code" : "79206",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CERTIFICATE_INVALID",
      "target" : [{
        "code" : "79207",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_COMMUNICATION_PAYLOAD_INVALID",
      "target" : [{
        "code" : "79208",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CONSENT_ALREADY_EXISTS",
      "target" : [{
        "code" : "79209",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CONSENT_CATEGORY_INVALID",
      "target" : [{
        "code" : "79210",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CONSENT_CATEGORY_REQUIRED",
      "target" : [{
        "code" : "79211",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CONSENT_MISSING",
      "target" : [{
        "code" : "79212",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CONSENT_REQUIRED",
      "target" : [{
        "code" : "79213",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_COVERAGE_TYPE_MISMATCH",
      "target" : [{
        "code" : "79214",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_FLOWTYPE_MISMATCH",
      "target" : [{
        "code" : "79215",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_IKNR_INVALID",
      "target" : [{
        "code" : "79216",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_INSURANT_NOT_ELIGIBLE",
      "target" : [{
        "code" : "79217",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_KVNR_INVALID",
      "target" : [{
        "code" : "79218",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_KVNR_MISMATCH",
      "target" : [{
        "code" : "79219",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_LANR_ZANR_INVALID",
      "target" : [{
        "code" : "79220",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_MEDICATION_DISPENSE_INVALID",
      "target" : [{
        "code" : "79221",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_MEDICATION_DISPENSE_MISSING",
      "target" : [{
        "code" : "79222",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_MESSAGE_TO_SELF",
      "target" : [{
        "code" : "79223",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_META_PROFILE_INVALID",
      "target" : [{
        "code" : "79224",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_MVO_NOT_VALID_YET",
      "target" : [{
        "code" : "79225",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_RECIPIENT_INVALID",
      "target" : [{
        "code" : "79226",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_RESOURCE_FULLURL_INVALID",
      "target" : [{
        "code" : "79227",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_SECRET_MISMATCH",
      "target" : [{
        "code" : "79228",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH",
      "target" : [{
        "code" : "79229",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_SIGNATURE_INVALID",
      "target" : [{
        "code" : "79230",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE",
      "target" : [{
        "code" : "79231",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_SIGNATURE_NO_OCSP_RESPONSE",
      "target" : [{
        "code" : "79232",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TASK_DELETED",
      "target" : [{
        "code" : "79233",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TASK_EXPIRED",
      "target" : [{
        "code" : "79234",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TASK_ID_REQUIRED",
      "target" : [{
        "code" : "79235",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TASK_NOT_FOUND",
      "target" : [{
        "code" : "79236",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TASK_REQUIRED",
      "target" : [{
        "code" : "79237",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TASK_STATUS_MISMATCH",
      "target" : [{
        "code" : "79238",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_POPP_TOKEN_INVALID",
      "target" : [{
        "code" : "79273",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_INTERNAL_ERROR",
      "target" : [{
        "code" : "79274",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_TIMEOUT",
      "target" : [{
        "code" : "79275",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "https://gematik.de/fhir/erp/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "TIFLOW_CHARGEITEM_COVERAGE_NOT_PKV",
      "target" : [{
        "code" : "79239",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID",
      "target" : [{
        "code" : "79240",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID",
      "target" : [{
        "code" : "79241",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CHARGEITEM_ID_REQUIRED",
      "target" : [{
        "code" : "79242",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_CHARGEITEM_NOT_FOUND",
      "target" : [{
        "code" : "79243",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "https://gematik.de/fhir/erp/CodeSystem/tiflow-xborder-operation-outcome-details-cs",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "TIFLOW_XBORDER_COUNTRY_CODE_INVALID",
      "target" : [{
        "code" : "79244",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_XBORDER_NOT_ACTIVATED",
      "target" : [{
        "code" : "79245",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND",
      "target" : [{
        "code" : "79246",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN",
      "target" : [{
        "code" : "79247",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_MVO_ENDDATE_INVALID",
      "target" : [{
        "code" : "79248",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID",
      "target" : [{
        "code" : "79249",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_MVO_ID_INVALID",
      "target" : [{
        "code" : "79250",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_MVO_INVALID",
      "target" : [{
        "code" : "79251",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_MVO_NOT_VALID",
      "target" : [{
        "code" : "79252",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_MVO_STARTDATE_INVALID",
      "target" : [{
        "code" : "79253",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "TIFLOW_EREZEPT_PZN_INVALID",
      "target" : [{
        "code" : "79254",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "json-fehlercodes",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "invalidOid",
      "target" : [{
        "code" : "79262",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "methodNotAllowed",
      "target" : [{
        "code" : "79263",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "malformedRequest",
      "target" : [{
        "code" : "79264",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "SVC_IDENTITY_MISMATCH",
      "target" : [{
        "code" : "79255",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SVC_INVALID_ACCESS_TOKEN",
      "target" : [{
        "code" : "79256",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SVC_TELEMATIKID_TEMPORARILY_BLOCKED",
      "target" : [{
        "code" : "79257",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "SVC_VALIDATION_FAILED",
      "target" : [{
        "code" : "79258",
        "equivalence" : "equivalent"
      }]
    }]
  },
  {
    "source" : "http://terminology.hl7.org/CodeSystem/operation-outcome",
    "target" : "ti-flow-telemetriedaten-statuscodes",
    "element" : [{
      "code" : "MSG_RESOURCE_ID_FAIL",
      "target" : [{
        "code" : "79259",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_RESOURCE_ID_MISMATCH",
      "target" : [{
        "code" : "79260",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_RESOURCE_ID_MISSING",
      "target" : [{
        "code" : "79261",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_BAD_FORMAT",
      "target" : [{
        "code" : "79265",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_BAD_SYNTAX",
      "target" : [{
        "code" : "79266",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_DELETED",
      "target" : [{
        "code" : "79267",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_INTERNAL_ERROR",
      "target" : [{
        "code" : "79268",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_PARAM_UNKNOWN",
      "target" : [{
        "code" : "79269",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_TIMEOUT",
      "target" : [{
        "code" : "79270",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_UNKNOWN_OPERATION",
      "target" : [{
        "code" : "79271",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "MSG_UNKNOWN_TYPE",
      "target" : [{
        "code" : "79272",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
