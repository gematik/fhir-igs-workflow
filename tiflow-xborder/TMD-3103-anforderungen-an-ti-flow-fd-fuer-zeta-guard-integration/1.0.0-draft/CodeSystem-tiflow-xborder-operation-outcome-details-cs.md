# TIFLOW XBORDER Operation Outcome Details CS - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW XBORDER Operation Outcome Details CS**

## CodeSystem: TIFLOW XBORDER Operation Outcome Details CS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/CodeSystem/tiflow-xborder-operation-outcome-details-cs | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:TIFLOWXBORDEROperationOutcomeDetailsCS |
| **Copyright/Legal**: gematik GmbH | |

 
Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TIFLOWXBORDEROperationOutcomeDetailsVS](ValueSet-tiflow-xborder-operation-outcome-details-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tiflow-xborder-operation-outcome-details-cs",
  "url" : "https://gematik.de/fhir/erp-eu/CodeSystem/tiflow-xborder-operation-outcome-details-cs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWXBORDEROperationOutcomeDetailsCS",
  "title" : "TIFLOW XBORDER Operation Outcome Details CS",
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
  "copyright" : "gematik GmbH",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 3,
  "concept" : [{
    "code" : "TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND",
    "display" : "No prescriptions found",
    "definition" : "No redeemable prescriptions were found for the requested query scope",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Keine einlösbaren Verordnungen gefunden"
    }]
  },
  {
    "code" : "TIFLOW_XBORDER_NOT_ACTIVATED",
    "display" : "EU redemption not activated",
    "definition" : "The addressed task is not activated for EU redemption",
    "designation" : [{
      "language" : "de-DE",
      "value" : "EU-Einlösung nicht aktiviert"
    }]
  },
  {
    "code" : "TIFLOW_XBORDER_COUNTRY_CODE_INVALID",
    "display" : "Country code invalid",
    "definition" : "The provided country code is not supported for ePrescription or eDispensation processing",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Ländercode ungültig"
    }]
  }]
}

```
