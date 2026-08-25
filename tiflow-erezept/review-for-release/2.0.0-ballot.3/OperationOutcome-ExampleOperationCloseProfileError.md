# Error 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense - Implementation Guide TIFlow - Verordnungen für Arzneimittel v2.0.0-ballot.3

Implementation Guide

TIFlow - Verordnungen für Arzneimittel

Version 2.0.0-ballot.3 - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Error 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense**

## Example OperationOutcome: Error 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCloseProfileError",
  "meta" : {
    "profile" : ["https://gematik.de/fhir/tiflow/StructureDefinition/tiflow-operation-outcome"]
  },
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "system" : "https://gematik.de/fhir/tiflow/CodeSystem/tiflow-operation-outcome-details-cs",
        "code" : "TIFLOW_MEDICATION_DISPENSE_INVALID"
      }],
      "text" : "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig."
    }
  }]
}

```
