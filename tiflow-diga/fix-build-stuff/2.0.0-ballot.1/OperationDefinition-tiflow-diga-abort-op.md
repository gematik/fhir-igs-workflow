# E-Rezept abbrechen - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept abbrechen**

## OperationDefinition: E-Rezept abbrechen 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-abort-op | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-DIGA-OP-Abort |

 
Diese Operation bricht den Workflow einer DiGA-Verordnung ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-abort-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-abort-op",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlow-DIGA-OP-Abort",
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
  "description" : "Diese Operation bricht den Workflow einer DiGA-Verordnung ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen.",
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
