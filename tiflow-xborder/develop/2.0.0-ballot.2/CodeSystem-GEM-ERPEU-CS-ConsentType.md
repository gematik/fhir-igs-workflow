# CodeSystem of types for a consent - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem of types for a consent**

## CodeSystem: CodeSystem of types for a consent 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-05-26 | *Computable Name*:GEM_ERPEU_CS_ConsentType |
| **Copyright/Legal**: gematik GmbH | |

 
Type of patient consent. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERPEU_VS_ConsentType](ValueSet-GEM-ERPEU-VS-ConsentType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERPEU-CS-ConsentType",
  "url" : "https://gematik.de/fhir/erp-eu/CodeSystem/GEM_ERPEU_CS_ConsentType",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERPEU_CS_ConsentType",
  "title" : "CodeSystem of types for a consent",
  "status" : "draft",
  "date" : "2026-05-26",
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
  "description" : "Type of patient consent.",
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
  "count" : 1,
  "concept" : [{
    "code" : "EUDISPCONS",
    "display" : "Consent for redeeming e-prescriptions in EU countries"
  }]
}

```
