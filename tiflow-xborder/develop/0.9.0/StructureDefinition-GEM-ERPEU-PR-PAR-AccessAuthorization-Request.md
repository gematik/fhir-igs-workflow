# GEM ERPEU PR PAR Access Authorization Request - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERPEU PR PAR Access Authorization Request**

## Resource Profile: GEM ERPEU PR PAR Access Authorization Request 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_PAR_Access_Authorization_Request |

 
Displays Parameters for EU Access Authorization 

**Usages:**

* Examples for this Profile: [Parameters/Example-EU-PermissionRequest](Parameters-Example-EU-PermissionRequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Request.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Request.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Request.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-PAR-AccessAuthorization-Request",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request",
  "version" : "0.9.0",
  "name" : "GEM_ERPEU_PR_PAR_Access_Authorization_Request",
  "title" : "GEM ERPEU PR PAR Access Authorization Request",
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
  "description" : "Displays Parameters for EU Access Authorization",
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Parameters",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Parameters",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Parameters",
      "path" : "Parameters"
    },
    {
      "id" : "Parameters.parameter",
      "path" : "Parameters.parameter",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "name"
        }],
        "rules" : "closed"
      },
      "min" : 2,
      "max" : "2"
    },
    {
      "id" : "Parameters.parameter:countryCode",
      "path" : "Parameters.parameter",
      "sliceName" : "countryCode",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:countryCode.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "countryCode",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:countryCode.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Coding"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/iso3166-1-2"
      }
    },
    {
      "id" : "Parameters.parameter:countryCode.value[x].system",
      "path" : "Parameters.parameter.value[x].system",
      "min" : 1,
      "patternUri" : "urn:iso:std:iso:3166"
    },
    {
      "id" : "Parameters.parameter:accessCode",
      "path" : "Parameters.parameter",
      "sliceName" : "accessCode",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:accessCode.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "accessCode",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:accessCode.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Identifier",
        "profile" : ["https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-AccessCode"]
      }]
    }]
  }
}

```
