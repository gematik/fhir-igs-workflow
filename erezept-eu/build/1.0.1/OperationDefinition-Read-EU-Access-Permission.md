# Read-EU-Access-Permission - E-Rezept Workflow EU v1.0.1

E-Rezept Workflow EU

Version 1.0.1 - release 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Read-EU-Access-Permission**

## OperationDefinition: Read-EU-Access-Permission 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/OperationDefinition/Read_Access_PermissionOperationDefinition | *Version*:1.0.1 |
| Active as of 2026-01-08 | *Computable Name*:Read_Access_Permission |

 
This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country. 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "Read-EU-Access-Permission",
  "url" : "https://gematik.de/fhir/erp-eu/OperationDefinition/Read_Access_PermissionOperationDefinition",
  "version" : "1.0.1",
  "name" : "Read_Access_Permission",
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
  "description" : "This operation reads the currenty in the E-Rezept-Fachdienst registered Access Code for redeeming ePrescriptions in an EU country.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : false,
  "code" : "read-eu-access-permission",
  "system" : true,
  "type" : false,
  "instance" : false,
  "outputProfile" : "https://gematik.de/fhir/erp-eu//StructureDefinition/GEM-ERPEU-PR-PAR-AccessAuthorization-Response",
  "parameter" : [{
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
