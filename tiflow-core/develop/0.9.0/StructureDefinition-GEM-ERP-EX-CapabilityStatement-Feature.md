# GEM ERP EX CapabilityStatement Feature - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX CapabilityStatement Feature**

## Extension: GEM ERP EX CapabilityStatement Feature 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_EX_CapabilityStatement_Feature |

Diese Compound-Extension deklariert ein einzelnes Feature eines konkreten Fachdienst-Deployments. Das Teilfeld definition verweist per Canonical auf den fachlichen Feature-Bezeichner (Workflow-Typ oder sonstiges Feature), während value den aktuellen Aktivierungszustand dieses Features am betrachteten Endpoint beschreibt.

**Context of Use**

This extension may be used on the following element(s):

* Element ID CapabilityStatement

### Zweck und Verwendung

Die Extension-Familie für CapabilityStatements ergänzt die statische Schnittstellenbeschreibung um konkrete Laufzeit- und Deployment-Informationen.

* GEM_ERP_EX_CapabilityStatement_Feature beschreibt einzelne deklarierbare Features als Paar aus Coding (coding) und Aktivierungsstatus (value).
* GEM_ERP_EX_CapabilityStatement_Environment kennzeichnet die Zielumgebung (PU, RU, TU, DEV), für die die Deklaration gilt.

### Modellierungsprinzip

Das Feature-Muster ist als Compound-Extension umgesetzt:

* coding: Coding mit system + code auf ein Feature-Konzept
* value: boolescher Aktivierungszustand

Für die Referenz werden zwei CodeSysteme kombiniert:

* GEM_ERP_CS_FlowType für Workflow-Typ-Features
* GEM_ERP_CS_Features für weitere nicht-workflowbezogene Features

### Hinweis für Implementierende

Bei der Erzeugung konkreter CapabilityStatements sollte pro Feature eine eigene Instanz der Feature-Extension gesetzt werden. Damit kann für jede Funktion transparent dargestellt werden, ob sie auf einem konkreten Endpoint aktiv ist.

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR CapabilityStatement](StructureDefinition-GEM-ERP-PR-CapabilityStatement.md)
* Examples for this Extension: [ExampleCapabilityStatementServerPU](CapabilityStatement-example-capabilitystatement-server-pu.md), [ExampleCapabilityStatementServerRU](CapabilityStatement-example-capabilitystatement-server-ru.md) and [ExampleCapabilityStatementServerTU](CapabilityStatement-example-capabilitystatement-server-tu.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-EX-CapabilityStatement-Feature)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Feature.csv), [Excel](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Feature.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-CapabilityStatement-Feature.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-CapabilityStatement-Feature",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature",
  "version" : "0.9.0",
  "name" : "GEM_ERP_EX_CapabilityStatement_Feature",
  "title" : "GEM ERP EX CapabilityStatement Feature",
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
  "description" : "Diese Compound-Extension deklariert ein einzelnes Feature eines konkreten Fachdienst-Deployments. Das Teilfeld definition verweist per Canonical auf den fachlichen Feature-Bezeichner (Workflow-Typ oder sonstiges Feature), während value den aktuellen Aktivierungszustand dieses Features am betrachteten Endpoint beschreibt.",
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
      "short" : "Deklaration eines aktivierbaren CapabilityStatement-Features",
      "definition" : "Compound-Extension mit den Teilslices coding und value zur Beschreibung eines einzelnen Features inklusive Aktivierungszustand.",
      "comment" : "Diese Extension kann auf CapabilityStatement-Ebene mehrfach wiederholt werden (0..*), um die komplette Feature-Menge eines konkreten Systems zu beschreiben."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "description" : "Extensions are always sliced by (at least) url",
        "rules" : "closed"
      },
      "short" : "Container für die Child-Slices coding und value",
      "definition" : "Enthält die verpflichtenden Child-Slices für Feature-Code und Feature-Status.",
      "comment" : "Nur die Slices coding und value sind zulässig.",
      "min" : 2
    },
    {
      "id" : "Extension.extension:coding",
      "path" : "Extension.extension",
      "sliceName" : "coding",
      "short" : "Coding des Feature-Bezeichners",
      "definition" : "Verweist per valueCoding auf ein Feature-Konzept aus GEM_ERP_CS_FlowType oder GEM_ERP_CS_Features.",
      "comment" : "Das Coding identifiziert, welches Feature beschrieben wird.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:coding.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:coding.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "coding"
    },
    {
      "id" : "Extension.extension:coding.value[x]",
      "path" : "Extension.extension.value[x]",
      "short" : "Feature-Coding",
      "definition" : "Coding eines Feature-Konzepts aus den zulässigen CodeSystemen des Feature-ValueSets.",
      "comment" : "Für Workflow-Typen auf GEM_ERP_CS_FlowType, für sonstige Features auf GEM_ERP_CS_Features referenzieren.",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_CapabilityStatement_Feature"
      }
    },
    {
      "id" : "Extension.extension:coding.value[x].system",
      "path" : "Extension.extension.value[x].system",
      "short" : "CodeSystem des Features",
      "definition" : "Referenziert das verwendete Feature-CodeSystem, z. B. GEM_ERP_CS_FlowType oder GEM_ERP_CS_Features.",
      "min" : 1
    },
    {
      "id" : "Extension.extension:coding.value[x].code",
      "path" : "Extension.extension.value[x].code",
      "short" : "Feature-Code",
      "definition" : "Konkreter Feature-Code innerhalb des gewählten CodeSystems.",
      "min" : 1
    },
    {
      "id" : "Extension.extension:value",
      "path" : "Extension.extension",
      "sliceName" : "value",
      "short" : "Aktivierungszustand des Features",
      "definition" : "Beschreibt, ob das in definition referenzierte Feature in dieser Umgebung aktiv ist.",
      "comment" : "true = aktiv; false = deklariert, aber derzeit nicht aktiv.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:value.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:value.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "value"
    },
    {
      "id" : "Extension.extension:value.value[x]",
      "path" : "Extension.extension.value[x]",
      "short" : "Feature aktiv (true/false)",
      "definition" : "Boolean-Wert zur Laufzeitaktivierung des referenzierten Features.",
      "comment" : "Soll den effektiven Betriebszustand der referenzierten Funktionalität wiedergeben.",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
