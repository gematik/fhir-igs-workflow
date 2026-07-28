# Antwortbundle fuer GET /Task - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

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
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task?status=ready&_count=2"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/b12eb5f7-91ce-4887-93c7-800454601377",
    "resource" : {
      "resourceType" : "Task",
      "id" : "b9f1fbdd-f28b-4ec7-959c-5283d3433b0e",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task|2.0"],
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
      }],
      "identifier" : [{
        "system" : "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId",
        "value" : "160.000.033.491.280.78"
      }],
      "status" : "draft",
      "intent" : "order",
      "authoredOn" : "2028-10-01T15:29:00+00:00"
    }
  }]
}

```
