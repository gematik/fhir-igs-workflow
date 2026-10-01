Instance: ExampleOperationRejectError
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 412 - Beispiel für Reject-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Reject-Operation wegen falschen Task-Status"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_TASK_STATUS_MISMATCH
  * details.text = "Task has invalid status."
