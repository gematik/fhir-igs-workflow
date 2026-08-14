# Fehler 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense - Implementation Guide TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA) v2.0.0-ballot.2

Implementation Guide

TIFlow - Verordnungen für Digitale Gesundheitsanwendungen (DiGA)

Version 2.0.0-ballot.2 - ballot 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **Fehler 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense**

## Example OperationOutcome: Fehler 400 - Beispiel für Close-Operation Fehlerantwort bei Profilprüfung MedicationDispense



## Resource Content

```json
{
  "resourceType" : "OperationOutcome",
  "id" : "ExampleOperationCloseProfileError",
  "issue" : [{
    "severity" : "error",
    "code" : "invalid",
    "details" : {
      "coding" : [{
        "code" : "TIFLOW_MEDICATION_DISPENSE_INVALID"
      }],
      "text" : "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig."
    }
  }]
}

```
