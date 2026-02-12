# CodeSystem des Verfügbarkeitsstatus - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem des Verfügbarkeitsstatus**

## CodeSystem: CodeSystem des Verfügbarkeitsstatus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/eflow-rx-availabilitystatus | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxAvailabilityStatusCS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [EFlowRxAvailabilityStatusVS](ValueSet-eflow-rx-availabilitystatus.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "eflow-rx-availabilitystatus",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/eflow-rx-availabilitystatus",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxAvailabilityStatusCS",
  "title" : "CodeSystem des Verfügbarkeitsstatus",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "10",
      "display" : "sofort verfügbar"
    },
    {
      "code" : "20",
      "display" : "noch Heute verfügbar"
    },
    {
      "code" : "30",
      "display" : "am nächsten Werktag - vormittags"
    },
    {
      "code" : "40",
      "display" : "am nächsten Werktag- nachmittags"
    },
    {
      "code" : "50",
      "display" : "nicht verfügbar"
    },
    {
      "code" : "90",
      "display" : "unbekannt"
    }
  ]
}

```
