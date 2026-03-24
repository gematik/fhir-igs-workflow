# GEM ERP EX DeepLink - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v0.9.0

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX DeepLink**

## Extension: GEM ERP EX DeepLink 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_EX_DeepLink | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_EX_DeepLink |

Enthält Informationen zum Deep Link für eine DiGA.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationDispense

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR MedicationDispense DiGA](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md)
* Examples for this Extension: [MedicationDispense/Example-MedicationDispense-DiGA-DeepLink](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.diga|current/StructureDefinition/GEM-ERP-EX-DeepLink)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-DeepLink.csv), [Excel](StructureDefinition-GEM-ERP-EX-DeepLink.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-DeepLink.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-DeepLink",
  "url" : "https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_EX_DeepLink",
  "version" : "0.9.0",
  "name" : "GEM_ERP_EX_DeepLink",
  "title" : "GEM ERP EX DeepLink",
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
  "description" : "Enthält Informationen zum Deep Link für eine DiGA.",
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
    "expression" : "MedicationDispense"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Angabe eines Deep Links, der zum Öffnen der DiGA verwendet werden kann."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_EX_DeepLink"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "url"
      }]
    }]
  }
}

```
