Instance: ExampleRxCreateOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for Rx $create operation"
Description: "Beispiel für Eingabeparameter der Create-Operation"
* id = "ExampleRxCreateOperationRequestParameters"
* parameter[+].name = "workflowType"
* parameter[=].valueCoding[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* parameter[=].valueCoding[=].code = #160

Instance: ExampleRxActivateOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for Rx $activate operation"
Description: "Beispiel für Eingabeparameter der Activate-Operation"
* id = "ExampleRxActivateOperationRequestParameters"
* parameter[+].name = "ePrescription"
* parameter[=].valueAttachment.contentType = #application/pkcs7-mime
* parameter[=].valueAttachment.data = (base64)S1xcSEExRU5acVhFSD9TTWJ8QyNjbE5wTF1rcnMpdFRhQiw5RDdEfno1Vmg/eztUQTIpcUM=N1luR15xJ1xkb35yT1RDZlQnNVZHT3xyfA==IC4iVWlAN3xJViZRfC54ZW0kVkFCYVgjUw==UEl7XzovalZWd2s8clwqXVZJRS9FO1w6TDo=