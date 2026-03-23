# Fehlermeldung BfArM Webdienst - TIFlow - Datenaustausch BfArM Webdienst v0.9.0

TIFlow - Datenaustausch BfArM Webdienst

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Fehlermeldung BfArM Webdienst**

## Example OperationOutcome: Fehlermeldung BfArM Webdienst

> **issue****severity**: Error**code**: Invalid Content**details**: Invalid request payload**diagnostics**: This field is required**expression**: parameter[rxPrescription].part[prescriptionId].value

> **issue****severity**: Error**code**: Element value invalid**details**: Invalid format for field**diagnostics**: Value must be a date**expression**: parameter[rxPrescription].part[medicationRequest].resource.authoredOn



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ERP-TPrescription-OperationOutcome-1",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "Invalid request payload"
    },
    "diagnostics" : "This field is required",
    "expression" : ["parameter[rxPrescription].part[prescriptionId].value"]
  },
  {
    "severity" : "error",
    "code" : "value",
    "details" : {
      "text" : "Invalid format for field"
    },
    "diagnostics" : "Value must be a date",
    "expression" : ["parameter[rxPrescription].part[medicationRequest].resource.authoredOn"]
  }]
}

```
