# Example request parameters for Rx $activate operation - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example request parameters for Rx $activate operation**

## Example Parameters: Example request parameters for Rx $activate operation



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "ExampleRxActivateOperationRequestParameters",
  "parameter" : [{
    "name" : "ePrescription",
    "valueAttachment" : {
      "contentType" : "application/pkcs7-mime",
      "data" : "c29tZSBkYXRh"
    }
  }]
}

```
