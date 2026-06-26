# Task searchset response for Rx - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

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
