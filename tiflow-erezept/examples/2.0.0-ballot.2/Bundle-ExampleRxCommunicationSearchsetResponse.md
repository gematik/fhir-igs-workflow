# Antwortbundle für GET /Communication (Rx) - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwortbundle für GET /Communication (Rx)**

## Example Bundle: Antwortbundle für GET /Communication (Rx)



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleRxCommunicationSearchsetResponse",
  "type" : "searchset",
  "total" : 2,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Communication"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Communication/a218a36e-f2fd-4603-ba67-c827acfef01b",
    "resource" : {
      "resourceType" : "Communication",
      "id" : "a218a36e-f2fd-4603-ba67-c827acfef01b",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq|2.0"],
        "tag" : [{
          "display" : "Dispense Request from Patient to Pharmacy"
        },
        {
          "display" : "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
        }]
      },
      "extension" : [{
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType",
        "valueCoding" : {
          "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
          "code" : "160",
          "display" : "Flowtype für Apothekenpflichtige Arzneimittel"
        }
      }],
      "basedOn" : [{
        "reference" : "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
      }],
      "status" : "unknown",
      "sent" : "2028-10-01T15:29:00.434+00:00",
      "recipient" : [{
        "identifier" : {
          "system" : "https://gematik.de/fhir/sid/telematik-id",
          "value" : "3-SMC-B-Testkarte-883110000123465"
        }
      }],
      "sender" : {
        "identifier" : {
          "system" : "http://fhir.de/sid/gkv/kvid-10",
          "value" : "X234567890"
        }
      },
      "payload" : [{
        "contentString" : "{ \"version\": \"1\", \"supplyOptionsType\": \"delivery\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"hint\": \"Bitte im Morsecode klingeln: -.-.\", \"phone\": \"004916094858168\" }"
      }]
    },
    "search" : {
      "mode" : "match"
    }
  },
  {
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596",
    "resource" : {
      "resourceType" : "Communication",
      "id" : "7977a4ab-97a9-4d95-afb3-6c4c1e2ac596",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply|2.0"],
        "tag" : [{
          "display" : "Reply from Pharmacy to Patient"
        },
        {
          "display" : "Communication message sent by pharmacy to patient in response to a previous Task-related message"
        }]
      },
      "basedOn" : [{
        "reference" : "Task/160.000.033.491.280.78"
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
          "value" : "3-SMC-B-Testkarte-883110000123465"
        }
      },
      "payload" : [{
        "extension" : [{
          "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState",
          "valueCoding" : {
            "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus",
            "code" : "20"
          }
        },
        {
          "extension" : [{
            "url" : "delivery",
            "valueBoolean" : true
          },
          {
            "url" : "onPremise",
            "valueBoolean" : true
          },
          {
            "url" : "shipment",
            "valueBoolean" : false
          }],
          "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"
        }],
        "contentString" : "Eisern"
      }]
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
