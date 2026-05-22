# GEM ERP PR Communication Reply - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Communication Reply**

## Resource Profile: GEM ERP PR Communication Reply 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_PR_Communication_Reply |

 
Antwort vom Leistungserbringer an den Patienten 

**Usages:**

* Examples for this Profile: [Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596](Communication-7977a4ab-97a9-4d95-afb3-6c4c1e2ac596.md)
* CapabilityStatements using this Profile: [ERP CapabilityStatement für den E-Rezept-Fachdienst](CapabilityStatement-erp-fachdienst-server.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-PR-Communication-Reply)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Communication-Reply.csv), [Excel](StructureDefinition-GEM-ERP-PR-Communication-Reply.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Communication-Reply.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Communication-Reply",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_Communication_Reply",
  "title" : "GEM ERP PR Communication Reply",
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
  "description" : "Antwort vom Leistungserbringer an den Patienten",
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
  "baseDefinition" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication",
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
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_Reply|1.6",
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
      "id" : "Communication.sender.identifier",
      "path" : "Communication.sender.identifier",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10",
        "http://fhir.de/StructureDefinition/identifier-telematik-id"]
      }]
    },
    {
      "id" : "Communication.payload",
      "path" : "Communication.payload",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Communication.payload.extension",
      "path" : "Communication.payload.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "description" : "Erweiterungen werden immer (mindestens) nach url gesliced.",
        "rules" : "closed"
      }
    },
    {
      "id" : "Communication.payload.extension:OfferedSupplyOptions",
      "path" : "Communication.payload.extension",
      "sliceName" : "OfferedSupplyOptions",
      "short" : "Angebotene Lieferoptionen durch die Apotheke",
      "definition" : "In einer Kommunikation kann eine Apotheke ihre verfügbaren Lieferoptionen angeben, ob sie Kunden im Geschäft bedienen, Medikamente per Boten senden oder den Versand per Paket nutzen.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_SupplyOptionsType"]
      }]
    },
    {
      "id" : "Communication.payload.extension:AvailabilityStatus",
      "path" : "Communication.payload.extension",
      "sliceName" : "AvailabilityStatus",
      "short" : "Verfügbarkeitsstatus des abgefragten Medikaments",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AvailabilityState"]
      }]
    },
    {
      "id" : "Communication.payload.content[x]",
      "path" : "Communication.payload.content[x]",
      "comment" : "Dieser Inhalt muss gemäß gemSpec_DM_eRp ein JSON sein.",
      "type" : [{
        "code" : "string"
      }],
      "mustSupport" : true
    }]
  }
}

```
