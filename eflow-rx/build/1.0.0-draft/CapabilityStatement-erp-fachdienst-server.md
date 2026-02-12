# ERP CapabilityStatement für den E-Rezept-Fachdienst - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **ERP CapabilityStatement für den E-Rezept-Fachdienst**

## CapabilityStatement: ERP CapabilityStatement für den E-Rezept-Fachdienst 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server | *Version*:1.0.0-draft |
| Draft as of 2025-12-15 | *Computable Name*:ERPFachdienstServer |

 
ERP CapabilityStatement für den E-Rezept-Fachdienst 



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "erp-fachdienst-server",
  "meta" : {
    "profile" : [
      "https://gematik.de/fhir/ti/StructureDefinition/ti-capability-statement"
    ]
  },
  "extension" : [
    {
      "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-base-url",
      "valueString" : "http://todo"
    },
    {
      "extension" : [
        {
          "url" : "statusCode",
          "valueString" : "423"
        },
        {
          "url" : "description",
          "valueString" : "If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."
        },
        {
          "url" : "responseType",
          "valueString" : "application/json"
        },
        {
          "url" : "errorCode",
          "valueString" : "locked"
        }
      ],
      "url" : "https://gematik.de/fhir/ti/StructureDefinition/extension-http-response-info"
    }
  ],
  "url" : "https://gematik.de/fhir/erp/CapabilityStatement/erp-fachdienst-server",
  "version" : "1.0.0-draft",
  "name" : "ERPFachdienstServer",
  "title" : "ERP CapabilityStatement für den E-Rezept-Fachdienst",
  "status" : "draft",
  "date" : "2025-12-15",
  "publisher" : "gematik GmbH",
  "contact" : [
    {
      "name" : "gematik GmbH",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://gematik.de"
        },
        {
          "system" : "email",
          "value" : "erp-umsetzung@gematik.de"
        }
      ]
    }
  ],
  "description" : "ERP CapabilityStatement für den E-Rezept-Fachdienst",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "DE",
          "display" : "Germany"
        }
      ]
    }
  ],
  "kind" : "requirements",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [
    {
      "mode" : "server"
    }
  ]
}

```
