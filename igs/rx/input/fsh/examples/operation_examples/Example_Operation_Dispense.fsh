Instance: ExampleOperationDispenseRoleError
InstanceOf: TIFlowOperationOutcome
Title: "Error 403 - Beispiel für Dispense-Operation durch Rollenprüfung"
Description: "Beispiel für eine Fehlerantwort Rollenprüfung bei der Dispense-Operation eines E-Rezepts"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"