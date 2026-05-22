# TaskAcceptDateSP - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TaskAcceptDateSP**

## SearchParameter: TaskAcceptDateSP 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-core/SearchParameter/TaskAcceptDateSP | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TaskAcceptDateSP |

 
Das Einlösedatum eines E-Rezeptes. Nach Ablaufen dieses Datums darf ein E-Rezept nicht mehr zu Lasten des Kostenträgers abgegeben werden. 



## Resource Content

```json
{
  "resourceType" : "SearchParameter",
  "id" : "TaskAcceptDateSP",
  "url" : "https://gematik.de/fhir/tiflow-core/SearchParameter/TaskAcceptDateSP",
  "version" : "2.0.0-ballot.1",
  "name" : "TaskAcceptDateSP",
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
  "description" : "Das Einlösedatum eines E-Rezeptes. Nach Ablaufen dieses Datums darf ein E-Rezept nicht mehr zu Lasten des Kostenträgers abgegeben werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "accept-date",
  "base" : ["Task"],
  "type" : "date",
  "expression" : "Task.extension('https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate').value.as(date)",
  "multipleOr" : false,
  "multipleAnd" : true
}

```
