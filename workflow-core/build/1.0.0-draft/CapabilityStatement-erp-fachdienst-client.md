# ERP Capability Statement für Clients des E-Rezept-Fachdienst - Implementation Guide E-Rezept-Workflow Core v1.0.0-draft

Implementation Guide

E-Rezept-Workflow Core

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP Capability Statement für Clients des E-Rezept-Fachdienst**

## CapabilityStatement: ERP Capability Statement für Clients des E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-client | *Version*:1.0.0-draft |
| Active as of 2025-12-15 | *Computable Name*:ERPFachdienstClient |

 
Dieses Capability Statement legt die Anforderungen an Clients des E-Rezept-Fachdienst fest. Es definiert die unterstützten Interaktionen, erforderliche HTTP Header sowie erwartete Status Codes. 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-client",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "url" : "https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-client",
  "version" : "1.0.0-draft",
  "name" : "ERPFachdienstClient",
  "title" : "ERP Capability Statement für Clients des E-Rezept-Fachdienst",
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
  "description" : "Dieses Capability Statement legt die Anforderungen an Clients des E-Rezept-Fachdienst fest. Es definiert die unterstützten Interaktionen, erforderliche HTTP Header sowie erwartete Status Codes.",
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
    "mode" : "client",
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation",
        "valueCode" : "MAY"
      }],
      "type" : "Task",
      "versioning" : "versioned-update",
      "readHistory" : true
    }]
  }]
}

```
