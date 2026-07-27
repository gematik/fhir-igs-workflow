# CodeSystem der Flowtypes in TIFlow Anwendungen - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem der Flowtypes in TIFlow Anwendungen**

## CodeSystem: CodeSystem der Flowtypes in TIFlow Anwendungen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:GEM_ERP_CS_FlowType |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Zeigt die verschiedenen Typen der TI Workflows entsprechend der Verordnungsformulare. 
WICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen! 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_FlowType](ValueSet-GEM-ERP-VS-FlowType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-FlowType",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_CS_FlowType",
  "title" : "CodeSystem der Flowtypes in TIFlow Anwendungen",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-30",
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
  "description" : "Zeigt die verschiedenen Typen der TI Workflows entsprechend der Verordnungsformulare.\n\nWICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen!",
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
  "count" : 7,
  "concept" : [{
    "code" : "160",
    "display" : "Flowtype für Apothekenpflichtige Arzneimittel"
  },
  {
    "code" : "162",
    "display" : "Flowtype für Digitale Gesundheitsanwendungen"
  },
  {
    "code" : "165",
    "display" : "Flowtype für Betäubungsmittel"
  },
  {
    "code" : "166",
    "display" : "Flowtype für Arzneimittel nach § 3a AMVV"
  },
  {
    "code" : "169",
    "display" : "Flowtype zur Workflow-Steuerung durch Leistungserbringer"
  },
  {
    "code" : "200",
    "display" : "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
  },
  {
    "code" : "209",
    "display" : "Flowtype zur Workflow-Steuerung durch Leistungserbringer (PKV)"
  }]
}

```
