# Example Activate operation input parameters - E-Rezept für Arzneimittel v1.0.0-draft

E-Rezept für Arzneimittel

Version 1.0.0-draft - ci-build 

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
