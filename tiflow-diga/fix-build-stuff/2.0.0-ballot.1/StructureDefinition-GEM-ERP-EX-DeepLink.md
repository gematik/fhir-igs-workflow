# GEM ERP EX DeepLink - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX DeepLink**

## Extension: GEM ERP EX DeepLink 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_DeepLink | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_EX_DeepLink |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Enthält Informationen zum Deep Link für eine DiGA.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationDispense

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR MedicationDispense DiGA](StructureDefinition-GEM-ERP-PR-MedicationDispense-DiGA.md)
* Examples for this Extension: [MedicationDispense/Example-MedicationDispense-DiGA-DeepLink](MedicationDispense-Example-MedicationDispense-DiGA-DeepLink.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-GEM-ERP-EX-DeepLink.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-DeepLink.csv), [Excel](StructureDefinition-GEM-ERP-EX-DeepLink.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-DeepLink.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-DeepLink",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_DeepLink",
  "version" : "2.0.0-ballot.1",
  "name" : "GEM_ERP_EX_DeepLink",
  "title" : "GEM ERP EX DeepLink",
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
  "description" : "Enthält Informationen zum Deep Link für eine DiGA.",
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
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_DeepLink"
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
