# Capability Statement Profil für den TI-Flow-Fachdienst - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Capability Statement Profil für den TI-Flow-Fachdienst**

## Resource Profile: Capability Statement Profil für den TI-Flow-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-capability-statement | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:TIFlowCapabilityStatement |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil beschreibt die Fähigkeiten des TI-Flow-Fachdienst. 

**Usages:**

* Examples for this Profile: [CapabilityStatement/ExampleCapabilityStatementServerPU](CapabilityStatement-ExampleCapabilityStatementServerPU.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-ti-flow-capability-statement.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ti-flow-capability-statement.csv), [Excel](StructureDefinition-ti-flow-capability-statement.xlsx), [Schematron](StructureDefinition-ti-flow-capability-statement.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ti-flow-capability-statement",
  "url" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-capability-statement",
  "version" : "2.0.0-ballot.2",
  "name" : "TIFlowCapabilityStatement",
  "title" : "Capability Statement Profil für den TI-Flow-Fachdienst",
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
  "description" : "Dieses Profil beschreibt die Fähigkeiten des TI-Flow-Fachdienst.",
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "objimpl",
    "uri" : "http://hl7.org/fhir/object-implementation",
    "name" : "Object Implementation Information"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "CapabilityStatement",
  "baseDefinition" : "https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "CapabilityStatement",
      "path" : "CapabilityStatement"
    },
    {
      "id" : "CapabilityStatement.extension:environment",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "environment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/ti-environment"]
      }]
    },
    {
      "id" : "CapabilityStatement.extension:fhirConfiguration",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "fhirConfiguration",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/ti-fhir-configuration"]
      }]
    },
    {
      "id" : "CapabilityStatement.extension:feature",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "feature",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/ti-feature"]
      }]
    }]
  }
}

```
