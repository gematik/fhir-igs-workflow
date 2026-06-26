# TaskExpiryDateSP - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TaskExpiryDateSP**

## SearchParameter: TaskExpiryDateSP 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/SearchParameter/TaskExpiryDateSP | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TaskExpiryDateSP |
| **Copyright/Legal**: gematik GmbH / Dieser Implementation Guide ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Das Ablaufdatum eines E-Rezepzes. Nach ablauf dieses Datums darf ein E-Rezept nicht mehr beliefert werden. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "TaskExpiryDateSP",
  "url" : "https://gematik.de/fhir/tiflow/SearchParameter/TaskExpiryDateSP",
  "version" : "2.0.0-ballot.2",
  "name" : "TaskExpiryDateSP",
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
  "description" : "Das Ablaufdatum eines E-Rezepzes. Nach ablauf dieses Datums darf ein E-Rezept nicht mehr beliefert werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "expiry-date",
  "base" : ["Task"],
  "type" : "date",
  "expression" : "Task.extension('https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate').value.as(date)",
  "multipleOr" : false,
  "multipleAnd" : true
}

```
