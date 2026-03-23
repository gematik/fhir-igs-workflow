# GEM_ERPEU_EX_MedicinalPackageDescription - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM_ERPEU_EX_MedicinalPackageDescription**

## Extension: GEM_ERPEU_EX_MedicinalPackageDescription 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-EX-MedicinalPackageDescription | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_EX_MedicinalPackageDescription |

Description of a packaged medicinal product.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Medication
* Extension URL http://hl7.org/fhir/StructureDefinition/Extension

**Usage info**

**Usages:**

* Use this Extension: [EU-Medication](StructureDefinition-GEM-ERPEU-PR-Medication.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-EX-MedicinalPackageDescription)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageDescription.csv), [Excel](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageDescription.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageDescription.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-EX-MedicinalPackageDescription",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-EX-MedicinalPackageDescription",
  "version" : "0.9.0",
  "name" : "GEM_ERPEU_EX_MedicinalPackageDescription",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "Description of a packaged medicinal product.",
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
    "expression" : "Medication"
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
      "fixedUri" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-EX-MedicinalPackageDescription"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "short" : "Description of a packaged medicinal product.",
      "definition" : "Textual description of the package Example: Tablet. Oval, white, biconvex tablets, 9.0 x 5.0 mm, debossed with KM on one side and plain on the other side.",
      "min" : 1,
      "type" : [{
        "code" : "string"
      }],
      "mustSupport" : true
    }]
  }
}

```
