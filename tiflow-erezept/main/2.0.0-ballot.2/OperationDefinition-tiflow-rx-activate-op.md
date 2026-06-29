# E-Rezept aktivieren - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept aktivieren**

## OperationDefinition: E-Rezept aktivieren 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-activate-op | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowRXOPActivate |

 
Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-rx-activate-op",
  "url" : "https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-activate-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowRXOPActivate",
  "title" : "E-Rezept aktivieren",
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
  "description" : "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "activate",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Activate-Operation-Input",
  "outputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Activate-Operation-Output",
  "parameter" : [{
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "type" : "Task"
  }]
}

```
