# E-Rezept Abgabe vollziehen - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept Abgabe vollziehen**

## OperationDefinition: E-Rezept Abgabe vollziehen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-close-op | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowRXOPClose |

 
Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-rx-close-op",
  "url" : "https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-close-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowRXOPClose",
  "title" : "E-Rezept Abgabe vollziehen",
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
  "description" : "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "close",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Input",
  "outputProfile" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-PAR-Close-Operation-Output",
  "parameter" : [{
    "name" : "return",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "type" : "Bundle"
  }]
}

```
