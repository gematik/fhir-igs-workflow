# Communication searchset response for Rx - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication searchset response for Rx**

## Example Bundle: Communication searchset response for Rx



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleRxCommunicationSearchset",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Communication?received=NULL"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Communication/ExampleRxCommunicationDispReq",
    "resource" : {
      "resourceType" : "Communication",
      "id" : "ExampleRxCommunicationDispReq",
      "status" : "unknown",
      "sent" : "2026-03-20T10:15:00+01:00",
      "payload" : [{
        "contentString" : "Bitte Rezept in Filiale bereitstellen"
      }]
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
