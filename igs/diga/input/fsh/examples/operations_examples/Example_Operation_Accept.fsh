Instance: ExampleOperationAcceptError
InstanceOf: OperationOutcome
Title: "Beispiel für Accept-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Accept-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #conflict
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
  * details.text = "	Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"