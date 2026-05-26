# E-Rezept Abgabe vollziehen - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept Abgabe vollziehen**

## OperationDefinition: E-Rezept Abgabe vollziehen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-close-op | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-DIGA-OP-Close |

 
Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-close-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-close-op",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlow-DIGA-OP-Close",
  "title" : "E-Rezept Abgabe vollziehen",
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
  "inputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-close-operation-input",
  "outputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-close-operation-output"
}

```
