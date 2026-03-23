# GET-Prescription-EU - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **GET-Prescription-EU**

## OperationDefinition: GET-Prescription-EU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp-eu/OperationDefinition/GET-Prescription-EUOperationDefinition | *Version*:0.9.0 |
| Active as of 2026-01-08 | *Computable Name*:GET-Prescription-EU |

 
The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries 



## Resource Content

```json
{
  "resourceType" : "OperationDefinition",
  "id" : "GET-Prescription-EU",
  "url" : "https://gematik.de/fhir/erp-eu/OperationDefinition/GET-Prescription-EUOperationDefinition",
  "version" : "0.9.0",
  "name" : "GET-Prescription-EU",
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
  "description" : "The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "affectsState" : false,
  "code" : "get-eu-prescriptions",
  "system" : true,
  "type" : false,
  "instance" : false,
  "inputProfile" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input",
  "outputProfile" : "https://gematik.de/fhir/tiflow/xborder/StructureDefinition/gem-erpeu-pr-par-get-prescription-output",
  "parameter" : [{
    "name" : "requestData",
    "use" : "in",
    "min" : 1,
    "max" : "1",
    "documentation" : "Additional request information",
    "part" : [{
      "name" : "requesttype",
      "use" : "in",
      "min" : 1,
      "max" : "1",
      "type" : "Coding"
    },
    {
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
      "name" : "prescription-id",
      "use" : "in",
      "min" : 0,
      "max" : "*",
      "type" : "Identifier"
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
    "name" : "return",
    "use" : "out",
    "min" : 0,
    "max" : "1",
    "documentation" : "Depending on the requesttype this operation returns a Bundle containing eRezept KBV_PR_ERP_Bundle Prescription-Bundles.",
    "type" : "Bundle"
  }]
}

```
