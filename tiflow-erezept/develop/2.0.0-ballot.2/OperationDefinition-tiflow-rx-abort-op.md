# E-Rezept abbrechen - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept abbrechen**

## OperationDefinition: E-Rezept abbrechen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-abort-op | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-RX-OP-Abort |

 
Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-rx-abort-op",
  "url" : "https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-abort-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlow-RX-OP-Abort",
  "title" : "E-Rezept abbrechen",
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
  "description" : "Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "abort",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "parameter" : [{
    "name" : "ac",
    "use" : "in",
    "min" : 0,
    "max" : "1",
    "documentation" : "[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen.",
    "type" : "string"
  },
  {
    "name" : "secret",
    "use" : "in",
    "min" : 0,
    "max" : "1",
    "documentation" : "[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen.",
    "type" : "string"
  }]
}

```
