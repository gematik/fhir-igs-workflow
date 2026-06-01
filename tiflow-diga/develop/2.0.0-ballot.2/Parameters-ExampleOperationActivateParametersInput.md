# Example Activate operation input parameters - TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ci-build 

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
