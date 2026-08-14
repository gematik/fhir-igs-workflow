# Error 403 - Beispiel für Accept-Operation durch Rollenprüfung - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 403 - Beispiel für Accept-Operation durch Rollenprüfung**

## Example OperationOutcome: Error 403 - Beispiel für Accept-Operation durch Rollenprüfung



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAcceptRoleError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
      }],
      "text" : "\tDer Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"
    }
  }]
}

```
