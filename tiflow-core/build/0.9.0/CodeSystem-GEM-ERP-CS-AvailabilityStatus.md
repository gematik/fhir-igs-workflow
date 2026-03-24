# CodeSystem des Verfügbarkeitsstatus - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem des Verfügbarkeitsstatus**

## CodeSystem: CodeSystem des Verfügbarkeitsstatus 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_AvailabilityStatus |
| **Copyright/Legal**: gematik GmbH | |

 
Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_AvailabilityStatus](ValueSet-GEM-ERP-VS-AvailabilityStatus.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-AvailabilityStatus",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_AvailabilityStatus",
  "version" : "0.9.0",
  "name" : "GEM_ERP_CS_AvailabilityStatus",
  "title" : "CodeSystem des Verfügbarkeitsstatus",
  "status" : "draft",
  "date" : "2025-09-25",
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
  "description" : "Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
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
  }]
}

```
