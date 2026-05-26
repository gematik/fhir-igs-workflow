# Task für TIFlow Anwendungen - TIFlow - Kernfunktionalitäten v2.0.0-ballot.1

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Task für TIFlow Anwendungen**

## Resource Profile: Task für TIFlow Anwendungen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-task | *Version*:2.0.0-ballot.1 |
| Active as of 2026-06-01 | *Computable Name*:TIFlowTask |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Task für die Verwaltung von Workflows der TIFlow Anwendungen 

**Usages:**

* Use this Profile: [Bundle der $accept Operation](StructureDefinition-tiflow-op-accept-bundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-task.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-task.csv), [Excel](StructureDefinition-ti-task.xlsx), [Schematron](StructureDefinition-ti-task.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-task",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-task",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowTask",
  "title" : "Task für TIFlow Anwendungen",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-01",
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
  "description" : "Task für die Verwaltung von Workflows der TIFlow Anwendungen",
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
      "id" : "Task",
      "path" : "Task"
    },
    {
      "id" : "Task.extension",
      "path" : "Task.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "description" : "Erweiterungen für die Aufgabe, die durch url unterschieden werden.",
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Task.extension:flowType",
      "path" : "Task.extension",
      "sliceName" : "flowType",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"]
      }],
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
        "description" : "Die Task-Ressource enthält zwei Kennungen. Die erste ist die Kennung für den Task, die einen Vorgang im TIFlow darstellt. Die andere Kennung repräsentiert den Patienten als Eigentümer des Vorgangs via Krankenversichertennummer (KVNR)",
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Task.identifier:PrescriptionID",
      "path" : "Task.identifier",
      "sliceName" : "PrescriptionID",
      "short" : "E-Rezept-ID",
      "definition" : "Die E-Rezept-ID ist der Hauptidentifikator für die Task Ressource und den gesamten TIFlow Workflow. Dieser Identifikator wird vom TI-Flow-Fachdienst generiert und darf nicht manuell geändert werden.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"]
      }]
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
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_AccessCode"]
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
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Secret"]
      }]
    },
    {
      "id" : "Task.intent",
      "path" : "Task.intent",
      "fixedCode" : "order"
    },
    {
      "id" : "Task.for",
      "path" : "Task.for",
      "short" : "Kennung des Begünstigten einer Aufgabe"
    },
    {
      "id" : "Task.for.identifier",
      "path" : "Task.for.identifier",
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10",
        "http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }]
    }]
  }
}

```
