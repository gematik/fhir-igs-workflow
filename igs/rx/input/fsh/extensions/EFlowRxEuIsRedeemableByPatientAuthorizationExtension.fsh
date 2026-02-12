Extension: EFlowRxEuIsRedeemableByPatientAuthorizationExtension
Id: eflow-rx-eu-is-redeemable-by-patient-authorization-extension
Title: "GEM ERP EX EU IS REDEEMABLE BY PATIENT AUTHORIZATION"
Description: "Extension zur Angabe des Nutzers, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht."
Context: Task, Extension
* insert Meta
* . ^short = "Einlösbares EU-E-Rezept durch Patientenautorisierung"
* . ^definition = "Diese Flagge wird vom Benutzer gesetzt, um anzugeben, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht."
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^short = "Sollte in EU eingelöst werden Flagge"
* valueBoolean ^definition = "Diese Flagge wird vom Benutzer gesetzt, um anzugeben, ob das E-Rezept in der EU zur Einlösung verfügbar sein soll oder nicht."
