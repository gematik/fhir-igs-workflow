# TI Feature - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Feature**

## Extension: TI Feature 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFeature |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Deklariert ein einzelnes Feature eines Fachdienst-Deployments. Das Teilfeld `definition` verweist per Canonical auf den Feature-Bezeichner (analog zum HL7 Application Feature Framework, `hl7.fhir.uv.application-feature`); `value` beschreibt den aktuellen Zustand des Features am betrachteten Endpoint.

Kompatibilitätshinweis: Diese Extension spiegelt bewusst die Sub-Extension-Namen `definition` und `value` des HL7-Frameworks wider, um eine spätere Migration oder Profilierung ohne Breaking Change zu ermöglichen.

**Context of Use**

This extension may be used on the following element(s):

* Element ID CapabilityStatement
* Element ID CapabilityStatement.rest
* Element ID CapabilityStatement.rest.resource

**Usage info**

**Usages:**

* Use this Extension: [Capability Statement Profil für den TI-Flow-Fachdienst](StructureDefinition-ti-flow-capability-statement.md)
* Examples for this Extension: [CapabilityStatement/ExampleCapabilityStatementServerPU](CapabilityStatement-ExampleCapabilityStatementServerPU.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-feature.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-feature.csv), [Excel](StructureDefinition-ti-feature.xlsx), [Schematron](StructureDefinition-ti-feature.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-feature",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFeature",
  "title" : "TI Feature",
  "status" : "active",
  "experimental" : false,
  "date" : "2028-04-01",
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
  "description" : "Deklariert ein einzelnes Feature eines Fachdienst-Deployments. \nDas Teilfeld `definition` verweist per Canonical auf den Feature-Bezeichner \n(analog zum HL7 Application Feature Framework, `hl7.fhir.uv.application-feature`);\n`value` beschreibt den aktuellen Zustand des Features am betrachteten Endpoint.\n\nKompatibilitätshinweis: Diese Extension spiegelt bewusst die Sub-Extension-Namen\n`definition` und `value` des HL7-Frameworks wider, um eine spätere Migration oder\nProfilierung ohne Breaking Change zu ermöglichen.",
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
  },
  {
    "type" : "element",
    "expression" : "CapabilityStatement.rest"
  },
  {
    "type" : "element",
    "expression" : "CapabilityStatement.rest.resource"
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
      "id" : "Extension.extension:definition",
      "path" : "Extension.extension",
      "sliceName" : "definition",
      "short" : "Kanonischer Feature-Bezeichner",
      "definition" : "Canonical-URL, die das Feature eindeutig identifiziert.\nFür gematik-eigene Features: `https://gematik.de/fhir/erp/FeatureDefinition/<Name>`.\nDie zulässigen Werte sind im ValueSet GEM_ERP_VS_CapabilityStatement_Feature\nals Konzept-URIs definiert.",
      "comment" : "Entspricht `extension[definition].valueCanonical` im HL7 Application Feature Framework.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Extension.extension:definition.extension",
      "path" : "Extension.extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.extension:definition.url",
      "path" : "Extension.extension.url",
      "fixedUri" : "definition"
    },
    {
      "id" : "Extension.extension:definition.value[x]",
      "path" : "Extension.extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "canonical"
      }]
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
      "fixedUri" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "max" : "0"
    }]
  }
}

```
