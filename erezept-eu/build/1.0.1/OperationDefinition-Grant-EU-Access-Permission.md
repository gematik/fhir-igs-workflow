# Grant-EU-Access-Permission - EU Zugriff E-Rezept v1.0.1

EU Zugriff E-Rezept

Version 1.0.1 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Grant-EU-Access-Permission**

## OperationDefinition: Grant-EU-Access-Permission 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/OperationDefinition/Grant_Access_PermissionOperationDefinition | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:Grant_Access_Permission |

 
This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "Grant-EU-Access-Permission",
  "url" : "https://gematik.de/fhir/erp-eu/OperationDefinition/Grant_Access_PermissionOperationDefinition",
  "version" : "1.0.1",
  "name" : "Grant_Access_Permission",
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
  "description" : "This operation receives the access code and the country that the patient wants to grant access to. The operation validates the country and creates registeres the Access Code.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : true,
  "code" : "grant-eu-access-permission",
  "system" : true,
  "type" : false,
  "instance" : false,
  "inputProfile" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Request",
  "outputProfile" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response",
  "parameter" : [{
    "name" : "countryCode",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "The country for which the patient wants to grant access.",
    "type" : "Coding"
  },
  {
    "name" : "accessCode",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "The access code for that country.",
    "type" : "Identifier"
  },
  {
    "name" : "countryCode",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "The country for which the patient wants to grant access.",
    "type" : "Coding"
  },
  {
    "name" : "accessCode",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "The access code for that country.",
    "type" : "Identifier"
  },
  {
    "name" : "validUntil",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "The instant until the access code is valid.",
    "type" : "instant"
  },
  {
    "name" : "createdAt",
    "use" : "out",
    "min" : 1,
    "max" : "1",
    "documentation" : "The instant when the record was created in the E-Rezept-Fachdienst.",
    "type" : "instant"
  }]
}

```
