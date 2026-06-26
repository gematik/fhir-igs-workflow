Instance: ExampleOperationRejectError
InstanceOf: OperationOutcome
Title: "Beispiel für Reject-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Reject-Operation wegen falschen Task-Status"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.text = "Task not in status in progress, is: ready"

 Instance: ExampleOperationRejectRolleError
InstanceOf: OperationOutcome
Title: "Fehler 403 - Beispiel für Reject-Operation Fehlerantwort bei Rollenprüfung"
Description: "Beispiel für eine Fehlerantwort bei der Reject-Operation bei Rollenprüfung"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details-coding.code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * details.text = "	Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"