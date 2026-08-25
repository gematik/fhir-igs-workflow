Instance: ExampleOperationAcceptError
InstanceOf: TIFlowOperationOutcome
Title: "Error 409 - Beispiel für Accept-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_TASK_STATUS_MISMATCH
  * details.text = "Task has invalid status draft"

Instance: ExampleOperationAcceptRoleError
InstanceOf: TIFlowOperationOutcome
Title: "Error 403 - Beispiel für Accept-Operation durch Rollenprüfung"
Description: "Beispiel für eine Fehlerantwort Rollenprüfung bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"

Instance: ExampleRXAcceptResponse
InstanceOf: Bundle
Usage: #example
Title: "$accept response for RX"
Description: "Example response for $accept in RX workflow"
* id = "ExampleRXAcceptResponse"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/162.000.000.000.000.01/$accept"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/TaskInReadyState"
* entry[=].resource = TaskInReadyState
* entry[+].fullUrl = "https://erp-ref.example.org/Binary/PrescriptionBinaryWithMeta"
* entry[=].resource = PrescriptionBinaryWithMeta