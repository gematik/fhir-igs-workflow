# Task searchset response for DiGA - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

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
