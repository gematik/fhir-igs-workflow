Profile: TIFLOWOperationOutcome
Parent: OperationOutcome
Id: tiflow-operation-outcome
Title: "TIFLOW OperationOutcome"
Description: "OperationOutcome für Angabe von Fehlermeldungen vom TI-Flow-Fachdienst"
* insert Profile(TIFLOWOperationOutcome)

* issue.severity MS
* issue.code MS
* issue.details 1..1 MS
* issue.details from TIFLOWOperationOutcomeDetailsVS (required)