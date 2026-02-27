# GEM_ERPEU_EX_MedicinalPackageIdentifier - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM_ERPEU_EX_MedicinalPackageIdentifier**

## Extension: GEM_ERPEU_EX_MedicinalPackageIdentifier 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-EX-MedicinalPackageIdentifier | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_EX_MedicinalPackageIdentifier |

Identifier of a packaged medicinal product refers to a specific pack size of a specific product.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Medication
* Extension URL http://hl7.org/fhir/StructureDefinition/Extension

**Usage info**

**Usages:**

* Use this Extension: [EU-Medication](StructureDefinition-GEM-ERPEU-PR-Medication.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erezept.eu|current/StructureDefinition/GEM-ERPEU-EX-MedicinalPackageIdentifier)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageIdentifier.csv), [Excel](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageIdentifier.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-EX-MedicinalPackageIdentifier.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-EX-MedicinalPackageIdentifier",
  "url" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-EX-MedicinalPackageIdentifier",
  "version" : "1.0.1",
  "name" : "GEM_ERPEU_EX_MedicinalPackageIdentifier",
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
  "description" : "Identifier of a packaged medicinal product refers to a specific pack size of a specific product.",
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
      "fixedUri" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-EX-MedicinalPackageIdentifier"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Identifier"
      }]
    },
    {
      "id" : "Extension.value[x].system",
      "path" : "Extension.value[x].system",
      "mustSupport" : true
    },
    {
      "id" : "Extension.value[x].value",
      "path" : "Extension.value[x].value",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
