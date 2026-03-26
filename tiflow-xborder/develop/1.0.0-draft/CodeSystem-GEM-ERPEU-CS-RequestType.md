# CodeSystem of NCPeH Request Types - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem of NCPeH Request Types**

## CodeSystem: CodeSystem of NCPeH Request Types 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_RequestType | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_CS_RequestType |
| **Copyright/Legal**: gematik GmbH | |

 
Type of Request from NCPeH 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERPEU_VS_RequestType](ValueSet-GEM-ERPEU-VS-RequestType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERPEU-CS-RequestType",
  "url" : "https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_RequestType",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERPEU_CS_RequestType",
  "title" : "CodeSystem of NCPeH Request Types",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "Type of Request from NCPeH",
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
  "count" : 3,
  "concept" : [{
    "code" : "demographics",
    "display" : "Abruf demographischer Daten"
  },
  {
    "code" : "e-prescriptions-list",
    "display" : "Abruf der E-Rezepte Liste"
  },
  {
    "code" : "e-prescriptions-retrieval",
    "display" : "Abruf eines E-Rezeptes"
  }]
}

```
