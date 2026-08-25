# Error 403 - Beispiel für Dispense-Operation durch Rollenprüfung - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 403 - Beispiel für Dispense-Operation durch Rollenprüfung**

## Example OperationOutcome: Error 403 - Beispiel für Dispense-Operation durch Rollenprüfung



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationDispenseRoleError",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/tiflow/CodeSystem/tiflow-operation-outcome-details-cs",
        "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
      }],
      "text" : "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"
    }
  }]
}

```
