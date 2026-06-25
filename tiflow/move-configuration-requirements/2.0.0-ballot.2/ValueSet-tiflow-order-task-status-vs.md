# TIFlow Order Task ValueSet - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow Order Task ValueSet**

## ValueSet: TIFlow Order Task ValueSet 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/ValueSet/tiflow-order-task-status-vs | *Version*:2.0.0-ballot.2 |
| Draft as of 2028-04-01 | *Computable Name*:TIFlowOrderTaskStatusVS |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
TIFlow Order Task ValueSet 

 **References** 

* [Task für TIFlow Verordnungen](StructureDefinition-tiflow-order-task.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "tiflow-order-task-status-vs",
  "url" : "https://gematik.de/fhir/tiflow/ValueSet/tiflow-order-task-status-vs",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowOrderTaskStatusVS",
  "title" : "TIFlow Order Task ValueSet",
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
  "description" : "TIFlow Order Task ValueSet",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "immutable" : false,
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "compose" : {
    "include" : [{
      "system" : "http://hl7.org/fhir/task-status",
      "version" : "4.0.1",
      "concept" : [{
        "code" : "draft"
      },
      {
        "code" : "ready"
      },
      {
        "code" : "on-hold"
      },
      {
        "code" : "in-progress"
      },
      {
        "code" : "completed"
      },
      {
        "code" : "cancelled"
      }]
    }]
  }
}

```
