# GEM ERP PR Device - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Device**

## Resource Profile: GEM ERP PR Device 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device | *Version*:1.0.0-draft |
| Draft as of 2025-09-25 | *Computable Name*:GEM_ERP_PR_Device |

 
Statische Informationen auf dem E-Rezept-Fachdienst 

**Usages:**

* Use this Profile: [GEM ERP PR Bundle](StructureDefinition-GEM-ERP-PR-Bundle.md)
* Refer to this Profile: [GEM ERP PR Composition](StructureDefinition-GEM-ERP-PR-Composition.md) and [GEM_ERP_PR_Signature](StructureDefinition-GEM-ERP-PR-Signature.md)
* Examples for this Profile: [Device/ReceiptBundleDevice](Device-ReceiptBundleDevice.md)
* CapabilityStatements using this Profile: [ERP CapabilityStatement für den E-Rezept-Fachdienst](CapabilityStatement-erp-fachdienst-server.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.core|current/StructureDefinition/GEM-ERP-PR-Device)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Device.csv), [Excel](StructureDefinition-GEM-ERP-PR-Device.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Device",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device",
  "version" : "1.0.0-draft",
  "name" : "GEM_ERP_PR_Device",
  "title" : "GEM ERP PR Device",
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
  "description" : "Statische Informationen auf dem E-Rezept-Fachdienst",
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
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "udi",
    "uri" : "http://fda.gov/UDI",
    "name" : "UDI Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Device.meta",
      "path" : "Device.meta",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Device.meta.profile",
      "path" : "Device.meta.profile",
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
      "id" : "Device.meta.profile:workflowProfile",
      "path" : "Device.meta.profile",
      "sliceName" : "workflowProfile",
      "min" : 1,
      "max" : "1",
      "fixedCanonical" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device|1.6",
      "mustSupport" : true
    },
    {
      "id" : "Device.status",
      "path" : "Device.status",
      "min" : 1
    },
    {
      "id" : "Device.serialNumber",
      "path" : "Device.serialNumber",
      "mustSupport" : true
    },
    {
      "id" : "Device.deviceName",
      "path" : "Device.deviceName",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Device.version",
      "path" : "Device.version",
      "min" : 1,
      "max" : "1"
    },
    {
      "id" : "Device.contact",
      "path" : "Device.contact",
      "short" : "Kontaktdaten des E-Rezept-Fachdienst.",
      "mustSupport" : true
    }]
  }
}

```
