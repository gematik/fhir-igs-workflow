# Revoke-EU-Access-Permission - TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Revoke-EU-Access-Permission**

## OperationDefinition: Revoke-EU-Access-Permission 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-xborder/OperationDefinition/Revoke-EU-Access-Permission | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-05-26 | *Computable Name*:Revoke-EU-Access-Permission |

 
This operation revokes the currently registered access code for redeeming prescriptions in an EU country. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "Revoke-EU-Access-Permission",
  "url" : "https://gematik.de/fhir/tiflow-xborder/OperationDefinition/Revoke-EU-Access-Permission",
  "version" : "2.0.0-ballot.2",
  "name" : "Revoke-EU-Access-Permission",
  "status" : "draft",
  "kind" : "operation",
  "date" : "2026-05-26",
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
