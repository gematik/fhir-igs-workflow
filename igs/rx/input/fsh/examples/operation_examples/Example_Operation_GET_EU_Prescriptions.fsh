Instance: ExampleGetEUPrescriptionBundle
InstanceOf: Bundle
Usage: #example
* insert DateTimeStamp(timestamp)
* type = #collection
* link[+]
  * relation = "self"
  * url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Prescription"
* entry[0].fullUrl = "https://erp.zentral.erp.splitdns.ti-dienste.de/Bundle/ExampleERPBundle"
* entry[=].resource = ExampleERPBundle

Instance: ExampleOperationGetEUError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - Example EU Get Prescriptions operation error response"
Description: "Beispiel einer Fehlerantwort der $get-eu-prescriptions-Operation bei fehlgeschlagener Profilvalidierung"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $ti-oo
  * details.coding.code = #SVC_VALIDATION_FAILED
  * details.text = "FHIR Profile Validation Failed"