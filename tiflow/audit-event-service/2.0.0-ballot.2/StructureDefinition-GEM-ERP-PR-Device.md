# GEM ERP PR Device - TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Device**

## Resource Profile: GEM ERP PR Device 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device | *Version*:2.0.0-ballot.2 |
| Active as of 2028-04-01 | *Computable Name*:GEM_ERP_PR_Device |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Statische Informationen auf dem TI-Flow-Fachdienst 

**Usages:**

* Use this Profile: [TIFlow Receipt Bundle](StructureDefinition-tiflow-receipt-bundle.md)
* Refer to this Profile: [GEM_ERP_PR_Signature](StructureDefinition-GEM-ERP-PR-Signature.md) and [GEM ERP PR Composition](StructureDefinition-tiflow-receipt-composition.md)
* CapabilityStatements using this Profile: [CapabilityStatement für den TI-Flow-Fachdienst](CapabilityStatement-ti-flow-fachdienst-server.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-GEM-ERP-PR-Device.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Device.csv), [Excel](StructureDefinition-GEM-ERP-PR-Device.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Device",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_PR_Device",
  "title" : "GEM ERP PR Device",
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
  "description" : "Statische Informationen auf dem TI-Flow-Fachdienst",
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
      "id" : "Device",
      "path" : "Device"
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
      "short" : "Kontaktdaten des TI Fachdienstes.",
      "mustSupport" : true
    }]
  }
}

```
