# CodeSystem der Flowtypen - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CodeSystem der Flowtypen**

## CodeSystem: CodeSystem der Flowtypen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_FlowType |
| **Copyright/Legal**: gematik GmbH | |

 
Zeigt die verschiedenen Typen des E-Rezept Workflows entsprechend der Verordnungsformulare. 
WICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen! 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_CapabilityStatement_Feature](ValueSet-GEM-ERP-VS-CapabilityStatement-Feature.md)
* [GEM_ERP_VS_FlowType](ValueSet-GEM-ERP-VS-FlowType.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-FlowType",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
  "version" : "0.9.0",
  "name" : "GEM_ERP_CS_FlowType",
  "title" : "CodeSystem der Flowtypen",
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
  "description" : "Zeigt die verschiedenen Typen des E-Rezept Workflows entsprechend der Verordnungsformulare.\n\nWICHTIG: Der Codebereich 9xx ist reserviert für Abrechnungsprozesse in Apotheken wie z.B. Pharmazeutische Dienstleistungen!",
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
