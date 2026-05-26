# E-Rezept aktivieren - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept aktivieren**

## OperationDefinition: E-Rezept aktivieren 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-activate-op | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-DIGA-OP-Activate |

 
Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-activate-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-activate-op",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlow-DIGA-OP-Activate",
  "title" : "E-Rezept aktivieren",
  "status" : "active",
  "kind" : "operation",
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
  "outputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-output"
}

```
