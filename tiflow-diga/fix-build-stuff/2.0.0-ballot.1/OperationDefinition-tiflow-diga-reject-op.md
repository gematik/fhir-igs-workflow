# E-Rezept zurückgeben - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept zurückgeben**

## OperationDefinition: E-Rezept zurückgeben 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-reject-op | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-DIGA-OP-Reject |

 
Lehnt die Ausgabe einer DiGA-Verordnung ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Kostenträger zugänglich oder kann vom Patienten gelöscht werden. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-diga-reject-op",
  "url" : "https://gematik.de/fhir/tiflow-diga/OperationDefinition/tiflow-diga-reject-op",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlow-DIGA-OP-Reject",
  "title" : "E-Rezept zurückgeben",
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
  "description" : "Lehnt die Ausgabe einer DiGA-Verordnung ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Kostenträger zugänglich oder kann vom Patienten gelöscht werden.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "reject",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "parameter" : [{
    "name" : "secret",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Der secret Parameter, der einem Kostenträger den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht.",
    "type" : "string"
  }]
}

```
