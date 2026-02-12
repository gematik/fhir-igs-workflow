# GEM ERP PR Communication Reply - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Communication Reply**

## Resource Profile: GEM ERP PR Communication Reply 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-communication-reply | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxCommunicationReply |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Antwort vom Leistungserbringer an den Patienten 

**Usages:**

* Examples for this Profile: [Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596](Communication-7977a4ab-97a9-4d95-afb3-6c4c1e2ac596.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-communication-reply)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-communication-reply.csv), [Excel](StructureDefinition-eflow-rx-communication-reply.xlsx), [Schematron](StructureDefinition-eflow-rx-communication-reply.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-communication-reply",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-communication-reply",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxCommunicationReply",
  "title" : "GEM ERP PR Communication Reply",
  "status" : "draft",
  "experimental" : false,
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "Antwort vom Leistungserbringer an den Patienten",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "copyright" : "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Communication",
  "baseDefinition" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-communication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Communication",
        "path" : "Communication"
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
        "type" : [
          {
            "code" : "Identifier",
            "profile" : ["http://fhir.de/StructureDefinition/identifier-kvid-10"]
          }
        ]
      },
      {
        "id" : "Communication.sender.identifier",
        "path" : "Communication.sender.identifier",
        "min" : 1,
        "type" : [
          {
            "code" : "Identifier",
            "profile" : [
              "http://fhir.de/StructureDefinition/identifier-kvid-10",
              "http://fhir.de/StructureDefinition/identifier-telematik-id"
            ]
          }
        ]
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
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
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
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-supplyoptionstype-extension"
            ]
          }
        ]
      },
      {
        "id" : "Communication.payload.extension:AvailabilityStatus",
        "path" : "Communication.payload.extension",
        "sliceName" : "AvailabilityStatus",
        "short" : "Verfügbarkeitsstatus des abgefragten Medikaments",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-availabilitystate-extension"
            ]
          }
        ]
      },
      {
        "id" : "Communication.payload.content[x]",
        "path" : "Communication.payload.content[x]",
        "comment" : "Dieser Inhalt muss gemäß gemSpec_DM_eRp ein JSON sein.",
        "type" : [
          {
            "code" : "string"
          }
        ],
        "mustSupport" : true
      }
    ]
  }
}

```
