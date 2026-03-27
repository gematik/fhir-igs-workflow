# GEM ERP EX CapabilityStatement FDConfiguration - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX CapabilityStatement FDConfiguration**

## Extension: GEM ERP EX CapabilityStatement FDConfiguration 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_FDConfiguration | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_EX_CapabilityStatement_FDConfiguration |

Diese Extension deklariert eine konkrete Konfigurationsausprägung des E-Rezept-Fachdienstes auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert und bevorzugt gegen GEM_ERP_VS_FDConfiguration geprüft.

**Context of Use**

This extension may be used on the following element(s):

* Element ID CapabilityStatement

### Zweck und Verwendung

Die Extension GEM_ERP_EX_CapabilityStatement_FDConfiguration ermöglicht die Deklaration konkreter Fachdienst-Konfigurationskennzeichen im CapabilityStatement.

Die Werte werden als `code` übertragen und bevorzugt gegen das ValueSet GEM_ERP_VS_FDConfiguration validiert.

### Not-Present-Pattern

Das zugrunde liegende CodeSystem GEM_ERP_CS_FDConfiguration verwendet bewusst `^content = #not-present`.

Dieses Pattern wurde gewählt, weil die konkrete Konzeptliste nicht in diesem IG-Paket gepflegt wird, sondern extern in gematik-Releaseartefakten versioniert bereitgestellt wird.

### Releaseprozess und Erweiterung

Neue FDConfiguration-Codes werden über den gematik-Releaseprozess eingeführt und nicht über eine IG-Publikation in diesem Repository.

Damit bleibt die Spezifikation stabil, während Konfigurationscodes kontrolliert im Betriebs- und Freigabeprozess erweitert werden können.

### Hinweis für Validierung

Validatoren können bei unbekannten Codes Warnungen ausgeben, wenn die konkrete externe Code-Liste lokal nicht vorliegt.

Dieses Verhalten ist erwartet und fachlich korrekt, solange der Terminologieserver bzw. das Releaseartefakt die neuen Codes kennt.

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR CapabilityStatement](StructureDefinition-GEM-ERP-PR-CapabilityStatement.md)
* Examples for this Extension: [ExampleCapabilityStatementServerPU](CapabilityStatement-example-capabilitystatement-server-pu.md), [ExampleCapabilityStatementServerRU](CapabilityStatement-example-capabilitystatement-server-ru.md) and [ExampleCapabilityStatementServerTU](CapabilityStatement-example-capabilitystatement-server-tu.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-EX-CapabilityStatement-FDConfiguration)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-CapabilityStatement-FDConfiguration.csv), [Excel](StructureDefinition-GEM-ERP-EX-CapabilityStatement-FDConfiguration.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-CapabilityStatement-FDConfiguration.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-CapabilityStatement-FDConfiguration",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_FDConfiguration",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_EX_CapabilityStatement_FDConfiguration",
  "title" : "GEM ERP EX CapabilityStatement FDConfiguration",
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
  "description" : "Diese Extension deklariert eine konkrete Konfigurationsausprägung des E-Rezept-Fachdienstes auf CapabilityStatement-Ebene. Die Konfiguration wird als Code transportiert und bevorzugt gegen GEM_ERP_VS_FDConfiguration geprüft.",
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
      "short" : "Konfigurationskennzeichen für den Fachdienst",
      "definition" : "Beschreibt eine konkrete FD-Konfiguration als Code im Kontext eines CapabilityStatements.",
      "comment" : "Die Codebedeutung wird über externe gematik-Releaseartefakte gepflegt."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_FDConfiguration"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "FD-Konfigurationscode",
      "definition" : "Code für eine Fachdienstkonfiguration aus dem extern gepflegten FDConfiguration-CodeSystem.",
      "comment" : "Preferred-Bindung erlaubt kontrollierte Erweiterung und rückwärtskompatible Verarbeitung bei neu eingeführten Codes.",
      "min" : 1,
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FDConfiguration"
      }
    }]
  }
}

```
