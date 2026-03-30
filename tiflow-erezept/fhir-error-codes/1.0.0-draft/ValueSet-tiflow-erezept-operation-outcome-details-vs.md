# TIFLOW EREZEPT Operation Outcome Details VS - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW EREZEPT Operation Outcome Details VS**

## ValueSet: TIFLOW EREZEPT Operation Outcome Details VS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/ValueSet/tiflow-erezept-operation-outcome-details-vs | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:TIFLOWEREZEPTOperationOutcomeDetailsVS |

 
E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

No Expansion for this valueset (Unknown Code System)

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
  "id" : "tiflow-erezept-operation-outcome-details-vs",
  "url" : "https://gematik.de/fhir/tiflow/ValueSet/tiflow-erezept-operation-outcome-details-vs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWEREZEPTOperationOutcomeDetailsVS",
  "title" : "TIFLOW EREZEPT Operation Outcome Details VS",
  "status" : "draft",
  "date" : "2025-09-25",
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
  "description" : "E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs"
    },
    {
      "system" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs",
      "concept" : [{
        "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
      },
      {
        "code" : "TIFLOW_SECRET_MISMATCH"
      },
      {
        "code" : "TIFLOW_TASK_STATUS_MISMATCH"
      },
      {
        "code" : "TIFLOW_MEDICATION_DISPENSE_INVALID"
      },
      {
        "code" : "TIFLOW_MEDICATION_DISPENSE_MISSING"
      },
      {
        "code" : "TIFLOW_SIGNATURE_NO_OCSP_RESPONSE"
      },
      {
        "code" : "TIFLOW_AUTH_NOT_OWNER"
      },
      {
        "code" : "TIFLOW_ACCESSCODE_MISMATCH"
      },
      {
        "code" : "TIFLOW_TASK_ID_REQUIRED"
      },
      {
        "code" : "TIFLOW_KVNR_MISMATCH"
      },
      {
        "code" : "TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE"
      },
      {
        "code" : "TIFLOW_FLOWTYPE_MISMATCH"
      },
      {
        "code" : "TIFLOW_COVERAGE_TYPE_MISMATCH"
      },
      {
        "code" : "TIFLOW_CERTIFICATE_INVALID"
      },
      {
        "code" : "TIFLOW_OCSP_BACKEND_ERROR"
      },
      {
        "code" : "TIFLOW_SIGNATURE_INVALID"
      },
      {
        "code" : "TIFLOW_KVNR_INVALID"
      },
      {
        "code" : "TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH"
      },
      {
        "code" : "TIFLOW_IKNR_INVALID"
      },
      {
        "code" : "TIFLOW_LANR_ZANR_INVALID"
      },
      {
        "code" : "TIFLOW_TASK_DELETED"
      },
      {
        "code" : "TIFLOW_TASK_EXPIRED"
      },
      {
        "code" : "TIFLOW_MESSAGE_TO_SELF"
      },
      {
        "code" : "TIFLOW_COMMUNICATION_PAYLOAD_INVALID"
      },
      {
        "code" : "TIFLOW_INSURANT_NOT_ELIGIBLE"
      },
      {
        "code" : "TIFLOW_RECIPIENT_INVALID"
      },
      {
        "code" : "TIFLOW_TASK_NOT_FOUND"
      },
      {
        "code" : "TIFLOW_MVO_NOT_VALID_YET"
      }]
    },
    {
      "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
      "concept" : [{
        "code" : "SVC_VALIDATION_FAILED"
      },
      {
        "code" : "SVC_IDENTITY_MISMATCH"
      },
      {
        "code" : "SVC_TELEMATIKID_TEMPORARILY_BLOCKED"
      }]
    }]
  }
}

```
