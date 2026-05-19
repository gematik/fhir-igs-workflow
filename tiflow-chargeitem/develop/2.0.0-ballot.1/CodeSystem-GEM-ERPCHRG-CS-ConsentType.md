# CodeSystem of types for a consent - TIFlow - Abrechnungsinformationen v2.0.0-ballot.1

TIFlow - Abrechnungsinformationen

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem of types for a consent**

## CodeSystem: CodeSystem of types for a consent 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERPCHRG_CS_ConsentType |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Type of patient consent. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERPCHRG_VS_ConsentType](ValueSet-GEM-ERPCHRG-VS-ConsentType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERPCHRG-CS-ConsentType",
  "url" : "https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType",
  "version" : "2.0.0-ballot.1",
  "name" : "GEM_ERPCHRG_CS_ConsentType",
  "title" : "CodeSystem of types for a consent",
  "status" : "active",
  "experimental" : false,
  "date" : "2028-04-01",
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
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "content" : "complete",
  "count" : 1,
  "concept" : [{
    "code" : "CHARGCONS",
    "display" : "Consent for saving electronic charge item"
  }]
}

```
