# CreateOperation - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **CreateOperation**

## OperationDefinition: CreateOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:Create |

 
Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "CreateOperation",
  "url" : "https://gematik.de/fhir/erp/OperationDefinition/CreateOperationDefinition",
  "version" : "0.9.0",
  "name" : "Create",
  "status" : "draft",
  "kind" : "operation",
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
  "outputProfile" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_CreateOperation_Output"
}

```
