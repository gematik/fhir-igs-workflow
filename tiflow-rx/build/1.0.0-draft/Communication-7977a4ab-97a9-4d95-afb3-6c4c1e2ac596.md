# Antwort-Nachricht der Apotheke an den Patienten - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwort-Nachricht der Apotheke an den Patienten**

## Example Communication: Antwort-Nachricht der Apotheke an den Patienten

Profile: [GEM ERP PR Communication Reply](StructureDefinition-GEM-ERP-PR-Communication-Reply.md)

Tags: Reply from Pharmacy to Patient (Details: [not stated] code null = 'Reply from Pharmacy to Patient'), Communication message sent by pharmacy to patient in response to a previous Task-related message (Details: [not stated] code null = 'Communication message sent by pharmacy to patient in response to a previous Task-related message')

**basedOn**: [Task/160.000.033.491.280.78](https://simplifier.net/resolve?scope=de.basisprofil.r4@1.5.4&canonical=http://fhir.org/packages/de.basisprofil.r4/Task/160.000.033.491.280.78)

**status**: Unknown

**sent**: 2026-07-01 15:29:00+0000

**recipient**: Identifier: NamingSystemKVID/X234567890

**sender**: Identifier: `https://gematik.de/fhir/sid/telematik-id`/3-SMC-B-Testkarte-883110000123465

> **payload****GEM ERP EX AvailabilityState**: [CodeSystem des Verfügbarkeitsstatus: 20](CodeSystem-GEM-ERP-CS-AvailabilityStatus.md#GEM-ERP-CS-AvailabilityStatus-20) (noch Heute verfügbar)
> **GEM ERP EX SupplyOptionsType**
* delivery: true
* onPremise: true
* shipment: false

**content**: Eisern



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "7977a4ab-97a9-4d95-afb3-6c4c1e2ac596",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-PR-Communication-Reply"],
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
  "sent" : "2026-07-01T15:29:00.434+00:00",
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
      "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-AvailabilityState",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM-ERP-CS-AvailabilityStatus",
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
      "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM-ERP-EX-SupplyOptionsType"
    }],
    "contentString" : "Eisern"
  }]
}

```
