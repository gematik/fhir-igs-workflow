# Task für TIFlow Verordnungen - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Task für TIFlow Verordnungen**

## Resource Profile: Task für TIFlow Verordnungen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-order-task | *Version*:2.0.0-ballot.2 |
| Draft as of 2028-04-01 | *Computable Name*:TIFlowOrderTask |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Task für die Verwaltung von Workflows der TIFlow Verordnungen 

**Usages:**

* Use this Profile: [Bundle der $accept Operation](StructureDefinition-tiflow-op-accept-bundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-tiflow-order-task.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tiflow-order-task.csv), [Excel](StructureDefinition-tiflow-order-task.xlsx), [Schematron](StructureDefinition-tiflow-order-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tiflow-order-task",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-order-task",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowOrderTask",
  "title" : "Task für TIFlow Verordnungen",
  "status" : "draft",
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
  "description" : "Task für die Verwaltung von Workflows der TIFlow Verordnungen",
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
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Task",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Task",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Task.meta",
      "path" : "Task.meta",
      "mustSupport" : true
    },
    {
      "id" : "Task.meta.versionId",
      "path" : "Task.meta.versionId",
      "mustSupport" : true
    },
    {
      "id" : "Task.meta.lastUpdated",
      "path" : "Task.meta.lastUpdated",
      "mustSupport" : true
    },
    {
      "id" : "Task.identifier",
      "path" : "Task.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Task.identifier:AccessCode",
      "path" : "Task.identifier",
      "sliceName" : "AccessCode",
      "short" : "AccessCode Identifier",
      "definition" : "Generiert vom TI-Flow-Fachdienst. Dieser Identifikator muss in jeder Anfrage zur Task Ressource übertragen werden.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/tiflow-access-code"]
      }]
    },
    {
      "id" : "Task.identifier:Secret",
      "path" : "Task.identifier",
      "sliceName" : "Secret",
      "short" : "Secret",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/tiflow-secret"]
      }]
    },
    {
      "id" : "Task.status",
      "path" : "Task.status",
      "short" : "draft | ready | on-hold | in-progress | completed | cancelled",
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/tiflow/ValueSet/tiflow-order-task-status-vs"
      }
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "fixedCode" : "order"
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "short" : "Kennung des Begünstigten einer Aufgabe",
      "mustSupport" : true
    },
    {
      "id" : "Task.for.identifier",
      "path" : "Task.for.identifier",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10",
        "http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Task.input",
      "path" : "Task.input",
      "mustSupport" : true
    },
    {
      "id" : "Task.output",
      "path" : "Task.output",
      "mustSupport" : true
    }]
  }
}

```
