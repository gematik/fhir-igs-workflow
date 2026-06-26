# Beispiel Operation Outcome für Rx $accept Operation - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.2 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel Operation Outcome für Rx $accept Operation**

## Example OperationOutcome: Beispiel Operation Outcome für Rx $accept Operation



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleRxAcceptOperationOutcomeError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs",
        "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED",
        "display" : "Access role not allowed"
      }],
      "text" : "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"
    }
  }]
}

```
