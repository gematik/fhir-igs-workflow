# E-Rezept erstellen - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept erstellen**

## OperationDefinition: E-Rezept erstellen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-create-op | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowRXOPCreate |

 
Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-rx-create-op",
  "url" : "https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-create-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowRXOPCreate",
  "title" : "E-Rezept erstellen",
  "status" : "active",
  "kind" : "operation",
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
  "inputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Create-Operation-Input",
  "outputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Create-Operation-Output",
  "parameter" : [{
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "type" : "Task"
  }]
}

```
