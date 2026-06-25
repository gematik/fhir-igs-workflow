# Example CapabilityStatement Server PU - RX - Implementation Guide TIFlow - Kernfunktionalitäten v2.0.0-ballot.2

Implementation Guide

TIFlow - Kernfunktionalitäten

Version 2.0.0-ballot.2 - draft 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example CapabilityStatement Server PU - RX**

## CapabilityStatement: Example CapabilityStatement Server PU - RX 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/CapabilityStatement/ExampleCapabilityStatementServerPU | *Version*:2.0.0-ballot.2 |
| Active as of 2026-03-16 | *Computable Name*: |
| **Copyright/Legal**: gematik GmbH / Dieser Implementation Guide ist lizenziert unter [Apache License](./license.md), Version 2.0. | |



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "ExampleCapabilityStatementServerPU",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/ti-environment",
    "valueCode" : "PU"
  },
  {
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/ti-fhir-configuration",
    "valueCode" : "tiflow_2028_0"
  },
  {
    "extension" : [{
      "url" : "definition",
      "valueCanonical" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf160"
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/ti-feature"
  },
  {
    "extension" : [{
      "url" : "definition",
      "valueCanonical" : "https://gematik.de/fhir/tiflow/StructureDefinition/ti-flow-feature-wf169"
    },
    {
      "url" : "value",
      "valueBoolean" : false
    }],
    "url" : "https://gematik.de/fhir/ti/StructureDefinition/ti-feature"
  }],
  "url" : "https://gematik.de/fhir/tiflow/CapabilityStatement/ExampleCapabilityStatementServerPU",
  "version" : "2.0.0-ballot.2",
  "status" : "active",
  "date" : "2026-03-16",
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
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "copyright" : "gematik GmbH / Dieser Implementation Guide ist lizenziert unter [Apache License](./license.html), Version 2.0.",
  "kind" : "instance",
  "implementation" : {
    "description" : "example"
  },
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [{
    "mode" : "server"
  }]
}

```
