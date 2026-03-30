# Revoke-EU-Access-Permission - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Revoke-EU-Access-Permission**

## OperationDefinition: Revoke-EU-Access-Permission 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/OperationDefinition/Revoke_Access_PermissionOperationDefinition | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:Revoke_Access_Permission |

 
This operation revokes the currently registered access code for redeeming prescriptions in an EU country. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "Revoke-EU-Access-Permission",
  "url" : "https://gematik.de/fhir/erp-eu/OperationDefinition/Revoke_Access_PermissionOperationDefinition",
  "version" : "1.0.0-draft",
  "name" : "Revoke_Access_Permission",
  "status" : "active",
  "kind" : "operation",
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
  "description" : "This operation revokes the currently registered access code for redeeming prescriptions in an EU country.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "revoke-eu-access-permission",
  "system" : true,
  "type" : false,
  "instance" : false
}

```
