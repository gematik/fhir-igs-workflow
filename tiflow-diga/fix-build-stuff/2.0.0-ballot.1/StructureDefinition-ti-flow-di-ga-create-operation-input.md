# TIFlow DiGA Create Operation Input - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.1

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow DiGA Create Operation Input**

## Resource Profile: TIFlow DiGA Create Operation Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-create-operation-input | *Version*:2.0.0-ballot.1 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowDiGACreateOperationInput |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Parameter für die Erstellung einer DiGA Aufgabe vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.diga|current/StructureDefinition/StructureDefinition-ti-flow-di-ga-create-operation-input.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-di-ga-create-operation-input.csv), [Excel](StructureDefinition-ti-flow-di-ga-create-operation-input.xlsx), [Schematron](StructureDefinition-ti-flow-di-ga-create-operation-input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-di-ga-create-operation-input",
  "url" : "https://gematik.de/fhir/tiflow-diga/StructureDefinition/ti-flow-di-ga-create-operation-input",
  "version" : "2.0.0-ballot.1",
  "name" : "TIFlowDiGACreateOperationInput",
  "title" : "TIFlow DiGA Create Operation Input",
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
  "description" : "Dieses Profil definiert die Parameter für die Erstellung einer DiGA Aufgabe vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden.",
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
      "id" : "Parameters.parameter:workflowType",
      "path" : "Parameters.parameter",
      "sliceName" : "workflowType",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:workflowType.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "workflowType",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:workflowType.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_FlowType"
      }
    },
    {
      "id" : "Parameters.parameter:workflowType.value[x].system",
      "path" : "Parameters.parameter.value[x].system",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:workflowType.value[x].code",
      "path" : "Parameters.parameter.value[x].code",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:workflowType.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:workflowType.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    }]
  }
}

```
