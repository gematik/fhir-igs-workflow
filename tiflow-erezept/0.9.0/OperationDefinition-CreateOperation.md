# CreateOperation - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CreateOperation**

## OperationDefinition: CreateOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/erezept/OperationDefinition/CreateOperation | *Version*:0.9.0 |
| Draft as of 2025-12-15 | *Computable Name*:Create |

 
Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "CreateOperation",
  "url" : "https://gematik.de/fhir/tiflow/erezept/OperationDefinition/CreateOperation",
  "version" : "0.9.0",
  "name" : "Create",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2025-12-15",
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
  "description" : "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "create",
  "resource" : ["Task"],
  "system" : false,
  "type" : true,
  "instance" : false,
  "inputProfile" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "outputProfile" : "https://gematik.de/fhir/tiflow/erezept/StructureDefinition/eflow-rx-create-operation-output-parameters",
  "parameter" : [{
    "name" : "workflowType",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Dieser Parameter fordert die Erstellung eines Tasks mit bestimmten Flowtype an.",
    "type" : "Coding",
    "binding" : {
      "strength" : "required",
      "valueSet" : "https://gematik.de/fhir/tiflow/erezept/ValueSet/GEM-ERP-VS-FlowType"
    }
  },
  {
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "Der erstellte Task mit einer flowType-spezifischen Rezept-ID",
    "type" : "Task"
  }]
}

```
