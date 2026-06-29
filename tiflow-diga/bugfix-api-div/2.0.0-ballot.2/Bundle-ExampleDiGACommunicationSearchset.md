# Communication searchset response for DiGA - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication searchset response for DiGA**

## Example Bundle: Communication searchset response for DiGA



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleDiGACommunicationSearchset",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Communication?received=NULL"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Communication/Communication_Reply_DiGA",
    "resource" : {
      "resourceType" : "Communication",
      "id" : "140f716f-f649-44fe-9a4e-157eb3c8adf3",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA"]
      },
      "basedOn" : [{
        "reference" : "Task/ExampleDiGATaskInReadyState"
      }],
      "status" : "unknown",
      "sent" : "2028-10-01T15:29:00.434+00:00",
      "recipient" : [{
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "X234567890"
        }
      }],
      "sender" : {
        "identifier" : {
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "8-SMC-B-Testkarte-783498105628375"
        }
      },
      "payload" : [{
        "contentString" : "Nachrichteninhalt für den Versicherten"
      }]
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
