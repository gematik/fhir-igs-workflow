# Example request parameters for Rx $create operation - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example request parameters for Rx $create operation**

## Example Parameters: Example request parameters for Rx $create operation



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "ExampleRxCreateOperationRequestParameters",
  "parameter" : [{
    "name" : "workflowType",
    "valueCoding" : {
      "system" : "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType",
      "code" : "160"
    }
  }]
}

```
