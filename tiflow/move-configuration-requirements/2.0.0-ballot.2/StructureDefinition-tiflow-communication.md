# Generische TIFlow Communication - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Generische TIFlow Communication**

## Resource Profile: Generische TIFlow Communication 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-communication | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowCommunication |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Generische TIFlow Workflow-Communication 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-tiflow-communication.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tiflow-communication.csv), [Excel](StructureDefinition-tiflow-communication.xlsx), [Schematron](StructureDefinition-tiflow-communication.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tiflow-communication",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-communication",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowCommunication",
  "title" : "Generische TIFlow Communication",
  "status" : "active",
  "experimental" : false,
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
  "description" : "Generische TIFlow Workflow-Communication",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Communication",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Communication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Communication",
      "path" : "Communication"
    },
    {
      "id" : "Communication.meta",
      "path" : "Communication.meta",
      "mustSupport" : true
    },
    {
      "id" : "Communication.meta.versionId",
      "path" : "Communication.meta.versionId",
      "mustSupport" : true
    },
    {
      "id" : "Communication.meta.lastUpdated",
      "path" : "Communication.meta.lastUpdated",
      "mustSupport" : true
    },
    {
      "id" : "Communication.basedOn",
      "path" : "Communication.basedOn",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Task"],
        "aggregation" : ["referenced"]
      }]
    },
    {
      "id" : "Communication.status",
      "path" : "Communication.status",
      "comment" : "Muss standardmäßig laut FHIR Core Specification angegeben werden, wird jedoch während des Lebenszyklus der Ressource nicht verändert.",
      "fixedCode" : "unknown",
      "mustSupport" : true
    },
    {
      "id" : "Communication.sent",
      "path" : "Communication.sent",
      "short" : "Der Zeitpunkt, zu dem diese Kommunikation gesendet wurde.",
      "comment" : "Wird vom TIFlow-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.received",
      "path" : "Communication.received",
      "short" : "Der Zeitpunkt, zu dem diese Kommunikation empfangen wurde.",
      "comment" : "Wird vom TIFlow-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.recipient",
      "path" : "Communication.recipient",
      "short" : "Die Entität (z. B. Person, Organisation), die Ziel der Kommunikation war.",
      "comment" : "Muss vom Absender der Kommunikation gesetzt werden, um das Ziel festzulegen.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.sender",
      "path" : "Communication.sender",
      "short" : "Die Entität (z. B. Person, Organisation), die Quelle der Kommunikation war.",
      "definition" : "Nachrichtenabsender — wird vom TIFlow-Server gesetzt.\r\nDie Entität (z. B. Person, Organisation), die Quelle der Kommunikation war.",
      "comment" : "Wird vom TIFlow-Server gesetzt.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.payload",
      "path" : "Communication.payload",
      "mustSupport" : true
    },
    {
      "id" : "Communication.payload.content[x]",
      "path" : "Communication.payload.content[x]",
      "short" : "Der tatsächliche Inhalt der Nachricht",
      "comment" : "Der tatsächliche Inhalt der Nachricht"
    }]
  }
}

```
