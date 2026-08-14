# TIFlow Receipt Bundle - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFlow Receipt Bundle**

## Resource Profile: TIFlow Receipt Bundle 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle | *Version*:2.0.0-ballot.2 |
| Active as of 2026-06-30 | *Computable Name*:GEM_ERP_PR_Bundle |
| **Copyright/Legal**: gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.md), Version 2.0. | |

 
Dokumentenbündel für Quittung 

**Usages:**

* This Profile is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/de.gematik.tiflow|current/StructureDefinition/StructureDefinition-GEM-ERP-PR-Bundle.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERP-PR-Bundle.csv), [Excel](StructureDefinition-GEM-ERP-PR-Bundle.xlsx), [Schematron](StructureDefinition-GEM-ERP-PR-Bundle.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERP-PR-Bundle",
  "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Bundle",
  "version" : "2.0.0-ballot.2",
  "name" : "GEM_ERP_PR_Bundle",
  "title" : "TIFlow Receipt Bundle",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-06-30",
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
  "description" : "Dokumentenbündel für Quittung",
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
      "id" : "Bundle.id",
      "path" : "Bundle.id",
      "min" : 1
    },
    {
      "id" : "Bundle.identifier",
      "path" : "Bundle.identifier",
      "short" : "E-Rezept-ID",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/e-prescription-id"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Bundle.type",
      "path" : "Bundle.type",
      "fixedCode" : "document",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.timestamp",
      "path" : "Bundle.timestamp",
      "min" : 1
    },
    {
      "id" : "Bundle.entry",
      "path" : "Bundle.entry",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "resource"
        }],
        "rules" : "closed"
      },
      "min" : 3
    },
    {
      "id" : "Bundle.entry:DocumentInformation",
      "path" : "Bundle.entry",
      "sliceName" : "DocumentInformation",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry:DocumentInformation.link",
      "path" : "Bundle.entry.link",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:DocumentInformation.fullUrl",
      "path" : "Bundle.entry.fullUrl",
      "min" : 1
    },
    {
      "id" : "Bundle.entry:DocumentInformation.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Composition",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Composition"]
      }]
    },
    {
      "id" : "Bundle.entry:DocumentInformation.search",
      "path" : "Bundle.entry.search",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:DocumentInformation.request",
      "path" : "Bundle.entry.request",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:DocumentInformation.response",
      "path" : "Bundle.entry.response",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:SigningDevice",
      "path" : "Bundle.entry",
      "sliceName" : "SigningDevice",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry:SigningDevice.link",
      "path" : "Bundle.entry.link",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:SigningDevice.fullUrl",
      "path" : "Bundle.entry.fullUrl",
      "min" : 1
    },
    {
      "id" : "Bundle.entry:SigningDevice.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Device",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Device"]
      }]
    },
    {
      "id" : "Bundle.entry:SigningDevice.search",
      "path" : "Bundle.entry.search",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:SigningDevice.request",
      "path" : "Bundle.entry.request",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:SigningDevice.response",
      "path" : "Bundle.entry.response",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest",
      "path" : "Bundle.entry",
      "sliceName" : "PrescriptionDigest",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest.link",
      "path" : "Bundle.entry.link",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest.fullUrl",
      "path" : "Bundle.entry.fullUrl",
      "min" : 1
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest.resource",
      "path" : "Bundle.entry.resource",
      "min" : 1,
      "type" : [{
        "code" : "Binary",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Digest"]
      }]
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest.search",
      "path" : "Bundle.entry.search",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest.request",
      "path" : "Bundle.entry.request",
      "max" : "0"
    },
    {
      "id" : "Bundle.entry:PrescriptionDigest.response",
      "path" : "Bundle.entry.response",
      "max" : "0"
    },
    {
      "id" : "Bundle.signature",
      "path" : "Bundle.signature",
      "short" : "Enveloping Signatur auf die Quittung angewendet",
      "type" : [{
        "code" : "Signature",
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Signature"]
      }],
      "mustSupport" : true
    }]
  }
}

```
