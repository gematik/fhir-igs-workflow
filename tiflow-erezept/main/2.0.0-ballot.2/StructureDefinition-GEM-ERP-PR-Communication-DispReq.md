# GEM ERP PR Communication DispReq - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Communication DispReq**

## Resource Profile: GEM ERP PR Communication DispReq 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:GEM_ERP_PR_Communication_DispReq |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Anfrage zur Einlösung des E-Rezepts 

**Usages:**

* Examples for this Profile: [Communication/2be1c6ac-5d10-47f6-84ee-8318b2c22c76](Communication-2be1c6ac-5d10-47f6-84ee-8318b2c22c76.md) and [Communication/a218a36e-f2fd-4603-ba67-c827acfef01b](Communication-a218a36e-f2fd-4603-ba67-c827acfef01b.md)
* CapabilityStatements using this Profile: [TIFlow Fachdienst Server Capabilities](CapabilityStatement-ti-flow-fachdienst-server-rx.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.erezept|current/StructureDefinition/StructureDefinition-GEM-ERP-PR-Communication-DispReq.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Communication-DispReq.csv), [Excel](StructureDefinition-GEM-ERP-PR-Communication-DispReq.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Communication-DispReq.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Communication-DispReq",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_PR_Communication_DispReq",
  "title" : "GEM ERP PR Communication DispReq",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-30",
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
  "description" : "Anfrage zur Einlösung des E-Rezepts",
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
  "baseDefinition" : "https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERP-PR-Communication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Communication",
      "path" : "Communication",
      "constraint" : [{
        "key" : "workflow-communication-payload-1",
        "severity" : "error",
        "human" : "Payload muss angegeben werden, wenn eine Zuweisung für ein Arzneimittel vorgenommen wird",
        "expression" : "(extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code = '162' implies payload.exists().not()) and (extension.where(url = 'https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType').value.code != '162' implies payload.exists() and payload.empty().not())",
        "source" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq"
      }]
    },
    {
      "id" : "Communication.meta",
      "path" : "Communication.meta",
      "min" : 1
    },
    {
      "id" : "Communication.meta.profile",
      "path" : "Communication.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slicing für meta profile",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Communication.meta.profile:workflowProfile",
      "path" : "Communication.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq|2.0",
      "mustSupport" : true
    },
    {
      "id" : "Communication.extension",
      "path" : "Communication.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "description" : "Extensions are always sliced by (at least) url",
        "ordered" : false,
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Communication.extension:flowType",
      "path" : "Communication.extension",
      "sliceName" : "flowType",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"]
      }]
    },
    {
      "id" : "Communication.recipient",
      "path" : "Communication.recipient",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Communication.recipient.identifier",
      "path" : "Communication.recipient.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Communication.sender.identifier",
      "path" : "Communication.sender.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Communication.payload",
      "path" : "Communication.payload",
      "max" : "1"
    },
    {
      "id" : "Communication.payload.content[x]",
      "path" : "Communication.payload.content[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
