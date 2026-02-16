# GEM ERP EX RedeemCode - Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA) v2.0.0-draft

Verordnungen fuer Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX RedeemCode**

## Extension: GEM ERP EX RedeemCode 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode | *Version*:2.0.0-draft |
| Draft as of 2026-02-06 | *Computable Name*:GEM_ERP_EX_RedeemCode |

Gibt den Einlösecode für eine DiGA an.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationDispense

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR MedicationDispense DiGA](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md)
* Examples for this Extension: [MedicationDispense/Example-MedicationDispense-DiGA-DeepLink](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md), [MedicationDispense/Example-MedicationDispense-DiGA-Name-And-PZN](MedicationDispense-Example-MedicationDispense-DiGA-Name-And-PZN.md) and [Parameters/ExampleCloseInputParametersDiGA](Parameters-ExampleCloseInputParametersDiGA.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-diga|current/StructureDefinition/GEM-ERP-EX-RedeemCode)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-RedeemCode.csv), [Excel](StructureDefinition-GEM-ERP-EX-RedeemCode.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-RedeemCode.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-RedeemCode",
  "url" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode",
  "version" : "2.0.0-draft",
  "name" : "GEM_ERP_EX_RedeemCode",
  "title" : "GEM ERP EX RedeemCode",
  "status" : "draft",
  "date" : "2026-02-06",
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
  "description" : "Gibt den Einlösecode für eine DiGA an.",
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
      "expression" : "MedicationDispense"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://gematik.de/fhir/erp-diga/StructureDefinition/GEM_ERP_EX_RedeemCode"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "short" : "Gibt den Einlösecode für eine DiGA an.",
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```
