# GEM ERPEU PR PAR Access Authorization Response - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM ERPEU PR PAR Access Authorization Response**

## Resource Profile: GEM ERPEU PR PAR Access Authorization Response 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GEM_ERPEU_PR_PAR_Access_Authorization_Response |

 
Displays Response Parameters for EU Access Authorization 

**Usages:**

* Examples for this Profile: [Parameters/Example-EU-PermissionResponse](Parameters-Example-EU-PermissionResponse.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/de.gematik.tiflow.xborder|current/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Response.csv), [Excel](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Response.xlsx), [Schematron](StructureDefinition-GEM-ERPEU-PR-PAR-AccessAuthorization-Response.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "GEM-ERPEU-PR-PAR-AccessAuthorization-Response",
  "url" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response",
  "version" : "0.9.0",
  "name" : "GEM_ERPEU_PR_PAR_Access_Authorization_Response",
  "title" : "GEM ERPEU PR PAR Access Authorization Response",
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
  "description" : "Displays Response Parameters for EU Access Authorization",
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
      "min" : 4,
      "max" : "4"
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
      "id" : "Parameters.parameter:countryCode.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
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
    },
    {
      "id" : "Parameters.parameter:accessCode.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:validUntil",
      "path" : "Parameters.parameter",
      "sliceName" : "validUntil",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:validUntil.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "validUntil",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:validUntil.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "Parameters.parameter:validUntil.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    },
    {
      "id" : "Parameters.parameter:createdAt",
      "path" : "Parameters.parameter",
      "sliceName" : "createdAt",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:createdAt.name",
      "path" : "Parameters.parameter.name",
      "patternString" : "createdAt",
      "mustSupport" : true
    },
    {
      "id" : "Parameters.parameter:createdAt.value[x]",
      "path" : "Parameters.parameter.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "instant"
      }]
    },
    {
      "id" : "Parameters.parameter:createdAt.resource",
      "path" : "Parameters.parameter.resource",
      "max" : "0"
    }]
  }
}

```
