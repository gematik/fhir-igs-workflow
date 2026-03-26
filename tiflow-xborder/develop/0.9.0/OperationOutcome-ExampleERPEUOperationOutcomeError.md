# Example error response for ERP-EU operations - TIFlow - Grenzüberschreitender Datenaustausch v0.9.0

TIFlow - Grenzüberschreitender Datenaustausch

Version 0.9.0 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Example error response for ERP-EU operations**

## Example OperationOutcome: Example error response for ERP-EU operations

### Issues

| | | | | |
| :--- | :--- | :--- | :--- | :--- |
| - | **Severity** | **Code** | **Details** | **Diagnostics** |
| * | Error | Invalid Content | countryCode is not supported | Expected one of approved EU country codes in requestData.countryCode |



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
