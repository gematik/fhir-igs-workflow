# DiGA Task in ready state - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.3 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **DiGA Task in ready state**

## Example Task: DiGA Task in ready state



## Resource Content

```json
{
  "resourceType" : "Task",
  "id" : "ExampleDiGATaskInReadyState",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow-diga/StructureDefinition/tiflow-diga-task"]
  },
  "extension" : [{
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
      "code" : "162",
      "display" : "Flowtype für Digitale Gesundheitsanwendungen"
    }
  },
  {
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate",
    "valueDate" : "2028-10-09"
  },
  {
    "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate",
    "valueDate" : "2028-10-09"
  }],
  "identifier" : [{
    "use" : "official",
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
    "value" : "162.000.000.000.000.01"
  },
  {
    "use" : "official",
    "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode",
    "value" : "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
  }],
  "status" : "ready",
  "intent" : "order",
  "for" : {
    "identifier" : {
      "system" : "http://fhir.de/sid/gkv/kvid-10",
      "value" : "X123456789"
    }
  },
  "authoredOn" : "2028-10-01T15:29:00+00:00",
  "lastModified" : "2028-10-01T15:29:00.434+00:00",
  "performerType" : [{
    "coding" : [{
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType",
      "code" : "urn:oid:1.2.276.0.76.4.59",
      "display" : "Kostenträger"
    }],
    "text" : "Kostenträger"
  }],
  "input" : [{
    "type" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType",
        "code" : "2"
      }]
    },
    "valueReference" : {
      "reference" : "Bundle/ExampleDiGABundle"
    }
  }]
}

```
