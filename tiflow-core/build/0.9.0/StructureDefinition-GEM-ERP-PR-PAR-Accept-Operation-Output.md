# GEM ERP PR AcceptOperation Output - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR AcceptOperation Output**

## Resource Profile: GEM ERP PR AcceptOperation Output 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_AcceptOperation_Output | *Version*:0.9.0 |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_PR_PAR_AcceptOperation_Output |

 
Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum E-Rezept-Fachdienst. Dies kann für die $accept-Operation verwendet werden. 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-PR-PAR-Accept-Operation-Output)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-PAR-Accept-Operation-Output.csv), [Excel](StructureDefinition-GEM-ERP-PR-PAR-Accept-Operation-Output.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-PAR-Accept-Operation-Output.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-PAR-Accept-Operation-Output",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_AcceptOperation_Output",
  "version" : "0.9.0",
  "name" : "GEM_ERP_PR_PAR_AcceptOperation_Output",
  "title" : "GEM ERP PR AcceptOperation Output",
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
  "description" : "Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum E-Rezept-Fachdienst. Dies kann für die $accept-Operation verwendet werden.",
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
      "id" : "Parameters.meta",
      "path" : "Parameters.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.meta.profile",
      "path" : "Parameters.meta.profile",
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
      "id" : "Parameters.meta.profile:workflowProfile",
      "path" : "Parameters.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_PAR_AcceptOperation_Output|1.6",
      "mustSupport" : true
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
        "code" : "Bundle",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle_OP_Accept"]
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
