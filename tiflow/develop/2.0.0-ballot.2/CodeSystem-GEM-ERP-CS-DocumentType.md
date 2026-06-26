# CodeSystem der Dokumententypen - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem der Dokumententypen**

## CodeSystem: CodeSystem der Dokumententypen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_CS_DocumentType |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dokumententyp abhängig vom Empfänger des Bundles. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_DocumentType](ValueSet-GEM-ERP-VS-DocumentType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-DocumentType",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_CS_DocumentType",
  "title" : "CodeSystem der Dokumententypen",
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
  "description" : "Dokumententyp abhängig vom Empfänger des Bundles.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
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
