# TI Flow ExpiryDate - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TI Flow ExpiryDate**

## Extension: TI Flow ExpiryDate 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:GEM_ERP_EX_ExpiryDate |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task

**Usage info**

**Usages:**

* Search Parameters using this Extension: [TaskExpiryDateSP](SearchParameter-TaskExpiryDateSP.md)
* This Extension is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-GEM-ERP-EX-ExpiryDate.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-ExpiryDate.csv), [Excel](StructureDefinition-GEM-ERP-EX-ExpiryDate.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-ExpiryDate.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-ExpiryDate",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_EX_ExpiryDate",
  "title" : "TI Flow ExpiryDate",
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
  "description" : "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an.",
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
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Ablaufdatum der Verordnung im TI-Flow-Fachdienst",
      "definition" : "Datum, an dem eine Verordnung abläuft und nicht mehr eingelöst werden kann."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "date"
      }]
    }]
  }
}

```
