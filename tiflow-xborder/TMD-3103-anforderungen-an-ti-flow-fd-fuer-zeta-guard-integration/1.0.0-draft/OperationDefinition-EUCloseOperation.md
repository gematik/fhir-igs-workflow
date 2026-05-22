# EUCloseOperation - TIFlow - Grenzüberschreitender Datenaustausch v1.0.0-draft

TIFlow - Grenzüberschreitender Datenaustausch

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **EUCloseOperation**

## OperationDefinition: EUCloseOperation 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/OperationDefinition/EUCloseOperationDefinition | *Version*:1.0.0-draft |
| Active as of 2026-01-08 | *Computable Name*:EUClose |

 
The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "EUCloseOperation",
  "url" : "https://gematik.de/fhir/erp-eu/OperationDefinition/EUCloseOperationDefinition",
  "version" : "1.0.0-draft",
  "name" : "EUClose",
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
  "description" : "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "code" : "eu-close",
  "resource" : ["Task"],
  "system" : false,
  "type" : false,
  "instance" : true,
  "inputProfile" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-Close-Operation-Input",
  "parameter" : [{
    "name" : "requestData",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Additional request information",
    "part" : [{
      "name" : "kvnr",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Identifier"
    },
    {
      "name" : "accessCode",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Identifier"
    },
    {
      "name" : "countryCode",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Coding"
    },
    {
      "name" : "practitionerName",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "string"
    },
    {
      "name" : "practitionerRole",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Coding"
    },
    {
      "name" : "pointOfCare",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "string"
    },
    {
      "name" : "healthcare-facility-type",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Coding"
    }]
  },
  {
    "name" : "practitionerData",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Information on the practitioner who dispensed",
    "type" : "Practitioner"
  },
  {
    "name" : "organizationData",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Information on the organization where the dispensation happened",
    "type" : "Organization"
  },
  {
    "name" : "practitionerRoleData",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "type" : "PractitionerRole"
  },
  {
    "name" : "rxDispensation",
    "use" : "in",
    "min" : 1,
    "max" : "*",
    "documentation" : "Information on dispensed Medication(s)",
    "part" : [{
      "name" : "medicationDispense",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "MedicationDispense"
    },
    {
      "name" : "medication",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Medication"
    }]
  }]
}

```
