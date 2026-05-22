# TI Environments CodeSystem - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Environments CodeSystem**

## CodeSystem: TI Environments CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-core/CodeSystem/ti-environment-codes | *Version*:2.0.0-ballot.1 |
| Active as of 2026-06-01 | *Computable Name*:TIEnvironmentsCS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des TI-Flow-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TIEnvironmentsVS](ValueSet-ti-environment-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "ti-environment-codes",
  "url" : "https://gematik.de/fhir/tiflow-core/CodeSystem/ti-environment-codes",
  "version" : "2.0.0-ballot.1",
  "name" : "TIEnvironmentsCS",
  "title" : "TI Environments CodeSystem",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-01",
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
  "description" : "Dieses CodeSystem definiert standardisierte Umgebungskennzeichen für CapabilityStatements des TI-Flow-Fachdienstes. Es erlaubt die eindeutige Kennzeichnung, ob die beschriebene Fähigkeit für Produktions-, Referenz-, Test- oder Entwicklungsumgebung gilt.",
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
