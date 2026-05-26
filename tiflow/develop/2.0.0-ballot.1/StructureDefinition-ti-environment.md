# TI Environment - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Environment**

## Extension: TI Environment 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment | *Version*:2.0.0-ballot.1 |
| Active as of 2026-06-01 | *Computable Name*:TIEnvironment |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren.

**Context of Use**

This extension may be used on the following element(s):

* Element ID CapabilityStatement

**Usage info**

**Usages:**

* Use this Extension: [Capability Statement Profil für den TI-Flow-Fachdienst](StructureDefinition-ti-flow-capability-statement.md)
* Examples for this Extension: [CapabilityStatement/ExampleCapabilityStatementServerPU](CapabilityStatement-ExampleCapabilityStatementServerPU.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-environment.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-environment.csv), [Excel](StructureDefinition-ti-environment.xlsx), [Schematron](StructureDefinition-ti-environment.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-environment",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment",
  "version" : "2.0.0-ballot.1",
  "name" : "TIEnvironment",
  "title" : "TI Environment",
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
  "description" : "Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "CapabilityStatement"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Umgebungskennzeichen für ein CapabilityStatement",
      "definition" : "Kennzeichnet die Betriebsumgebung, für die die in diesem CapabilityStatement beschriebenen Fähigkeiten gelten.",
      "comment" : "Empfohlen für jede Server-Instanz, damit die Fähigkeitsdeklaration eindeutig einer Umgebung zugeordnet werden kann."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Code der Zielumgebung",
      "definition" : "Umgebungscode gemäß TIEnvironmentsVS (bspw. PU, RU, TU, DEV).",
      "comment" : "Der Code beschreibt die Umgebung des konkreten Endpoints, nicht die generische Spezifikation.",
      "min" : 1,
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/tiflow/ValueSet/ti-environment-vs"
      }
    }]
  }
}

```
