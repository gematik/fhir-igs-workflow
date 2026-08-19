Instance: ExampleOperationRejectError
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 412 - Beispiel für Reject-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Reject-Operation wegen falschen Task-Status"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $cs-tiflow-oo-details
  * details.coding.code = #TIFLOW_TASK_STATUS_MISMATCH
  * details.text = "Task has invalid status."

 Instance: ExampleOperationRejectRolleError
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 403 - Beispiel für Reject-Operation Fehlerantwort bei Rollenprüfung"
Description: "Beispiel für eine Fehlerantwort bei der Reject-Operation bei Rollenprüfung"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $cs-tiflow-oo-details
  * details.coding.code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * details.text = "	Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"