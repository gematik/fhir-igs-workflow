Instance: ExampleOperationAbortErrorAVS
InstanceOf: TIFlowOperationOutcome
Title: "Beispiel für Abort-Operation Fehlerantwort (403)"
Description: "Beispiel für eine Fehlerantwort bei der Abort-Operation"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.coding.system = $cs-ti-oo-details
  * details.coding.code = #SVC_IDENTITY_MISMATCH
  * details.text = "Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)"

Instance: ExampleOperationAbortErrorPVS
InstanceOf: TIFlowOperationOutcome
Title: "Beispiel für Abort-Operation Fehlerantwort (412)"
Description: "Beispiel für eine Fehlerantwort bei der Abort-Operation"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.coding.system = $cs-tiflow-oo-details
  * details.coding.code = #TIFLOW_TASK_STATUS_MISMATCH
  * details.text = "Task has invalid status."

