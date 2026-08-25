# Beispiel für Abort-Operation Fehlerantwort (403) - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Beispiel für Abort-Operation Fehlerantwort (403)**

## Example OperationOutcome: Beispiel für Abort-Operation Fehlerantwort (403)



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationAbortErrorAVS",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "forbidden",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes",
        "code" : "SVC_IDENTITY_MISMATCH"
      }],
      "text" : "Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)"
    }
  }]
}

```
