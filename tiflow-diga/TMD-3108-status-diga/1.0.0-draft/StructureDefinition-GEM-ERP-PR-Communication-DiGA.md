# GEM ERP PR Communication DiGA - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Communication DiGA**

## Resource Profile: GEM ERP PR Communication DiGA 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_PR_Communication_DiGA | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_PR_Communication_DiGA |

 
Antwort des Leistungserbringers an den Patienten 

**Usages:**

* Examples for this Profile: [Communication/140f716f-f649-44fe-9a4e-157eb3c8adf3](Communication-140f716f-f649-44fe-9a4e-157eb3c8adf3.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.diga|current/StructureDefinition/GEM-ERP-PR-Communication-DiGA)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Communication-DiGA.csv), [Excel](StructureDefinition-GEM-ERP-PR-Communication-DiGA.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Communication-DiGA.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Communication-DiGA",
  "url" : "https://gematik.de/fhir/tiflow/diga/StructureDefinition/GEM_ERP_PR_Communication_DiGA",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_Communication_DiGA",
  "title" : "GEM ERP PR Communication DiGA",
  "status" : "draft",
  "date" : "2025-09-25",
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
  "description" : "Antwort des Leistungserbringers an den Patienten",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
      "id" : "Communication.instantiatesCanonical",
      "path" : "Communication.instantiatesCanonical",
      "max" : "0"
    },
    {
      "id" : "Communication.instantiatesUri",
      "path" : "Communication.instantiatesUri",
      "max" : "0"
    },
    {
      "id" : "Communication.basedOn",
      "path" : "Communication.basedOn",
      "short" : "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an.",
      "comment" : "Hat die Form 'Task/{{PrescriptionID}}'",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Task"],
        "aggregation" : ["referenced"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Communication.basedOn.reference",
      "path" : "Communication.basedOn.reference",
      "short" : "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an.",
      "comment" : "Hat die Form 'Task/{{PrescriptionID}}'",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Communication.partOf",
      "path" : "Communication.partOf",
      "max" : "0"
    },
    {
      "id" : "Communication.inResponseTo",
      "path" : "Communication.inResponseTo",
      "max" : "0"
    },
    {
      "id" : "Communication.status",
      "path" : "Communication.status",
      "comment" : "Muss standardmäßig laut FHIR Core Specification angegeben werden, wird jedoch während des Lebenszyklus der Ressource nicht verändert.",
      "fixedCode" : "unknown",
      "mustSupport" : true
    },
    {
      "id" : "Communication.statusReason",
      "path" : "Communication.statusReason",
      "max" : "0"
    },
    {
      "id" : "Communication.category",
      "path" : "Communication.category",
      "max" : "0"
    },
    {
      "id" : "Communication.priority",
      "path" : "Communication.priority",
      "max" : "0"
    },
    {
      "id" : "Communication.medium",
      "path" : "Communication.medium",
      "max" : "0"
    },
    {
      "id" : "Communication.subject",
      "path" : "Communication.subject",
      "max" : "0"
    },
    {
      "id" : "Communication.topic",
      "path" : "Communication.topic",
      "max" : "0"
    },
    {
      "id" : "Communication.about",
      "path" : "Communication.about",
      "max" : "0"
    },
    {
      "id" : "Communication.encounter",
      "path" : "Communication.encounter",
      "max" : "0"
    },
    {
      "id" : "Communication.sent",
      "path" : "Communication.sent",
      "short" : "Der Zeitpunkt, zu dem diese Kommunikation gesendet wurde.",
      "comment" : "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.received",
      "path" : "Communication.received",
      "short" : "Der Zeitpunkt, zu dem diese Kommunikation empfangen wurde.",
      "comment" : "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.recipient",
      "path" : "Communication.recipient",
      "short" : "Die Entität (z. B. Person, Organisation), die Ziel der Kommunikation war.",
      "comment" : "Muss vom Absender der Kommunikation gesetzt werden, um das Ziel festzulegen.",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Communication.recipient.identifier",
      "path" : "Communication.recipient.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Communication.sender",
      "path" : "Communication.sender",
      "short" : "Die Entität (z. B. Person, Organisation), die Quelle der Kommunikation war.",
      "definition" : "Nachrichtenabsender — wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt.\r\nDie Entität (z. B. Person, Organisation), die Quelle der Kommunikation war.",
      "comment" : "Wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt.",
      "mustSupport" : true
    },
    {
      "id" : "Communication.sender.identifier",
      "path" : "Communication.sender.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }]
    },
    {
      "id" : "Communication.reasonCode",
      "path" : "Communication.reasonCode",
      "max" : "0"
    },
    {
      "id" : "Communication.reasonReference",
      "path" : "Communication.reasonReference",
      "max" : "0"
    },
    {
      "id" : "Communication.payload",
      "path" : "Communication.payload",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Communication.payload.content[x]",
      "path" : "Communication.payload.content[x]",
      "short" : "Der tatsächliche Inhalt der Nachricht",
      "comment" : "Dieser Inhalt muss ein JSON gemäß gemSpec_DM_eRp sein.",
      "type" : [{
        "code" : "string"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Communication.note",
      "path" : "Communication.note",
      "max" : "0"
    }]
  }
}

```
