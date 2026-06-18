Instance: ExampleRxCreateOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Beispiel Operation Outcome für Rx $create Operation"
Description: "Beispiel für ein OperationOutcome, das vom Fachdienst über die $create-Operation zurückgegeben werden könnte, wenn die Validierung der Eingabeparameter fehlschlägt"
* id = "ExampleRxCreateOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.coding.code = "SVC_VALIDATION_FAILED"
* issue[0].details.coding.system = "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes"

Instance: ExampleRxActivateOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Beispiel Operation Outcome für Rx $activate Operation"
Description: "Beispiel für ein OperationOutcome, das vom Fachdienst über die $activate-Operation zurückgegeben werden könnte, wenn die Validierung der Eingabeparameter fehlschlägt"
* id = "ExampleRxActivateOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.coding.code = "SVC_VALIDATION_FAILED"
* issue[0].details.coding.system = "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes"