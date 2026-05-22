# TIFLOW ChargeItem Operation Outcome Details VS - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW ChargeItem Operation Outcome Details VS**

## ValueSet: TIFLOW ChargeItem Operation Outcome Details VS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/ValueSet/tiflow-chargeitem-operation-outcome-details-vs | *Version*:1.0.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:TIFLOWChargeItemOperationOutcomeDetailsVS |

 
Abrechnungsinformationen-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "tiflow-chargeitem-operation-outcome-details-vs",
  "url" : "https://gematik.de/fhir/erpchrg/ValueSet/tiflow-chargeitem-operation-outcome-details-vs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWChargeItemOperationOutcomeDetailsVS",
  "title" : "TIFLOW ChargeItem Operation Outcome Details VS",
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
  "description" : "Abrechnungsinformationen-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/tiflow/chargeitem/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs"
    },
    {
      "system" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs",
      "concept" : [{
        "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED",
        "display" : "Access role not allowed"
      },
      {
        "code" : "TIFLOW_CONSENT_ALREADY_EXISTS",
        "display" : "Consent already exists"
      },
      {
        "code" : "TIFLOW_CONSENT_CATEGORY_REQUIRED",
        "display" : "Consent category required"
      },
      {
        "code" : "TIFLOW_CONSENT_CATEGORY_INVALID",
        "display" : "Consent category invalid"
      },
      {
        "code" : "TIFLOW_ACCESSCODE_MISMATCH",
        "display" : "Access code mismatch"
      },
      {
        "code" : "TIFLOW_TASK_REQUIRED",
        "display" : "Task required"
      },
      {
        "code" : "TIFLOW_TASK_NOT_FOUND",
        "display" : "Task not found"
      },
      {
        "code" : "TIFLOW_SECRET_MISMATCH",
        "display" : "Task secret mismatch"
      },
      {
        "code" : "TIFLOW_CONSENT_REQUIRED",
        "display" : "Consent required"
      },
      {
        "code" : "TIFLOW_OCSP_BACKEND_ERROR",
        "display" : "Invalid OCSP response"
      },
      {
        "code" : "TIFLOW_MESSAGE_TO_SELF",
        "display" : "Message to self not allowed"
      },
      {
        "code" : "TIFLOW_COMMUNICATION_PAYLOAD_INVALID",
        "display" : "Communication payload invalid"
      },
      {
        "code" : "TIFLOW_INSURANT_NOT_ELIGIBLE",
        "display" : "Insurant not eligible"
      },
      {
        "code" : "TIFLOW_RECIPIENT_INVALID",
        "display" : "Recipient invalid"
      },
      {
        "code" : "TIFLOW_TASK_STATUS_MISMATCH",
        "display" : "Task status mismatch"
      },
      {
        "code" : "TIFLOW_TASK_EXPIRED",
        "display" : "Task expired"
      },
      {
        "code" : "TIFLOW_MVO_NOT_VALID_YET",
        "display" : "MVO not valid yet"
      }]
    },
    {
      "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
      "concept" : [{
        "code" : "SVC_IDENTITY_MISMATCH",
        "display" : "Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)"
      },
      {
        "code" : "SVC_VALIDATION_FAILED",
        "display" : "FHIR Profile Validation Failed"
      }]
    }]
  }
}

```
