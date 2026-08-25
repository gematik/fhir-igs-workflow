# Example Activate operation input parameters - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example Activate operation input parameters**

## Example Parameters: Example Activate operation input parameters



## Resource Content

```json
{
  "resourceType" : "Parameters",
  "id" : "ExampleOperationActivateParametersInput",
  "parameter" : [{
    "name" : "ePrescription",
    "resource" : {
      "resourceType" : "Binary",
      "id" : "PrescriptionBinaryWithMeta",
      "meta" : {
        "profile" : ["https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Binary"]
      },
      "contentType" : "application/pkcs7-mime",
      "data" : "dGhpcyBibG9iIGlzIHNuaXBwZWQ="
    }
  }]
}

```
