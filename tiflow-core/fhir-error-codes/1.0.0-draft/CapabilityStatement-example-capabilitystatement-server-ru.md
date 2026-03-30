# Example CapabilityStatement Server RU - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example CapabilityStatement Server RU**

## CapabilityStatement: Example CapabilityStatement Server RU 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/core/CapabilityStatement/example-capabilitystatement-server-ru | *Version*:1.0.0-draft |
| Active as of 2026-03-16 | *Computable Name*:ExampleCapabilityStatementServerRU |



## Resource Content

```json
{
  "resourceType" : "CapabilityStatement",
  "id" : "example-capabilitystatement-server-ru",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_CapabilityStatement|1.6"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Environment",
    "valueCode" : "RU"
  },
  {
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_FDConfiguration",
    "valueCode" : "erp_2026_02"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "160",
        "display" : "Flowtype für Apothekenpflichtige Arzneimittel"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "162",
        "display" : "Flowtype für Digitale Gesundheitsanwendungen"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "165",
        "display" : "Flowtype für Betäubungsmittel"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "166",
        "display" : "Flowtype für Arzneimittel nach § 3a AMVV"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "169",
        "display" : "Flowtype zur Workflow-Steuerung durch Leistungserbringer"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "200",
        "display" : "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
        "code" : "209",
        "display" : "Flowtype zur Workflow-Steuerung durch Leistungserbringer (PKV)"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : true
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_Features",
        "code" : "eu-prescription",
        "display" : "EU-Feature"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : false
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  },
  {
    "extension" : [{
      "url" : "coding",
      "valueCoding" : {
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_Features",
        "code" : "t-prescription-transfer",
        "display" : "Übertragung digitaler Durchschlag"
      }
    },
    {
      "url" : "value",
      "valueBoolean" : false
    }],
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_CapabilityStatement_Feature"
  }],
  "url" : "https://gematik.de/fhir/tiflow/core/CapabilityStatement/example-capabilitystatement-server-ru",
  "version" : "1.0.0-draft",
  "name" : "ExampleCapabilityStatementServerRU",
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
  "kind" : "instance",
  "fhirVersion" : "4.0.1",
  "format" : ["application/fhir+json", "application/fhir+xml"],
  "rest" : [{
    "mode" : "server"
  }]
}

```
