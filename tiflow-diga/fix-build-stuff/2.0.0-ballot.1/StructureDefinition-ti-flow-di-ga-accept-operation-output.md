# TIFlow DiGA Accept Operation Output - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow DiGA Accept Operation Output**

## Resource Profile: TIFlow DiGA Accept Operation Output 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-accept-operation-output | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowDiGAAcceptOperationOutput |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Parameter für die Annahme einer DiGA Verordnung vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $accept-Operation verwendet werden. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-ti-flow-di-ga-accept-operation-output.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-di-ga-accept-operation-output.csv), [Excel](StructureDefinition-ti-flow-di-ga-accept-operation-output.xlsx), [Schematron](StructureDefinition-ti-flow-di-ga-accept-operation-output.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-di-ga-accept-operation-output",
  "url" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-accept-operation-output",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowDiGAAcceptOperationOutput",
  "title" : "TIFlow DiGA Accept Operation Output",
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
  "description" : "Dieses Profil definiert die Parameter für die Annahme einer DiGA Verordnung vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $accept-Operation verwendet werden.",
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
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Parameters",
      "path" : "Parameters"
    },
    {
      "id" : "Parameters.parameter",
      "path" : "Parameters.parameter",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
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
      "type" : [{
        "code" : "Bundle"
      }]
    },
    {
      "id" : "Parameters.parameter:return.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    }]
  }
}

```
