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

Instance: ExampleRxAbortOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Beispiel Operation Outcome für Rx $abort Operation"
Description: "Beispiel für ein OperationOutcome, das vom Fachdienst über die $abort-Operation zurückgegeben werden könnte, wenn der aufrufende Nutzer nicht berechtigt ist, die Operation auszuführen"
* id = "ExampleRxAbortOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.coding.code = "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
* issue[0].details.coding.system = "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs"
* issue[0].details.coding.display = "Access role not allowed"
* issue[0].details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"

Instance: ExampleRxAcceptOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Beispiel Operation Outcome für Rx $accept Operation"
Description: "Beispiel für ein OperationOutcome, das vom Fachdienst über die $accept-Operation zurückgegeben werden könnte, wenn der aufrufende Nutzer nicht berechtigt ist, die Operation auszuführen"
* id = "ExampleRxAcceptOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.coding.code = "TIFLOW_AUTH_ROLE_NOT_ALLOWED"
* issue[0].details.coding.system = "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs"
* issue[0].details.coding.display = "Access role not allowed"
* issue[0].details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"