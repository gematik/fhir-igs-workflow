# Example Activate operation input parameters - TIFlow - Verordnungen für Arzneimittel v0.9.0

TIFlow - Verordnungen für Arzneimittel

Version 0.9.0 - ci-build 

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
      "id" : "PrescriptionBinary",
      "contentType" : "application/pkcs7-mime",
      "data" : "dGhpcyBibG9iIGlzIHNuaXBwZWQ="
    }
  }]
}

```
