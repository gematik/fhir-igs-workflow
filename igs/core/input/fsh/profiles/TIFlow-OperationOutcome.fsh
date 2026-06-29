Profile: TIFlowOperationOutcome
Parent: OperationOutcome
Id: tiflow-operation-outcome
Title: "TIFlow OperationOutcome"
Description: "OperationOutcome für Angabe von Fehlermeldungen vom TI-Flow-Fachdienst"
* insert Meta

* issue.severity MS
* issue.code MS
* issue.details 1..1 MS
* issue.details from TIFLOWOperationOutcomeDetailsVS (required)