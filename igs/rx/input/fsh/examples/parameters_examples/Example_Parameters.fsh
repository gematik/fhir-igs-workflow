Instance: ExampleRxCreateOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for Rx $create operation"
Description: "Beispiel für Eingabeparameter der Create-Operation"
* id = "ExampleRxCreateOperationRequestParameters"
* parameter[+].name = "workflowType"
* parameter[=].valueCoding[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* parameter[=].valueCoding[=].code = "160"

Instance: ExampleRxActivateOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for Rx $activate operation"
Description: "Beispiel für Eingabeparameter der Activate-Operation"
* id = "ExampleRxActivateOperationRequestParameters"
* parameter[+].name = "ePrescription"
* parameter[=].resource.contentType = "application/pkcs7-mime"
* parameter[=].resource.data = "MIJTfQYJKoZIhvcNAQcCoIJTbjCCU2oCAQUxDzANBglghkgBZQMEAg..."