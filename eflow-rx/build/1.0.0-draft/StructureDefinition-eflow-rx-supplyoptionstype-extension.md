# GEM ERP EX SupplyOptionsType - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP EX SupplyOptionsType**

## Extension: GEM ERP EX SupplyOptionsType 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-supplyoptionstype-extension | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxSupplyOptionsTypeExtension |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

Extension zur Angabe des bevorzugten Versorgungskanals

**Context of Use**

This extension may be used on the following element(s):

* Element ID Communication.payload

**Usage info**

**Usages:**

* Use this Extension: [GEM ERP PR Communication Reply](StructureDefinition-eflow-rx-communication-reply.md)
* Examples for this Extension: [Communication/7977a4ab-97a9-4d95-afb3-6c4c1e2ac596](Communication-7977a4ab-97a9-4d95-afb3-6c4c1e2ac596.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-supplyoptionstype-extension)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-supplyoptionstype-extension.csv), [Excel](StructureDefinition-eflow-rx-supplyoptionstype-extension.xlsx), [Schematron](StructureDefinition-eflow-rx-supplyoptionstype-extension.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-supplyoptionstype-extension",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-supplyoptionstype-extension",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxSupplyOptionsTypeExtension",
  "title" : "GEM ERP EX SupplyOptionsType",
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
  "description" : "Extension zur Angabe des bevorzugten Versorgungskanals",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Communication.payload"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Optionen für bevorzugte oder angebotene Versorgungskanäle",
        "comment" : "Sowohl Patient als auch Apotheke können ihre Lieferoptionen oder Angebote für die Abgabe von Medikamenten angeben."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "description" : "Extensions are always sliced by (at least) url",
          "rules" : "closed"
        },
        "min" : 3
      },
      {
        "id" : "Extension.extension:delivery",
        "path" : "Extension.extension",
        "sliceName" : "delivery",
        "short" : "Dispensation wird vom Boten angeboten/bevorzugt.",
        "definition" : "Patient oder Apotheke können ihre bevorzugte oder angebotene Lieferoption angeben, um Medikamente per Boten zuzustellen.",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:delivery.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:delivery.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "delivery"
      },
      {
        "id" : "Extension.extension:delivery.value[x]",
        "path" : "Extension.extension.value[x]",
        "short" : "wahr = Lieferung per Bote akzeptiert/angeboten",
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Extension.extension:onPremise",
        "path" : "Extension.extension",
        "sliceName" : "onPremise",
        "short" : "Dispensation wird vor Ort angeboten/bevorzugt.",
        "definition" : "Patient oder Apotheke können ihre bevorzugte oder angebotene Lieferoption angeben, um Medikamente vor Ort abzuholen.",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:onPremise.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:onPremise.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "onPremise"
      },
      {
        "id" : "Extension.extension:onPremise.value[x]",
        "path" : "Extension.extension.value[x]",
        "short" : "true = auf Prämisse akzeptiert/angeboten eingehen",
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Extension.extension:shipment",
        "path" : "Extension.extension",
        "sliceName" : "shipment",
        "short" : "Dispensation wird durch Versand angeboten/bevorzugt.",
        "definition" : "Patient oder Apotheke können ihre bevorzugte oder angebotene Lieferoption angeben, um Medikamente per Paketversand zu versenden.",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:shipment.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:shipment.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "shipment"
      },
      {
        "id" : "Extension.extension:shipment.value[x]",
        "path" : "Extension.extension.value[x]",
        "short" : "wahr = Paketversand akzeptiert/angeboten",
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-supplyoptionstype-extension"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "max" : "0"
      }
    ]
  }
}

```
