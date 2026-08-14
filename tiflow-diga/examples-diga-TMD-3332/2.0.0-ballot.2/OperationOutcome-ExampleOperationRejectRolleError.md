# Fehler 403 - Beispiel für Reject-Operation Fehlerantwort bei Rollenprüfung - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Fehler 403 - Beispiel für Reject-Operation Fehlerantwort bei Rollenprüfung**

## Example OperationOutcome: Fehler 403 - Beispiel für Reject-Operation Fehlerantwort bei Rollenprüfung



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationRejectRolleError",
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
