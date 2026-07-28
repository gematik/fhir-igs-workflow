# TIFlow DiGA Activate Operation Input - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow DiGA Activate Operation Input**

## Resource Profile: TIFlow DiGA Activate Operation Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-input | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowDiGAActivateOperationInput |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Parameter für die Aktivierung einer DiGA Verordnung vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $activate-Operation verwendet werden. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-ti-flow-di-ga-activate-operation-input.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-di-ga-activate-operation-input.csv), [Excel](StructureDefinition-ti-flow-di-ga-activate-operation-input.xlsx), [Schematron](StructureDefinition-ti-flow-di-ga-activate-operation-input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-di-ga-activate-operation-input",
  "url" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-activate-operation-input",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowDiGAActivateOperationInput",
  "title" : "TIFlow DiGA Activate Operation Input",
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
  "description" : "Dieses Profil definiert die Parameter für die Aktivierung einer DiGA Verordnung vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $activate-Operation verwendet werden.",
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
      "id" : "Parameters.parameter:ePrescription",
      "path" : "Parameters.parameter",
      "sliceName" : "ePrescription",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:ePrescription.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "ePrescription",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:ePrescription.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:ePrescription.resource",
      "path" : "Parameters.parameter.resource",
      "min" : 1,
      "type" : [{
        "code" : "Binary",
        "profile" : ["https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-binary"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:ePrescription.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    }]
  }
}

```
