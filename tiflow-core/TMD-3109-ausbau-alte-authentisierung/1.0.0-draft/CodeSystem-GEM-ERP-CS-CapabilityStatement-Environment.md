# ERP CapabilityStatement Environment CodeSystem - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP CapabilityStatement Environment CodeSystem**

## CodeSystem: ERP CapabilityStatement Environment CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_CapabilityStatement_Environment | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_CS_CapabilityStatement_Environment |
| **Copyright/Legal**: gematik GmbH | |

 
Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GEM_ERP_VS_CapabilityStatement_Environment](ValueSet-GEM-ERP-VS-CapabilityStatement-Environment.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "GEM-ERP-CS-CapabilityStatement-Environment",
  "url" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_CapabilityStatement_Environment",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_CS_CapabilityStatement_Environment",
  "title" : "ERP CapabilityStatement Environment CodeSystem",
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
  "description" : "Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des E-Rezept-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt.",
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
  "count" : 4,
  "concept" : [{
    "code" : "PU",
    "display" : "Produktivumgebung",
    "definition" : "Produktive Betriebsumgebung für realen Versorgungseinsatz."
  },
  {
    "code" : "RU",
    "display" : "Referenzumgebung",
    "definition" : "Referenzumgebung für Interoperabilitäts- und Konformitätsabgleiche."
  },
  {
    "code" : "TU",
    "display" : "Testumgebung",
    "definition" : "Testumgebung für technische und fachliche Verifikation."
  },
  {
    "code" : "DEV",
    "display" : "Entwicklungsumgebung",
    "definition" : "Entwicklungsumgebung für Implementierung und frühe Integrationsprüfung."
  }]
}

```
