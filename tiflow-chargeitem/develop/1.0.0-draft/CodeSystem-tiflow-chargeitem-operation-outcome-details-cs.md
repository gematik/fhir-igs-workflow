# TIFLOW ChargeItem Operation Outcome Details CS - TIFlow - Abrechnungsinformationen v1.0.0-draft

TIFlow - Abrechnungsinformationen

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW ChargeItem Operation Outcome Details CS**

## CodeSystem: TIFLOW ChargeItem Operation Outcome Details CS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/chargeitem/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs | *Version*:1.0.0-draft |
| Draft as of 2026-04-15 | *Computable Name*:TIFLOWChargeItemOperationOutcomeDetailsCS |

 
Abrechnungsinformationen-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TIFLOWChargeItemOperationOutcomeDetailsVS](ValueSet-tiflow-chargeitem-operation-outcome-details-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tiflow-chargeitem-operation-outcome-details-cs",
  "url" : "https://gematik.de/fhir/tiflow/chargeitem/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWChargeItemOperationOutcomeDetailsCS",
  "title" : "TIFLOW ChargeItem Operation Outcome Details CS",
  "status" : "draft",
  "date" : "2026-04-15T07:34:34+00:00",
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
  "content" : "complete",
  "count" : 5,
  "concept" : [{
    "code" : "TIFLOW_CHARGEITEM_COVERAGE_NOT_PKV",
    "display" : "Coverage not PKV",
    "definition" : "The referenced prescription coverage type is not PKV and therefore not valid for ChargeItem processing",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Kostenträgertyp nicht PKV"
    }]
  },
  {
    "code" : "TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID",
    "display" : "Dispense signature invalid",
    "definition" : "The PKV dispense dataset is missing a valid signature or contains an invalid signature",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Signatur des PKV-Abgabedatensatzes ungültig"
    }]
  },
  {
    "code" : "TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID",
    "display" : "Dispense certificate invalid",
    "definition" : "The certificate used for the signature of the PKV dispense dataset is invalid, expired, or revoked",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Zertifikat des PKV-Abgabedatensatzes ungültig"
    }]
  },
  {
    "code" : "TIFLOW_CHARGEITEM_ID_REQUIRED",
    "display" : "ChargeItem id required",
    "definition" : "The operation requires a concrete ChargeItem id in the request path",
    "designation" : [{
      "language" : "de-DE",
      "value" : "ChargeItem-ID erforderlich"
    }]
  },
  {
    "code" : "TIFLOW_CHARGEITEM_NOT_FOUND",
    "display" : "ChargeItem not found",
    "definition" : "The referenced ChargeItem resource does not exist",
    "designation" : [{
      "language" : "de-DE",
      "value" : "ChargeItem nicht gefunden"
    }]
  }]
}

```
