# TIFlow Beneficiary - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow Beneficiary**

## Extension: TIFlow Beneficiary 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_EX_Beneficiary |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Der Begünstigte (z. B. Apotheke) der Quittung eines TIFlow Vorgangs, der erstellt wird, wenn der Workflow abgeschlossen ist.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Bundle
* Element ID Composition

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Composition](StructureDefinition-GEM-ERP-PR-Composition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-GEM-ERP-EX-Beneficiary.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-Beneficiary.csv), [Excel](StructureDefinition-GEM-ERP-EX-Beneficiary.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-Beneficiary.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-Beneficiary",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_EX_Beneficiary",
  "title" : "TIFlow Beneficiary",
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
  "description" : "Der Begünstigte (z. B. Apotheke) der Quittung eines TIFlow Vorgangs, der erstellt wird, wenn der Workflow abgeschlossen ist.",
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
    "expression" : "Bundle"
  },
  {
    "type" : "element",
    "expression" : "Composition"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "The beneficiary of the receipt"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_Beneficiary"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }]
    }]
  }
}

```
