# GEM ERP PR Device - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERP PR Device**

## Resource Profile: GEM ERP PR Device 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-device | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:EFlowRxDevice |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Statische Informationen auf dem E-Rezept-Fachdienst 

**Usages:**

* Use this Profile: [GEM ERP PR Bundle](StructureDefinition-eflow-rx-bundle.md)
* Refer to this Profile: [GEM ERP PR Composition](StructureDefinition-eflow-rx-composition.md) and [EFlowRxSignature](StructureDefinition-eflow-rx-signature.md)
* Examples for this Profile: [Device/1](Device-1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.eflow-rx|current/StructureDefinition/eflow-rx-device)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-eflow-rx-device.csv), [Excel](StructureDefinition-eflow-rx-device.xlsx), [Schematron](StructureDefinition-eflow-rx-device.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "eflow-rx-device",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/eflow-rx-device",
  "version" : "1.0.0-draft",
  "name" : "EFlowRxDevice",
  "title" : "GEM ERP PR Device",
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
  "description" : "Statische Informationen auf dem E-Rezept-Fachdienst",
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
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "udi",
      "uri" : "http://fda.gov/UDI",
      "name" : "UDI Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Device",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Device",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
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
      }
    ]
  }
}

```
