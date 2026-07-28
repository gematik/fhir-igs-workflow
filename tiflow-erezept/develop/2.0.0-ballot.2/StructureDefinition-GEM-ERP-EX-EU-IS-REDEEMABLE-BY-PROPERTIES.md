# GEM ERP EX EU IS REDEEMABLE BY PROPERTIES - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX EU IS REDEEMABLE BY PROPERTIES**

## Extension: GEM ERP EX EU IS REDEEMABLE BY PROPERTIES 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Extension zur vom TI-Flow-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task
* Extension URL http://hl7.org/fhir/StructureDefinition/Extension

**Usage info**

**Usages:**

* Use this Extension: [Task für E-Rezept](StructureDefinition-GEM-ERP-PR-Task.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.erezept|current/StructureDefinition/StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES.csv), [Excel](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-EU-IS-REDEEMABLE-BY-PROPERTIES",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES",
  "title" : "GEM ERP EX EU IS REDEEMABLE BY PROPERTIES",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-30",
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
  "description" : "Extension zur vom TI-Flow-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht.",
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
    "expression" : "Task"
  },
  {
    "type" : "extension",
    "expression" : "http://hl7.org/fhir/StructureDefinition/Extension"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Einlösbar in EU-Flagge",
      "definition" : "Diese Flagge wird vom TI-Flow-Fachdienst gesetzt, wenn das E-Rezept in der EU einlösbar ist."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Einlösbar in EU-Flagge",
      "definition" : "Diese Flagge wird vom TI-Flow-Fachdienst gesetzt, wenn das E-Rezept in der EU einlösbar ist.",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }],
      "mustSupport" : true
    }]
  }
}

```
