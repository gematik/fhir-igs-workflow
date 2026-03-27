# GEM ERP PR CapabilityStatement - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR CapabilityStatement**

## Resource Profile: GEM ERP PR CapabilityStatement 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CapabilityStatement | *Version*:1.0.0-draft |
| Active as of 2026-03-16 | *Computable Name*:GEM_ERP_PR_CapabilityStatement |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dieses Profil beschreibt die Fähigkeiten des E-Rezept-Fachdienstes und definiert die verwendeten CapabilityStatement-Erweiterungen inklusive benannter Slices für Basis-URL, Header, Response-Informationen sowie ERP-spezifische Feature- und Konfigurationskennzeichen. 

**Usages:**

* Examples for this Profile: [ERPFachdienstServer](CapabilityStatement-erp-fachdienst-server.md), [ExampleCapabilityStatementServerPU](CapabilityStatement-example-capabilitystatement-server-pu.md), [ExampleCapabilityStatementServerRU](CapabilityStatement-example-capabilitystatement-server-ru.md) and [ExampleCapabilityStatementServerTU](CapabilityStatement-example-capabilitystatement-server-tu.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-PR-CapabilityStatement)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-CapabilityStatement.csv), [Excel](StructureDefinition-GEM-ERP-PR-CapabilityStatement.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-CapabilityStatement.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-CapabilityStatement",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CapabilityStatement",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_CapabilityStatement",
  "title" : "GEM ERP PR CapabilityStatement",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-03-16",
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
  "description" : "Dieses Profil beschreibt die Fähigkeiten des E-Rezept-Fachdienstes und definiert die verwendeten CapabilityStatement-Erweiterungen inklusive benannter Slices für Basis-URL, Header, Response-Informationen sowie ERP-spezifische Feature- und Konfigurationskennzeichen.",
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
      "id" : "CapabilityStatement.meta",
      "path" : "CapabilityStatement.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "CapabilityStatement.meta.profile",
      "path" : "CapabilityStatement.meta.profile",
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
      "id" : "CapabilityStatement.meta.profile:workflowProfile",
      "path" : "CapabilityStatement.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CapabilityStatement|1.6",
      "mustSupport" : true
    },
    {
      "id" : "CapabilityStatement.extension:environment",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "environment",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Environment"]
      }]
    },
    {
      "id" : "CapabilityStatement.extension:fhirConfiguration",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "fhirConfiguration",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_FDConfiguration"]
      }]
    },
    {
      "id" : "CapabilityStatement.extension:capabilityFeature",
      "path" : "CapabilityStatement.extension",
      "sliceName" : "capabilityFeature",
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"]
      }]
    }]
  }
}

```
