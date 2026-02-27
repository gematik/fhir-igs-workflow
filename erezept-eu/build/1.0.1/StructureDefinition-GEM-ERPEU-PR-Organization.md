# Organization Information Received from the EU - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Organization Information Received from the EU**

## Resource Profile: Organization Information Received from the EU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Organization | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_Organization |

 
This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU 

**Usages:**

* Use this Profile: [GEM ERP PR EU CloseOperation Input](StructureDefinition-GEM-ERPEU-PR-PAR-Close-Operation-Input.md)
* Refer to this Profile: [PractitionerRole Information Received from the EU](StructureDefinition-GEM-ERPEU-PR-PractitionerRole.md)
* Examples for this Profile: [Pharmacia de Santa Maria](Organization-Example-EU-Organization.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.erezept.eu|current/StructureDefinition/GEM-ERPEU-PR-Organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-Organization.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-Organization.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-Organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-Organization",
  "url" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-Organization",
  "version" : "1.0.1",
  "name" : "GEM_ERPEU_PR_Organization",
  "title" : "Organization Information Received from the EU",
  "status" : "active",
  "date" : "2026-01-08",
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
  "description" : "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
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
    "identity" : "servd",
    "uri" : "http://www.omg.org/spec/ServD/1.0/",
    "name" : "ServD"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "https://gematik.de/fhir/ti/StructureDefinition/ti-organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization"
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "short" : "Organization Identifier",
      "definition" : "An identifier for the organization",
      "comment" : "There are not yet specific identifier systems defined. Therefore the field system is optional, but has to be used if there is a known identifier system.",
      "min" : 1
    },
    {
      "id" : "Organization.identifier.system",
      "path" : "Organization.identifier.system",
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier.value",
      "path" : "Organization.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.address",
      "path" : "Organization.address",
      "comment" : "The address information is required for a dispensing organization. That means that the data can either be given or also stated with a data absent reason.",
      "max" : "1"
    },
    {
      "id" : "Organization.address.line",
      "path" : "Organization.address.line",
      "comment" : "This information is required. That means that the data can either be given or also stated with a data absent reason.",
      "min" : 1
    },
    {
      "id" : "Organization.address.city",
      "path" : "Organization.address.city",
      "comment" : "This information is required. That means that the data can either be given or also stated with a data absent reason.",
      "min" : 1
    },
    {
      "id" : "Organization.address.state",
      "path" : "Organization.address.state",
      "comment" : "This information is required. That means that the data can either be given or also stated with a data absent reason.",
      "min" : 1
    },
    {
      "id" : "Organization.address.postalCode",
      "path" : "Organization.address.postalCode",
      "comment" : "This information is required. That means that the data can either be given or also stated with a data absent reason.",
      "min" : 1
    },
    {
      "id" : "Organization.address.country",
      "path" : "Organization.address.country",
      "comment" : "This information is required. That means that the data can either be given or also stated with a data absent reason.",
      "min" : 1
    }]
  }
}

```
