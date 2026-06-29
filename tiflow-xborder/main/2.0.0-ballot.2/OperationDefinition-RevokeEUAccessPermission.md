# RevokeEUAccessPermission - Implementation Guide TIFlow - Grenzüberschreitender Datenaustausch v2.0.0-ballot.2

Implementation Guide

TIFlow - Grenzüberschreitender Datenaustausch

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **RevokeEUAccessPermission**

## OperationDefinition: RevokeEUAccessPermission 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow-xborder/OperationDefinition/RevokeEUAccessPermission | *Version*:2.0.0-ballot.2 |
| Draft as of 2026-06-30 | *Computable Name*:RevokeEUAccessPermission |

 
This operation revokes the currently registered access code for redeeming prescriptions in an EU country. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "RevokeEUAccessPermission",
  "url" : "https://gematik.de/fhir/tiflow-xborder/OperationDefinition/RevokeEUAccessPermission",
  "version" : "2.0.0-ballot.2",
  "name" : "RevokeEUAccessPermission",
  "status" : "draft",
  "kind" : "operation",
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
