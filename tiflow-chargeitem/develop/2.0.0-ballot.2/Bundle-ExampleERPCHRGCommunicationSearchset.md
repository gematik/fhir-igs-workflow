# Communication searchset response for ERP-CHRG - TIFlow - Abrechnungsinformationen v2.0.0-ballot.2

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Communication searchset response for ERP-CHRG**

## Example Bundle: Communication searchset response for ERP-CHRG



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleERPCHRGCommunicationSearchset",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Communication?received=NULL"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Communication/Communication_ChargChangeRequest",
    "resource" : {
      "resourceType" : "Communication",
      "id" : "b4cf7f71-3ade-40ab-97a9-929f95af29f2",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReq"],
        "tag" : [{
          "display" : "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
        }]
      },
      "basedOn" : [{
        "reference" : "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
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
          "value" : "P987654321"
        }
      },
      "payload" : [{
        "contentString" : "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."
      }]
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
