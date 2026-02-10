Profile: EFlowRxOperationOutcome
Parent: OperationOutcome
Id: eflow-rx-operationoutcome
Title: "GEM ERP PR OperationOutcome"
Description: "OperationOutcome für Angabe von Fehlermeldungen vom E-Rezept-Fachdienst"
* insert Versioning

* issue.severity MS
* issue.code MS
* issue.details 1..1 MS
* issue.details from GEM_ERP_VS_OperationOutcomeDetails