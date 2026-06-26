# E-Rezept zurückgeben - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **E-Rezept zurückgeben**

## OperationDefinition: E-Rezept zurückgeben 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-reject-op | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlow-RX-OP-Reject |

 
Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "tiflow-rx-reject-op",
  "url" : "https://gematik.de/fhir/tiflow-erezept/OperationDefinition/tiflow-rx-reject-op",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlow-RX-OP-Reject",
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
  "description" : "Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden.",
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
    "documentation" : "Der secret Parameter, der einer Apotheke den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht.",
    "type" : "string"
  }]
}

```
