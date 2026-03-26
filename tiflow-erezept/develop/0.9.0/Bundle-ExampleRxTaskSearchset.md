# Task searchset response for Rx - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

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
    "fullUrl" : "https://erp-ref.example.org/Task/ExampleRxTaskInReadyState",
    "resource" : {
      "resourceType" : "Task",
      "id" : "ExampleRxTaskInReadyState",
      "status" : "ready",
      "intent" : "order",
      "authoredOn" : "2026-03-20"
    },
    "search" : {
      "mode" : "match"
    }
  }]
}

```
