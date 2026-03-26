# Antwortbundle fuer GET /Task - TIFlow - Kernfunktionalitäten v0.9.0

TIFlow - Kernfunktionalitäten

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Antwortbundle fuer GET /Task**

## Example Bundle: Antwortbundle fuer GET /Task



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "example-searchset-task",
  "type" : "searchset",
  "total" : 2,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task?status=ready&_count=2"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/607255ed-ce41-47fc-aad3-cfce1c39963f",
    "resource" : {
      "resourceType" : "Task",
      "id" : "TaskInReadyState",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task|1.6"],
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
        "valueDate" : "2026-07-01"
      },
      {
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate",
        "valueDate" : "2026-07-01"
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
      "authoredOn" : "2026-07-01T15:29:00+00:00",
      "lastModified" : "2026-07-01T16:44:00.434+00:00",
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
          "reference" : "281a985c-f25b-4aae-91a6-41ad744080b0"
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
          "reference" : "f8c2298f-7c00-4a68-af29-8a2862d55d43"
        }
      }]
    }
  },
  {
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/b12eb5f7-91ce-4887-93c7-800454601377",
    "resource" : {
      "resourceType" : "Task",
      "id" : "b12eb5f7-91ce-4887-93c7-800454601377",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task|1.6"],
        "tag" : [{
          "display" : "Task in DRAFT state just created by Fachdienst via $create operation"
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
        "valueDate" : "2026-07-01"
      },
      {
        "url" : "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_ExpiryDate",
        "valueDate" : "2026-07-01"
      }],
      "identifier" : [{
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.033.491.280.78"
      },
      {
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_AccessCode",
        "value" : "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
      }],
      "status" : "draft",
      "intent" : "order",
      "authoredOn" : "2026-07-01T15:29:00+00:00",
      "performerType" : [{
        "coding" : [{
          "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_OrganizationType",
          "code" : "urn:oid:1.2.276.0.76.4.54",
          "display" : "Öffentliche Apotheke"
        }]
      }]
    }
  }]
}

```
