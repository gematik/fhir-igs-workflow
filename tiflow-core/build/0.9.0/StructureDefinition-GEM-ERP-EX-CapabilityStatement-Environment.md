# GEM ERP EX CapabilityStatement Environment - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX CapabilityStatement Environment**

## Extension: GEM ERP EX CapabilityStatement Environment 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Environment | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_EX_CapabilityStatement_Environment |

Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren.

**Context of Use**

This extension may be used on the following element(s):

* Element ID CapabilityStatement

### Zweck und Verwendung

Die Extension GEM_ERP_EX_CapabilityStatement_Environment kennzeichnet die konkrete Betriebsumgebung eines CapabilityStatements.

Mit dem Umgebungskennzeichen wird transparent, ob die beschriebenen Fähigkeiten für eine Produktiv-, Referenz-, Test- oder Entwicklungsumgebung gelten.

### Kodierung und Bindung

Die Extension verwendet ein einzelnes valueCode-Feld mit Required-Bindung an das ValueSet GEM_ERP_VS_CapabilityStatement_Environment.

Zulässige Codes sind:

* PU: Produktivumgebung
* RU: Referenzumgebung
* TU: Testumgebung
* DEV: Entwicklungsumgebung

### Hinweis für Implementierende

Die Environment-Extension sollte pro veröffentlichtem CapabilityStatement genau einmal gesetzt werden, damit Clients die deklarierte Funktionalität eindeutig einer Zielumgebung zuordnen können.

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR CapabilityStatement](StructureDefinition-GEM-ERP-PR-CapabilityStatement.md)
* Examples for this Extension: [ExampleCapabilityStatementServerPU](CapabilityStatement-example-capabilitystatement-server-pu.md), [ExampleCapabilityStatementServerRU](CapabilityStatement-example-capabilitystatement-server-ru.md) and [ExampleCapabilityStatementServerTU](CapabilityStatement-example-capabilitystatement-server-tu.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-EX-CapabilityStatement-Environment)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.csv), [Excel](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Environment.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-CapabilityStatement-Environment",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Environment",
  "version" : "0.9.0",
  "name" : "GEM_ERP_EX_CapabilityStatement_Environment",
  "title" : "GEM ERP EX CapabilityStatement Environment",
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
  "description" : "Diese Extension kennzeichnet die Zielumgebung eines konkreten CapabilityStatements (z. B. Produktiv-, Referenz-, Test- oder Entwicklungsumgebung). Die Information hilft Clients, deklarierte Fähigkeiten im richtigen betrieblichen Kontext zu interpretieren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Environment"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Code der Zielumgebung",
      "definition" : "Umgebungscode gemäß GEM_ERP_CS_CapabilityStatement_Environment (PU, RU, TU, DEV).",
      "comment" : "Der Code beschreibt die Umgebung des konkreten Endpoints, nicht die generische Spezifikation.",
      "min" : 1,
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_CapabilityStatement_Environment"
      }
    }]
  }
}

```
