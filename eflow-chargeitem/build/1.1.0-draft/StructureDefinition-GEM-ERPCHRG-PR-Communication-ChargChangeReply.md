# Reply on change Request on ChargeItem from pharmacy to Patient - Abrechnungsinformationen des E-Rezepte für PKV-Versicherte v1.1.0-draft

Abrechnungsinformationen des E-Rezepte für PKV-Versicherte

Version 1.1.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Reply on change Request on ChargeItem from pharmacy to Patient**

## Resource Profile: Reply on change Request on ChargeItem from pharmacy to Patient 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply | *Version*:1.1.0-draft |
| Draft as of 2025-04-10 | *Computable Name*:GEM_ERPCHRG_PR_Communication_ChargChangeReply |

 
Ressource used for the communication to reply to a change request on a ChargeItem 

**Usages:**

* Examples for this Profile: [Communication/3bbc2209-9c23-4553-986e-a5c9f69a39fb](Communication-3bbc2209-9c23-4553-986e-a5c9f69a39fb.md)
* CapabilityStatements using this Profile: [ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst](CapabilityStatement-erp-fachdienst-server-erpchrg.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-chargeitem|current/StructureDefinition/GEM-ERPCHRG-PR-Communication-ChargChangeReply)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.csv), [Excel](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.xlsx), [Schematron](StructureDefinition-GEM-ERPCHRG-PR-Communication-ChargChangeReply.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPCHRG-PR-Communication-ChargChangeReply",
  "url" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply",
  "version" : "1.1.0-draft",
  "name" : "GEM_ERPCHRG_PR_Communication_ChargChangeReply",
  "title" : "Reply on change Request on ChargeItem from pharmacy to Patient",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-04-10",
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
  "description" : "Ressource used for the communication to reply to a change request on a ChargeItem",
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
      "id" : "Communication.meta",
      "path" : "Communication.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Communication.meta.profile",
      "path" : "Communication.meta.profile",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "$this"
        }],
        "description" : "Slicing for meta profile",
        "ordered" : false,
        "rules" : "closed"
      },
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Communication.meta.profile:erpchrgProfile",
      "path" : "Communication.meta.profile",
      "sliceName" : "erpchrgProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_Communication_ChargChangeReply|1.1",
      "mustSupport" : true
    },
    {
      "id" : "Communication.basedOn",
      "path" : "Communication.basedOn",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://gematik.de/fhir/erpchrg/StructureDefinition/GEM_ERPCHRG_PR_ChargeItem"],
        "aggregation" : ["referenced"]
      }]
    },
    {
      "id" : "Communication.basedOn.reference",
      "path" : "Communication.basedOn.reference",
      "min" : 1
    },
    {
      "id" : "Communication.status",
      "path" : "Communication.status",
      "fixedCode" : "unknown"
    },
    {
      "id" : "Communication.sent",
      "path" : "Communication.sent",
      "mustSupport" : true
    },
    {
      "id" : "Communication.received",
      "path" : "Communication.received",
      "mustSupport" : true
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
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
      }]
    },
    {
      "id" : "Communication.sender",
      "path" : "Communication.sender",
      "min" : 1
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
