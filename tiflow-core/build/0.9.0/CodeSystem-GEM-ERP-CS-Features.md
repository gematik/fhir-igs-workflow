# ERP Feature CodeSystem - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP Feature CodeSystem**

## CodeSystem: ERP Feature CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_Features | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_Features |
| **Copyright/Legal**: gematik GmbH | |

 
Dieses CodeSystem beschreibt serverseitige Feature-Flags des E-Rezept-Fachdienstes, die keine Workflow-Typen sind. Workflow-Typ-Codes werden weiterhin in GEM_ERP_CS_FlowType gepflegt; dieses CodeSystem ergänzt diese um weitere funktionale Fahigkeiten und Betriebsmerkmale, die in CapabilityStatements als deklarierbare Features verwendet werden. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_CapabilityStatement_Feature](ValueSet-GEM-ERP-VS-CapabilityStatement-Feature.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-Features",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_Features",
  "version" : "0.9.0",
  "name" : "GEM_ERP_CS_Features",
  "title" : "ERP Feature CodeSystem",
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
  "description" : "Dieses CodeSystem beschreibt serverseitige Feature-Flags des E-Rezept-Fachdienstes, die keine Workflow-Typen sind. Workflow-Typ-Codes werden weiterhin in GEM_ERP_CS_FlowType gepflegt; dieses CodeSystem ergänzt diese um weitere funktionale Fahigkeiten und Betriebsmerkmale, die in CapabilityStatements als deklarierbare Features verwendet werden.",
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
  "count" : 2,
  "concept" : [{
    "code" : "eu-prescription",
    "display" : "EU-Feature",
    "definition" : "Unterstützung grenzüberschreitender E-Rezept-Prozesse."
  },
  {
    "code" : "t-prescription-transfer",
    "display" : "Übertragung digitaler Durchschlag",
    "definition" : "Unterstüztung der Übertragung von digitalen Durchschlägen an den BfArM Webdienst"
  }]
}

```
