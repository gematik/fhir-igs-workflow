# TIFlow CORE Validate Operation Output - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.3

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow CORE Validate Operation Output**

## Resource Profile: TIFlow CORE Validate Operation Output 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-core-validate-operation-output | *Version*:2.0.0-ballot.3 |
| Active as of 2026-06-30 | *Computable Name*:TIFlowCOREValidateOperationOutput |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil definiert die Ausgabeparameter für die $validate-Operation des TI-Flow-Fachdienstes. 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-flow-core-validate-operation-output.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-core-validate-operation-output.csv), [Excel](StructureDefinition-ti-flow-core-validate-operation-output.xlsx), [Schematron](StructureDefinition-ti-flow-core-validate-operation-output.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-core-validate-operation-output",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-core-validate-operation-output",
  "version" : "2.0.0-ballot.3",
  "name" : "TIFlowCOREValidateOperationOutput",
  "title" : "TIFlow CORE Validate Operation Output",
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
  "description" : "Dieses Profil definiert die Ausgabeparameter für die $validate-Operation des TI-Flow-Fachdienstes.",
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
      "min" : 0,
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
        "code" : "OperationOutcome"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:return.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:valid",
      "path" : "Parameters.parameter",
      "sliceName" : "valid",
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Parameters.parameter:valid.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "valid",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:valid.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }],
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:valid.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:valid.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    }]
  }
}

```
