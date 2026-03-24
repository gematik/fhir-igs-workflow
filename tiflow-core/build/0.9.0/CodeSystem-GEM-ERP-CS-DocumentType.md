# CodeSystem der Dokumententypen - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem der Dokumententypen**

## CodeSystem: CodeSystem der Dokumententypen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_DocumentType |
| **Copyright/Legal**: gematik GmbH | |

 
Dokumententyp abhängig vom Empfänger des Bundles. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_DocumentType](ValueSet-GEM-ERP-VS-DocumentType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-DocumentType",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType",
  "version" : "0.9.0",
  "name" : "GEM_ERP_CS_DocumentType",
  "title" : "CodeSystem der Dokumententypen",
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
  "description" : "Dokumententyp abhängig vom Empfänger des Bundles.",
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
    "code" : "1",
    "display" : "Health Care Provider Prescription"
  },
  {
    "code" : "2",
    "display" : "Patient Confirmation"
  },
  {
    "code" : "3",
    "display" : "Receipt"
  }]
}

```
