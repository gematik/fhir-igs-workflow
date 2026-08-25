# Communication searchset response for Rx - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication searchset response for Rx**

## Example Bundle: Communication searchset response for Rx



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleCommunicationGetDispReq",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Communication?_sort=sent&_count=50&sent=gt2025-01-14"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Communication/ExampleCommunicationDispReq",
    "resource" : {
      "resourceType" : "Communication",
      "id" : "ExampleCommunicationDispReq",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq|2.0"]
      },
      "extension" : [{
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType",
        "valueCoding" : {
          "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
          "code" : "160"
        }
      }],
      "basedOn" : [{
        "reference" : "Task/160.000.033.491.280.78"
      }],
      "status" : "unknown",
      "sent" : "2028-10-01T15:29:00.434+00:00",
      "recipient" : [{
        "identifier" : {
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "3-2-APO-XanthippeVeilchenblau01"
        }
      }],
      "sender" : {
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "X123456789",
          "assigner" : {
            "identifier" : {
              "value" : "168140950"
            }
          }
        }
      },
      "payload" : [{
        "contentString" : "{ \"version\": 1, \"supplyOptionsType\": \"onPremise\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"phone\": \"004916094858168\" }"
      }]
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
