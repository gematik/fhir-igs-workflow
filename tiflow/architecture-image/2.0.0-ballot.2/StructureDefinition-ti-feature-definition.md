# TI Feature Definition - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Feature Definition**

## Logical Model: TI Feature Definition 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature-definition | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-06-16 | *Computable Name*:TIFeatureDefinition |

 
Logical Model zur Beschreibung eines aktivierbaren Features. 

**Usages:**

* Derived from this Logical Model: [Feature: WF160 - Flowtype für Apothekenpflichtige Arzneimittel](StructureDefinition-ti-flow-feature-wf160.md) and [Feature: WF169 - Flowtype für Apothekenpflichtige Arzneimittel mit Steuerung durch den Leistungserbringer](StructureDefinition-ti-flow-feature-wf169.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-feature-definition.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-feature-definition.csv), [Excel](StructureDefinition-ti-feature-definition.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-feature-definition",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature-definition",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFeatureDefinition",
  "title" : "TI Feature Definition",
  "status" : "draft",
  "date" : "2026-06-16T10:33:01+00:00",
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
  "description" : "Logical Model zur Beschreibung eines aktivierbaren Features.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature-definition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "ti-feature-definition",
      "path" : "ti-feature-definition",
      "short" : "TI Feature Definition",
      "definition" : "Logical Model zur Beschreibung eines aktivierbaren Features."
    },
    {
      "id" : "ti-feature-definition.url",
      "path" : "ti-feature-definition.url",
      "short" : "Canonical-URL des Features",
      "definition" : "Canonical-URL des Features",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "uri"
      }]
    },
    {
      "id" : "ti-feature-definition.name",
      "path" : "ti-feature-definition.name",
      "short" : "Maschinell verarbeitbarer Name",
      "definition" : "Maschinell verarbeitbarer Name",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ti-feature-definition.title",
      "path" : "ti-feature-definition.title",
      "short" : "Menschenlesbarer Titel",
      "definition" : "Menschenlesbarer Titel",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "ti-feature-definition.status",
      "path" : "ti-feature-definition.status",
      "short" : "draft | active | retired",
      "definition" : "draft | active | retired",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ti-feature-definition.description",
      "path" : "ti-feature-definition.description",
      "short" : "Fachliche Beschreibung",
      "definition" : "Fachliche Beschreibung",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "markdown"
      }]
    },
    {
      "id" : "ti-feature-definition.valueType",
      "path" : "ti-feature-definition.valueType",
      "short" : "boolean | code | Coding — Typ des value-Felds",
      "definition" : "boolean | code | Coding — Typ des value-Felds",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "code"
      }]
    },
    {
      "id" : "ti-feature-definition.context",
      "path" : "ti-feature-definition.context",
      "short" : "Element-Kontexte im CapabilityStatement",
      "definition" : "Element-Kontexte im CapabilityStatement",
      "min" : 1,
      "max" : "*",
      "type" : [{
        "code" : "uri"
      }]
    }]
  }
}

```
