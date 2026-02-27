# GEM ERPEU PR PAR PATCH Task Input - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERPEU PR PAR PATCH Task Input**

## Resource Profile: GEM ERPEU PR PAR PATCH Task Input 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_PAR_PATCH_Task_Input |

 
This profile defines the parameters for patching the Task to mark the prescription as to-be-redeemed in the EU 

**Usages:**

* Examples for this Profile: [Parameters/Example-PATCH-Task-Single-Input-Request-False](Parameters-Example-PATCH-Task-Single-Input-Request-False.md) and [Parameters/Example-PATCH-Task-Single-Input-Request-True](Parameters-Example-PATCH-Task-Single-Input-Request-True.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erezept.eu|current/StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-PAR-PATCH-Task-Input.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-PAR-PATCH-Task-Input.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-PAR-PATCH-Task-Input.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-PAR-PATCH-Task-Input",
  "url" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-PATCH-Task-Input",
  "version" : "1.0.1",
  "name" : "GEM_ERPEU_PR_PAR_PATCH_Task_Input",
  "title" : "GEM ERPEU PR PAR PATCH Task Input",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "This profile defines the parameters for patching the Task to mark the prescription as to-be-redeemed in the EU",
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
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:eu-isRedeemableByPatientAuthorization",
      "path" : "Parameters.parameter",
      "sliceName" : "eu-isRedeemableByPatientAuthorization",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:eu-isRedeemableByPatientAuthorization.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "eu-isRedeemableByPatientAuthorization",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:eu-isRedeemableByPatientAuthorization.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "boolean"
      }]
    },
    {
      "id" : "Parameters.parameter:eu-isRedeemableByPatientAuthorization.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:eu-isRedeemableByPatientAuthorization.part",
      "path" : "Parameters.parameter.part",
      "max" : "0"
    }]
  }
}

```
