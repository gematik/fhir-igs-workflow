# GEM_ERPEU_PR_PAR_Access_Authorization_Response - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GEM_ERPEU_PR_PAR_Access_Authorization_Response**

## Example Parameters: GEM_ERPEU_PR_PAR_Access_Authorization_Response



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "Example-EU-PermissionResponse",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-erezept/StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response"]
  },
  "parameter" : [{
    "name" : "countryCode",
    "valueCoding" : {
      "system" : "urn:iso:std:iso:3166",
      "code" : "BE"
    }
  },
  {
    "name" : "accessCode",
    "valueIdentifier" : {
      "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_EU_AccessCode",
      "value" : "ABC123"
    }
  },
  {
    "name" : "validUntil",
    "valueInstant" : "2028-10-01T16:44:00.434+00:00"
  },
  {
    "name" : "createdAt",
    "valueInstant" : "2028-10-01T15:29:00.434+00:00"
  }]
}

```
