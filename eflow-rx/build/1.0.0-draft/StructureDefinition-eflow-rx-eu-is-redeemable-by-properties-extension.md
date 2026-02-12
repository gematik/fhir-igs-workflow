# GEM ERP EX EU IS REDEEMABLE BY PROPERTIES - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX EU IS REDEEMABLE BY PROPERTIES**

## Extension: GEM ERP EX EU IS REDEEMABLE BY PROPERTIES 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-eu-is-redeemable-by-properties-extension | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxEuIsRedeemableByPropertiesExtension |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Extension zur vom E-Rezept-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task
* Extension URL http://hl7.org/fhir/StructureDefinition/Extension

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Task](StructureDefinition-eflow-rx-task.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-eu-is-redeemable-by-properties-extension)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-eu-is-redeemable-by-properties-extension.csv), [Excel](StructureDefinition-eflow-rx-eu-is-redeemable-by-properties-extension.xlsx), [Schematron](StructureDefinition-eflow-rx-eu-is-redeemable-by-properties-extension.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-eu-is-redeemable-by-properties-extension",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-eu-is-redeemable-by-properties-extension",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxEuIsRedeemableByPropertiesExtension",
  "title" : "GEM ERP EX EU IS REDEEMABLE BY PROPERTIES",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Extension zur vom E-Rezept-Fachdienst ermittelten Angabe, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht.",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Task"
    },
    {
      "type" : "extension",
      "expression" : "http://hl7.org/fhir/StructureDefinition/Extension"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Einlösbar in EU-Flagge",
        "definition" : "Diese Flagge wird vom E-Rezept-Fachdienst gesetzt, wenn das E-Rezept in der EU einlösbar ist."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-eu-is-redeemable-by-properties-extension"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Einlösbar in EU-Flagge",
        "definition" : "Diese Flagge wird vom E-Rezept-Fachdienst gesetzt, wenn das E-Rezept in der EU einlösbar ist.",
        "min" : 1,
        "type" : [
          {
            "code" : "boolean"
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
