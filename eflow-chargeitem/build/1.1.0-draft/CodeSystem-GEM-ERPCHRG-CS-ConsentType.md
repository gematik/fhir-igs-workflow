# CodeSystem of types for a consent - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem of types for a consent**

## CodeSystem: CodeSystem of types for a consent 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:GEM_ERPCHRG_CS_ConsentType |
| **Copyright/Legal**: gematik GmbH | |

 
Type of patient consent. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERPCHRG_VS_ConsentType](ValueSet-GEM-ERPCHRG-VS-ConsentType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERPCHRG-CS-ConsentType",
  "url" : "https://gematik.de/fhir/erpchrg/CodeSystem/GEM_ERPCHRG_CS_ConsentType",
  "version" : "1.1.0-draft",
  "name" : "GEM_ERPCHRG_CS_ConsentType",
  "title" : "CodeSystem of types for a consent",
  "status" : "draft",
  "date" : "2025-04-10",
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
    "code" : "CHARGCONS",
    "display" : "Consent for saving electronic charge item"
  }]
}

```
