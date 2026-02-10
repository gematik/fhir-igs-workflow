Extension: EFlowRxExpiryDateExtension
Id: eflow-rx-expirydate-extension
Title: "GEM ERP EX ExpiryDate"
Description: "Diese Erweiterung sollte in der Task-Ressource verwendet werden. Sie zeigt das Ablaufdatum des Rezepts an."
* insert Versioning
* . ^short = "Ablaufdatum des Rezepts"
* . ^definition = "Datum, an dem das Rezept abläuft und in der Apotheke nicht mehr eingelöst werden kann."
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only date
