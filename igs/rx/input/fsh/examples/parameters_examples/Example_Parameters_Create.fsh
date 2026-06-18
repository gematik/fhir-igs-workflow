Instance: ExampleRxCreateOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for Rx operations"
Description: "Beispiel für Eingabeparameter der Create-Operation"
* id = "ExampleRxOperationRequestParameters"
* parameter[+].name = "workflowType"
* parameter[=].valueCoding[+].system = "https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType"
* parameter[=].valueCoding[=].code = "160"