# E-Rezept aktivieren - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept aktivieren**

## OperationDefinition: E-Rezept aktivieren 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-activate-op | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlow-DIGA-OP-Activate |

 
Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-activate-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-activate-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlow-DIGA-OP-Activate",
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
  "inputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-input",
  "outputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-output",
  "parameter" : [{
    "name" : "ePrescription",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "type" : "Binary"
  },
  {
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "type" : "Task"
  }]
}

```
