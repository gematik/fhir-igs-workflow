Instance: ExampleOperationAcceptError
InstanceOf: OperationOutcome
Title: "Error 409 - Beispiel für Accept-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.code = #TIFLOW_TASK_STATUS_MISMATCH
  * details.text = "Task has invalid status draft"

Instance: ExampleOperationAcceptRoleError
InstanceOf: OperationOutcome
Title: "Error 403 - Beispiel für Accept-Operation durch Rollenprüfung"
Description: "Beispiel für eine Fehlerantwort Rollenprüfung bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"

Instance: ExampleDiGAAcceptResponse
InstanceOf: Bundle
Usage: #example
Title: "$accept response for DiGA"
Description: "Example response for $accept in DiGA workflow"
* id = "ExampleDiGAAcceptResponse"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/162.000.000.000.000.01/$accept"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/ExampleDiGATaskInReadyState"
* entry[=].resource = ExampleDiGATaskInReadyState
* entry[+].fullUrl = "https://erp-ref.example.org/Binary/ExampleDiGABinary"
* entry[=].resource = ExampleDiGABinary