# E-Rezept abrufen - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept abrufen**

## OperationDefinition: E-Rezept abrufen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-accept-op | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-DIGA-OP-Accept |

 
Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-accept-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-accept-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlow-DIGA-OP-Accept",
  "title" : "E-Rezept abrufen",
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
  "description" : "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "accept",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "outputProfile" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-accept-operation-output",
  "parameter" : [{
    "name" : "ac",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.",
    "type" : "string"
  }]
}

```
