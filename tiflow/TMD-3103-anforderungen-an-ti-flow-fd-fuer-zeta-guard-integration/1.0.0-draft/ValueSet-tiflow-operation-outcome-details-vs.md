# TIFLOW Operation Outcome Details VS - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW Operation Outcome Details VS**

## ValueSet: TIFLOW Operation Outcome Details VS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/ValueSet/tiflow-operation-outcome-details-vs | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:TIFLOWOperationOutcomeDetailsVS |

 
Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 **References** 

* [TIFLOW OperationOutcome](StructureDefinition-tiflow-operation-outcome.md)

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
  "id" : "tiflow-operation-outcome-details-vs",
  "url" : "https://gematik.de/fhir/erp/ValueSet/tiflow-operation-outcome-details-vs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWOperationOutcomeDetailsVS",
  "title" : "TIFLOW Operation Outcome Details VS",
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
  "description" : "Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs"
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
      },
      {
        "code" : "SVC_TELEMATIKID_TEMPORARILY_BLOCKED",
        "display" : "The specified Telematik-ID is temporarily blocked"
      },
      {
        "code" : "SVC_INVALID_ACCESS_TOKEN",
        "display" : "Invalid access token provided"
      }]
    },
    {
      "system" : "http://terminology.hl7.org/CodeSystem/operation-outcome",
      "version" : "4.0.0",
      "concept" : [{
        "code" : "MSG_RESOURCE_ID_MISMATCH",
        "display" : "Resource Id Mismatch"
      },
      {
        "code" : "MSG_RESOURCE_ID_MISSING",
        "display" : "Resource Id Missing"
      },
      {
        "code" : "MSG_RESOURCE_ID_FAIL",
        "display" : "unable to allocate resource id"
      }]
    }]
  }
}

```
