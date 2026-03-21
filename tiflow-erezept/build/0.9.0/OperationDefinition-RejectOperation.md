# RejectOperation - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **RejectOperation**

## OperationDefinition: RejectOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/erezept/OperationDefinition/RejectOperation | *Version*:0.9.0 |
| Draft as of 2025-12-15 | *Computable Name*:Reject |

 
Lehnt die Ausgabe eines eRezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "RejectOperation",
  "url" : "https://gematik.de/fhir/tiflow/erezept/OperationDefinition/RejectOperation",
  "version" : "0.9.0",
  "name" : "Reject",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2025-12-15",
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
  "description" : "Lehnt die Ausgabe eines eRezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden.",
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
