Instance: ExampleOperationEUCloseError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - Example EU Close operation error response"
Description: "Beispiel einer Fehlerantwort der $eu-close-Operation bei fehlgeschlagener Profilvalidierung"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $ti-oo
  * details.coding.code = #SVC_VALIDATION_FAILED
  * details.text = "FHIR Profile Validation Failed"