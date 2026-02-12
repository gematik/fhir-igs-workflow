# GEM ERP PR CloseOperation Output - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR CloseOperation Output**

## Resource Profile: GEM ERP PR CloseOperation Output 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-output-parameters | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxCloseOperationOutputParameters |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $close-Operation verwendet werden. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-close-operation-output-parameters)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-close-operation-output-parameters.csv), [Excel](StructureDefinition-eflow-rx-close-operation-output-parameters.xlsx), [Schematron](StructureDefinition-eflow-rx-close-operation-output-parameters.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-close-operation-output-parameters",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-close-operation-output-parameters",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxCloseOperationOutputParameters",
  "title" : "GEM ERP PR CloseOperation Output",
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
  "description" : "Dieses Profil definiert die Parameter für die Ausgabe eines Medikaments von AVS an den E-Rezept-Fachdienst. Dies kann für die $close-Operation verwendet werden.",
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
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Parameters",
        "path" : "Parameters"
      },
      {
        "id" : "Parameters.parameter",
        "path" : "Parameters.parameter",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "name"
            }
          ],
          "rules" : "closed"
        },
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Parameters.parameter:return",
        "path" : "Parameters.parameter",
        "sliceName" : "return",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Parameters.parameter:return.name",
        "path" : "Parameters.parameter.name",
        "patternString" : "return",
        "mustSupport" : true
      },
      {
        "id" : "Parameters.parameter:return.value[x]",
        "path" : "Parameters.parameter.value[x]",
        "max" : "0"
      },
      {
        "id" : "Parameters.parameter:return.resource",
        "path" : "Parameters.parameter.resource",
        "min" : 1,
        "type" : [
          {
            "code" : "Bundle",
            "profile" : [
              "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-bundle"
            ]
          }
        ]
      },
      {
        "id" : "Parameters.parameter:return.part",
        "path" : "Parameters.parameter.part",
        "max" : "0"
      }
    ]
  }
}

```
