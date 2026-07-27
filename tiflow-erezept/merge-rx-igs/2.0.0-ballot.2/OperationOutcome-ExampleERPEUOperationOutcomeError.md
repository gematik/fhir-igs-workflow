# Example error response for ERP-EU operations - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example error response for ERP-EU operations**

## Example OperationOutcome: Example error response for ERP-EU operations



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleERPEUOperationOutcomeError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "text" : "countryCode is not supported"
    },
    "diagnostics" : "Expected one of approved EU country codes in requestData.countryCode"
  }]
}

```
