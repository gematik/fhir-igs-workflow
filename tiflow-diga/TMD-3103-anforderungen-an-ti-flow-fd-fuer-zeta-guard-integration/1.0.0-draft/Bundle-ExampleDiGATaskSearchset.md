# Task searchset response for DiGA - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v1.0.0-draft

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Task searchset response for DiGA**

## Example Bundle: Task searchset response for DiGA



## Resource Content

```json
{
  "resourceType" : "Bundle",
  "id" : "ExampleDiGATaskSearchset",
  "type" : "searchset",
  "total" : 1,
  "link" : [{
    "relation" : "self",
    "url" : "https://erp-ref.example.org/Task?status=ready&_count=1"
  }],
  "entry" : [{
    "fullUrl" : "https://erp-ref.example.org/Task/ExampleDiGATaskInReadyState",
    "resource" : {
      "resourceType" : "Task",
      "id" : "ExampleDiGATaskInReadyState",
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a name=\"Task_ExampleDiGATaskInReadyState\"> </a><p class=\"res-header-id\"><b>Generated Narrative: Task ExampleDiGATaskInReadyState</b></p><a name=\"ExampleDiGATaskInReadyState\"> </a><a name=\"hcExampleDiGATaskInReadyState\"> </a><p><b>status</b>: Ready</p><p><b>intent</b>: order</p><p><b>authoredOn</b>: 2026-03-20</p></div>"
      },
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
