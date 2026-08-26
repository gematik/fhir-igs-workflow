Instance: ExampleOperationActivateParametersInput
InstanceOf: Parameters
Title: "Example Activate operation input parameters"
Description: "Beispiel der Eingabeparameter für die $activate-Operation im RX-Workflow"
Usage: #example
* parameter[+].name = "ePrescription"
* parameter[=].resource = PrescriptionBinaryWithMeta

Instance: ExampleOperationActivateInvalidRoleError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - QES nicht valide; Example Activate operation error response"
Description: "Beispiel einer Fehlerantwort der $activate-Operation bei ungültiger Signatur"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_SIGNATURE_INVALID

Instance: ExampleOperationActivateError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - Example Activate operation error response"
Description: "Beispiel einer Fehlerantwort der $activate-Operation bei fehlgeschlagener Profilvalidierung"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $ti-oo
  * details.coding.code = #SVC_VALIDATION_FAILED
  * details.text = "FHIR Profile Validation Failed"
  * diagnostics = "Unable to determine profile type from name: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"