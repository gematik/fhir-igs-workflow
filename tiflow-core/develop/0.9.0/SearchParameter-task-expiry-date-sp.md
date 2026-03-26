# TaskExpiryDateSP - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TaskExpiryDateSP**

## SearchParameter: TaskExpiryDateSP 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/workflow/core/SearchParameter/task-expiry-date-sp | *Version*:0.9.0 |
| Active as of 2025-12-15 | *Computable Name*:TaskExpiryDateSP |

 
Das Ablaufdatum eines E-Rezepzes. Nach ablauf dieses Datums darf ein E-Rezept nicht mehr beliefert werden. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "task-expiry-date-sp",
  "url" : "https://gematik.de/fhir/workflow/core/SearchParameter/task-expiry-date-sp",
  "version" : "0.9.0",
  "name" : "TaskExpiryDateSP",
  "status" : "active",
  "date" : "2025-12-15",
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
