# Task searchset response for Rx - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Task searchset response for Rx**

## Example Bundle: Task searchset response for Rx



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleRxTaskSearchset",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Task?status=ready&_count=1"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Task/TaskInReadyState",
    "resource" : {
      "resourceType" : "Task",
      "id" : "TaskInReadyState",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task|2.0"],
        "tag" : [{
          "display" : "Task in READY state activated by (Z)PVS/KIS via $activate operation"
        }]
      },
      "extension" : [{
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType",
        "valueCoding" : {
          "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
          "code" : "160",
          "display" : "Flowtype für Apothekenpflichtige Arzneimittel"
        }
      },
      {
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_AcceptDate",
        "valueDate" : "2028-10-01"
      },
      {
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate",
        "valueDate" : "2028-10-01"
      }],
      "identifier" : [{
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.033.491.280.78"
      },
      {
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
      "lastModified" : "2028-10-01T16:44:00.434+00:00",
      "performerType" : [{
        "coding" : [{
          "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType",
          "code" : "urn:oid:1.2.276.0.76.4.54",
          "display" : "Öffentliche Apotheke"
        }]
      }],
      "input" : [{
        "type" : {
          "coding" : [{
            "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType",
            "code" : "1",
            "display" : "Health Care Provider Prescription"
          }]
        },
        "valueReference" : {
          "reference" : "Binary/PrescriptionBinaryWithMeta"
        }
      },
      {
        "type" : {
          "coding" : [{
            "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_DocumentType",
            "code" : "2",
            "display" : "Patient Confirmation"
          }]
        },
        "valueReference" : {
          "reference" : "Bundle/ExampleERPBundle"
        }
      }]
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
