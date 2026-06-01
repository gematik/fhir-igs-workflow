# GEM ERP PR Bundle OP Accept - TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Bundle OP Accept**

## Resource Profile: GEM ERP PR Bundle OP Accept 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle_OP_Accept | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_PR_Bundle_OP_Accept |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Antwort des TI-Flow-Fachdienst auf die $accept-Operation 

**Usages:**

* Use this Profile: [GEM ERP PR AcceptOperation Output](StructureDefinition-GEM-ERP-PR-PAR-Accept-Operation-Output.md)
* Examples for this Profile: [Bundle/Bundle-AcceptOperation](Bundle-Bundle-AcceptOperation.md) and [Bundle/ExampleAcceptResponseBundle](Bundle-ExampleAcceptResponseBundle.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow.erezept|current/StructureDefinition/StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.csv), [Excel](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Bundle-OP-Accept.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Bundle-OP-Accept",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle_OP_Accept",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_PR_Bundle_OP_Accept",
  "title" : "GEM ERP PR Bundle OP Accept",
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
  "description" : "Antwort des TI-Flow-Fachdienst auf die $accept-Operation",
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
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Bundle",
  "baseDefinition" : "https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-op-accept-bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    },
    {
      "id" : "Bundle.meta",
      "path" : "Bundle.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Bundle.meta.profile",
      "path" : "Bundle.meta.profile",
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
      "id" : "Bundle.meta.profile:workflowProfile",
      "path" : "Bundle.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle_OP_Accept|2.0",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry:task",
      "path" : "Bundle.entry",
      "sliceName" : "task"
    },
    {
      "id" : "Bundle.entry:task.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "Task",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task"]
      }]
    }]
  }
}

```
