# DiGA-Nachricht eines Kostenträgers an den Patienten - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA-Nachricht eines Kostenträgers an den Patienten**

## Example Communication: DiGA-Nachricht eines Kostenträgers an den Patienten



## Resource Content

```json
{
  "resourceType" : "Communication",
  "id" : "Communication-Reply-DiGA",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DiGA"]
  },
  "basedOn" : [{
    "reference" : "Task/ExampleDiGATaskInReadyState"
  }],
  "status" : "unknown",
  "sent" : "2028-10-01T15:29:00.434+00:00",
  "recipient" : [{
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X234567890"
    }
  }],
  "sender" : {
    "identifier" : {
      "system" : "https://gematik.de/fhir/sid/telematik-id",
      "value" : "8-SMC-B-Testkarte-783498105628375"
    }
  },
  "payload" : [{
    "contentString" : "Nachrichteninhalt für den Versicherten"
  }]
}

```
