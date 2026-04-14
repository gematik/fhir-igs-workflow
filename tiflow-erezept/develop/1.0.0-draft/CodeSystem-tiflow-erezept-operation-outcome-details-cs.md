# TIFLOW EREZEPT Operation Outcome Details CS - TIFlow - Verordnungen für Arzneimittel v1.0.0-draft

TIFlow - Verordnungen für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW EREZEPT Operation Outcome Details CS**

## CodeSystem: TIFLOW EREZEPT Operation Outcome Details CS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:TIFLOWEREZEPTOperationOutcomeDetailsCS |
| **Copyright/Legal**: gematik GmbH | |

 
E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TIFLOWEREZEPTOperationOutcomeDetailsVS](ValueSet-tiflow-erezept-operation-outcome-details-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tiflow-erezept-operation-outcome-details-cs",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWEREZEPTOperationOutcomeDetailsCS",
  "title" : "TIFLOW EREZEPT Operation Outcome Details CS",
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
  "copyright" : "gematik GmbH",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 8,
  "concept" : [{
    "code" : "TIFLOW_EREZEPT_PZN_INVALID",
    "display" : "PZN invalid",
    "definition" : "The provided PZN is invalid or not permitted in the current processing context",
    "designation" : [{
      "language" : "de-DE",
      "value" : "PZN ungültig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN",
    "display" : "Drug category forbidden",
    "definition" : "The prescription contains a forbidden medication category, for example BTM",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Arzneimittelkategorie nicht zulässig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID",
    "display" : "MVO flow type invalid",
    "definition" : "A multiple prescription is not allowed for the addressed flow type",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MVO-Flowtyp ungültig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_MVO_INVALID",
    "display" : "MVO invalid",
    "definition" : "The multiple prescription metadata is inconsistent or violates MVO constraints",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Mehrfachverordnung ungültig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_MVO_STARTDATE_INVALID",
    "display" : "MVO start date invalid",
    "definition" : "The start date of the multiple prescription redemption period is missing or invalid",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MVO-Startdatum ungültig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_MVO_ENDDATE_INVALID",
    "display" : "MVO end date invalid",
    "definition" : "The end date of the multiple prescription redemption period is invalid",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MVO-Enddatum ungültig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_MVO_ID_INVALID",
    "display" : "MVO id invalid",
    "definition" : "The multiple prescription id does not match the required identifier schema",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MVO-ID ungültig"
    }]
  },
  {
    "code" : "TIFLOW_EREZEPT_MVO_NOT_VALID",
    "display" : "MVO not valid yet",
    "definition" : "The multiple prescription part is not redeemable yet because its redemption period has not started",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Teilverordnung noch nicht einlösbar"
    }]
  }]
}

```
