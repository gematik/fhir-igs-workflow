# Bundle der $accept Operation - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Bundle der $accept Operation**

## Resource Profile: Bundle der $accept Operation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-op-accept-bundle | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowOpAcceptBundle |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Antwort des TI-Flow-Fachdienst auf die $accept-Operation 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-tiflow-op-accept-bundle.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-tiflow-op-accept-bundle.csv), [Excel](StructureDefinition-tiflow-op-accept-bundle.xlsx), [Schematron](StructureDefinition-tiflow-op-accept-bundle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "tiflow-op-accept-bundle",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-op-accept-bundle",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowOpAcceptBundle",
  "title" : "Bundle der $accept Operation",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Bundle",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Bundle",
      "path" : "Bundle"
    },
    {
      "id" : "Bundle.type",
      "path" : "Bundle.type",
      "fixedCode" : "collection"
    },
    {
      "id" : "Bundle.entry",
      "path" : "Bundle.entry",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "resource"
        }],
        "description" : "Die Aufgabe und das QES signierte Bundle.",
        "rules" : "closed"
      },
      "min" : 2,
      "max" : "2"
    },
    {
      "id" : "Bundle.entry:task",
      "path" : "Bundle.entry",
      "sliceName" : "task",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Bundle.entry:task.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "Task",
        "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/ti-task"]
      }]
    },
    {
      "id" : "Bundle.entry:binary",
      "path" : "Bundle.entry",
      "sliceName" : "binary",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Bundle.entry:binary.resource",
      "path" : "Bundle.entry.resource",
      "type" : [{
        "code" : "Binary",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary"]
      }]
    }]
  }
}

```
