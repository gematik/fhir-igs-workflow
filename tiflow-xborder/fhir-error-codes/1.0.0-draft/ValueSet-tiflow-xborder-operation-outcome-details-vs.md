# TIFLOW XBORDER Operation Outcome Details VS - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW XBORDER Operation Outcome Details VS**

## ValueSet: TIFLOW XBORDER Operation Outcome Details VS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/ValueSet/tiflow-xborder-operation-outcome-details-vs | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:TIFLOWXBORDEROperationOutcomeDetailsVS |

 
Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

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
  "id" : "tiflow-xborder-operation-outcome-details-vs",
  "url" : "https://gematik.de/fhir/erp-eu/ValueSet/tiflow-xborder-operation-outcome-details-vs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWXBORDEROperationOutcomeDetailsVS",
  "title" : "TIFLOW XBORDER Operation Outcome Details VS",
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
  "description" : "Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/erp-eu/CodeSystem/tiflow-xborder-operation-outcome-details-cs"
    },
    {
      "system" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs",
      "concept" : [{
        "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
      },
      {
        "code" : "TIFLOW_CONSENT_REQUIRED"
      },
      {
        "code" : "TIFLOW_ACCESS_PERMISSION_INVALID"
      },
      {
        "code" : "TIFLOW_AUTH_NOT_OWNER"
      },
      {
        "code" : "TIFLOW_ACCESSCODE_MISMATCH"
      },
      {
        "code" : "TIFLOW_TASK_STATUS_MISMATCH"
      },
      {
        "code" : "TIFLOW_TASK_ID_REQUIRED"
      },
      {
        "code" : "TIFLOW_KVNR_MISMATCH"
      },
      {
        "code" : "TIFLOW_CONSENT_MISSING"
      },
      {
        "code" : "TIFLOW_ACCESS_CODE_INVALID"
      }]
    },
    {
      "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
      "concept" : [{
        "code" : "SVC_VALIDATION_FAILED"
      },
      {
        "code" : "SVC_TELEMATIKID_TEMPORARILY_BLOCKED"
      }]
    }]
  }
}

```
