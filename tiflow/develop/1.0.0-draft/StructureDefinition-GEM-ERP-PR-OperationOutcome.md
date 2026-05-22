# GEM ERP PR OperationOutcome - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR OperationOutcome**

## Resource Profile: GEM ERP PR OperationOutcome 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_OperationOutcome | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_PR_OperationOutcome |

 
OperationOutcome für Angabe von Fehlermeldungen vom E-Rezept-Fachdienst 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-PR-OperationOutcome)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-OperationOutcome.csv), [Excel](StructureDefinition-GEM-ERP-PR-OperationOutcome.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-OperationOutcome.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-OperationOutcome",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_OperationOutcome",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_OperationOutcome",
  "title" : "GEM ERP PR OperationOutcome",
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
  "description" : "OperationOutcome für Angabe von Fehlermeldungen vom E-Rezept-Fachdienst",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "OperationOutcome",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/OperationOutcome",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "OperationOutcome",
      "path" : "OperationOutcome"
    },
    {
      "id" : "OperationOutcome.meta",
      "path" : "OperationOutcome.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.meta.profile",
      "path" : "OperationOutcome.meta.profile",
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
      "id" : "OperationOutcome.meta.profile:workflowProfile",
      "path" : "OperationOutcome.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_OperationOutcome|1.6",
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.issue.severity",
      "path" : "OperationOutcome.issue.severity",
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.issue.code",
      "path" : "OperationOutcome.issue.code",
      "mustSupport" : true
    },
    {
      "id" : "OperationOutcome.issue.details",
      "path" : "OperationOutcome.issue.details",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "https://gematik.de/fhir/erp/ValueSet/GEM_ERP_VS_OperationOutcomeDetails"
      }
    }]
  }
}

```
