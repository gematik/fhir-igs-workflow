# GEM ERP PR OperationOutcome - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR OperationOutcome**

## Resource Profile: GEM ERP PR OperationOutcome 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-operationoutcome | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxOperationOutcome |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
OperationOutcome für Angabe von Fehlermeldungen vom E-Rezept-Fachdienst 

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-operationoutcome)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-operationoutcome.csv), [Excel](StructureDefinition-eflow-rx-operationoutcome.xlsx), [Schematron](StructureDefinition-eflow-rx-operationoutcome.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-operationoutcome",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-operationoutcome",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxOperationOutcome",
  "title" : "GEM ERP PR OperationOutcome",
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
  "description" : "OperationOutcome für Angabe von Fehlermeldungen vom E-Rezept-Fachdienst",
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
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "OperationOutcome",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/OperationOutcome",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "OperationOutcome",
        "path" : "OperationOutcome"
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
          "valueSet" : "https://gematik.de/fhir/erp/ValueSet/eflow-rx-operationoutcomedetails"
        }
      }
    ]
  }
}

```
