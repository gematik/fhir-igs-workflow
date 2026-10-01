Instance: ExampleOperationAcceptError
InstanceOf: TIFlowOperationOutcome
Title: "Error 409 - Beispiel für Accept-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $cs-tiflow-oo-details
  * details.coding.code = #TIFLOW_TASK_STATUS_MISMATCH
  * details.text = "Task has invalid status draft"


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