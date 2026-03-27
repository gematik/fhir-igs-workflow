# GEM ERP EX ExpiryDate - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX ExpiryDate**

## Extension: GEM ERP EX ExpiryDate 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_EX_ExpiryDate |

Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Task](StructureDefinition-GEM-ERP-PR-Task.md)
* Examples for this Extension: [Bundle/Bundle-AcceptOperation](Bundle-Bundle-AcceptOperation.md), [Bundle/ExampleAcceptResponseBundle](Bundle-ExampleAcceptResponseBundle.md), [Bundle/example-searchset-task](Bundle-example-searchset-task.md), [Task/9b48f82c-9c11-4a57-aa72-a805f9537a82](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md)... Show 5 more, [Task/TaskInClosedState](Task-TaskInClosedState.md), [Task/TaskInReadyState](Task-TaskInReadyState.md), [Task/b12eb5f7-91ce-4887-93c7-800454601377](Task-b12eb5f7-91ce-4887-93c7-800454601377.md), [Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md) and [Task/f5c21409-b84b-4125-8649-5630a00906b1](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)
* Search Parameters using this Extension: [TaskExpiryDateSP](SearchParameter-task-expiry-date-sp.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-EX-ExpiryDate)

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
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_EX_ExpiryDate",
  "title" : "GEM ERP EX ExpiryDate",
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
  "description" : "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an.",
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
    "expression" : "Task"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Ablaufdatum des Rezepts",
      "definition" : "Datum, an dem das Rezept abläuft und in der Apotheke nicht mehr eingelöst werden kann."
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
