# ERP CapabilityStatement für den E-Rezept-Fachdienst - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP CapabilityStatement für den E-Rezept-Fachdienst**

## CapabilityStatement: ERP CapabilityStatement für den E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server | *Version*:1.0.0-draft |
| Active as of 2025-12-15 | *Computable Name*:ERPFachdienstServer |

 
ERP CapabilityStatement für den E-Rezept-Fachdienst 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-server",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
    "valueString" : "http://todo"
  }],
  "url" : "https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server",
  "version" : "1.0.0-draft",
  "name" : "ERPFachdienstServer",
  "title" : "ERP CapabilityStatement für den E-Rezept-Fachdienst",
  "status" : "active",
  "date" : "2025-12-15",
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
  "description" : "ERP CapabilityStatement für den E-Rezept-Fachdienst",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [{
    "mode" : "server"
  }]
}

```
