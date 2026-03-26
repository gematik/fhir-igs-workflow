# GEM ERP EX PrescriptionType - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX PrescriptionType**

## Extension: GEM ERP EX PrescriptionType 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_EX_PrescriptionType |

Definiert den Typ eines Rezepts.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Task
* Element ID Communication.payload
* Element ID Communication

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Communication DispReq](StructureDefinition-GEM-ERP-PR-Communication-DispReq.md) and [GEM ERP PR Task](StructureDefinition-GEM-ERP-PR-Task.md)
* Examples for this Extension: [Bundle/Bundle-AcceptOperation](Bundle-Bundle-AcceptOperation.md), [Bundle/ExampleAcceptResponseBundle](Bundle-ExampleAcceptResponseBundle.md), [Bundle/example-searchset-communication](Bundle-example-searchset-communication.md), [Bundle/example-searchset-task](Bundle-example-searchset-task.md)... Show 8 more, [Communication/2be1c6ac-5d10-47f6-84ee-8318b2c22c76](Communication-2be1c6ac-5d10-47f6-84ee-8318b2c22c76.md), [Communication/a218a36e-f2fd-4603-ba67-c827acfef01b](Communication-a218a36e-f2fd-4603-ba67-c827acfef01b.md), [Task/9b48f82c-9c11-4a57-aa72-a805f9537a82](Task-9b48f82c-9c11-4a57-aa72-a805f9537a82.md), [Task/TaskInClosedState](Task-TaskInClosedState.md), [Task/TaskInReadyState](Task-TaskInReadyState.md), [Task/b12eb5f7-91ce-4887-93c7-800454601377](Task-b12eb5f7-91ce-4887-93c7-800454601377.md), [Task/d70932d1-9e1c-483c-b2d4-b7dced09b35e](Task-d70932d1-9e1c-483c-b2d4-b7dced09b35e.md) and [Task/f5c21409-b84b-4125-8649-5630a00906b1](Task-f5c21409-b84b-4125-8649-5630a00906b1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-EX-PrescriptionType)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-EX-PrescriptionType.csv), [Excel](StructureDefinition-GEM-ERP-EX-PrescriptionType.xlsx), [Schematron](StructureDefinition-GEM-ERP-EX-PrescriptionType.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-EX-PrescriptionType",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_EX_PrescriptionType",
  "title" : "GEM ERP EX PrescriptionType",
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
  "description" : "Definiert den Typ eines Rezepts.",
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
  },
  {
    "type" : "element",
    "expression" : "Communication.payload"
  },
  {
    "type" : "element",
    "expression" : "Communication"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Art der Verschreibung",
      "definition" : "Definiert den Typ des Rezepts. Das Codesystem enthält alle unterstützten Formulare."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FlowType"
      }
    },
    {
      "id" : "Extension.value[x].system",
      "path" : "Extension.value[x].system",
      "min" : 1
    },
    {
      "id" : "Extension.value[x].code",
      "path" : "Extension.value[x].code",
      "min" : 1
    }]
  }
}

```
