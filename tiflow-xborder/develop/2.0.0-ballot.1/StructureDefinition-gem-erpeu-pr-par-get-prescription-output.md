# GEM ERPEU PR PAR GET Prescription Output - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.1

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERPEU PR PAR GET Prescription Output**

## Resource Profile: GEM ERPEU PR PAR GET Prescription Output 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-xborder/StructureDefinition/gem-erpeu-pr-par-get-prescription-output | *Version*:2.0.0-ballot.1 |
| Draft as of 2026-05-26 | *Computable Name*:GEM_ERPEU_PR_PAR_GET_Prescription_Output |

 
This profile defines the output parameters for the Get Prescription Operation 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/gem-erpeu-pr-par-get-prescription-output)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-gem-erpeu-pr-par-get-prescription-output.csv), [Excel](StructureDefinition-gem-erpeu-pr-par-get-prescription-output.xlsx), [Schematron](StructureDefinition-gem-erpeu-pr-par-get-prescription-output.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "gem-erpeu-pr-par-get-prescription-output",
  "url" : "https://gematik.de/fhir/tiflow-xborder/StructureDefinition/gem-erpeu-pr-par-get-prescription-output",
  "version" : "2.0.0-ballot.1",
  "name" : "GEM_ERPEU_PR_PAR_GET_Prescription_Output",
  "title" : "GEM ERPEU PR PAR GET Prescription Output",
  "status" : "draft",
  "date" : "2026-05-26",
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
  "description" : "This profile defines the output parameters for the Get Prescription Operation",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
