# GEM ERP PR Composition - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Composition**

## Resource Profile: GEM ERP PR Composition 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-composition | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxComposition |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Quittung für die Einlösung eines E-Rezepts 

**Usages:**

* Use this Profile: [GEM ERP PR Bundle](StructureDefinition-eflow-rx-bundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-composition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-composition.csv), [Excel](StructureDefinition-eflow-rx-composition.xlsx), [Schematron](StructureDefinition-eflow-rx-composition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-composition",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-composition",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxComposition",
  "title" : "GEM ERP PR Composition",
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
  "description" : "Quittung für die Einlösung eines E-Rezepts",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "fhirdocumentreference",
      "uri" : "http://hl7.org/fhir/documentreference",
      "name" : "FHIR DocumentReference"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Composition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Composition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition.extension",
        "path" : "Composition.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "description" : "Erweiterungen für die Composition, die durch url unterschieden werden sollen",
          "rules" : "closed"
        },
        "min" : 1
      },
      {
        "id" : "Composition.extension:Beneficiary",
        "path" : "Composition.extension",
        "sliceName" : "Beneficiary",
        "short" : "Die ID des Begünstigten des E-Rezept-Belegs (z. B. TelematikID der Apotheke)",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-beneficiary-extension"
            ]
          }
        ]
      },
      {
        "id" : "Composition.status",
        "path" : "Composition.status",
        "short" : "Status = \"final\"",
        "fixedCode" : "final",
        "mustSupport" : true
      },
      {
        "id" : "Composition.type",
        "path" : "Composition.type",
        "short" : "Document Type = \"Receipt\"",
        "mustSupport" : true
      },
      {
        "id" : "Composition.type.coding",
        "path" : "Composition.type.coding",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "https://gematik.de/fhir/erp/ValueSet/eflow-rx-documenttype"
        }
      },
      {
        "id" : "Composition.type.coding.system",
        "path" : "Composition.type.coding.system",
        "min" : 1,
        "fixedUri" : "https://gematik.de/fhir/erp/CodeSystem/eflow-rx-documenttype"
      },
      {
        "id" : "Composition.type.coding.code",
        "path" : "Composition.type.coding.code",
        "min" : 1,
        "fixedCode" : "3"
      },
      {
        "id" : "Composition.type.coding.display",
        "path" : "Composition.type.coding.display",
        "fixedString" : "Receipt"
      },
      {
        "id" : "Composition.date",
        "path" : "Composition.date",
        "mustSupport" : true
      },
      {
        "id" : "Composition.author",
        "path" : "Composition.author",
        "short" : "Referenz zur Überprüfung des Dienstes (Gerät)",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-device"
            ],
            "aggregation" : ["referenced", "bundled"]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.title",
        "path" : "Composition.title",
        "short" : "Document title = \"Quittung\"",
        "fixedString" : "Quittung",
        "mustSupport" : true
      },
      {
        "id" : "Composition.event",
        "path" : "Composition.event",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.event.period",
        "path" : "Composition.event.period",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.event.period.start",
        "path" : "Composition.event.period.start",
        "short" : "Startzeit der Ausgabe",
        "definition" : "Zeitpunkt der Einreichung des Rezepts bei der abgebenden Leistungserbringerorganisation",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.event.period.end",
        "path" : "Composition.event.period.end",
        "short" : "Das Ende der Ausgabe",
        "definition" : "Zeitpunkt, an dem die Abgabe abgeschlossen ist, d. h. wenn der Server die Quittung erstellt.",
        "min" : 1
      },
      {
        "id" : "Composition.event.detail",
        "path" : "Composition.event.detail",
        "mustSupport" : true
      },
      {
        "id" : "Composition.event.detail.reference",
        "path" : "Composition.event.detail.reference",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
