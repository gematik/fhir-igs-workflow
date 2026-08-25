# Antwort-Nachricht der Apotheke an den Patienten - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwort-Nachricht der Apotheke an den Patienten**

## Example Communication: Antwort-Nachricht der Apotheke an den Patienten



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "ExampleCommunicationReplyPharmacy",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply|2.0"]
  },
  "basedOn" : [{
    "reference" : "Task/160.000.033.491.280.78"
  }],
  "status" : "unknown",
  "sent" : "2028-10-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789",
      "assigner" : {
        "identifier" : {
          "value" : "168140950"
        }
      }
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "3-2-APO-XanthippeVeilchenblau01"
    }
  },
  "payload" : [{
    "extension" : [{
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
    },
    {
      "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus",
        "code" : "20"
      }
    }],
    "contentString" : "{\"version\": 1,\"supplyOptionsType\": \"onPremise\",\"info_text\": \"Hallo, wir haben das Medikament vorraetig. Kommen Sie gern in die Filiale oder wir schicken einen Boten.\",\"url\": \"https://sonnenschein-apotheke.de\"}"
  }]
}

```
