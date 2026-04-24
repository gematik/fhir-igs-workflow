Instance: PrescriptionBinary
InstanceOf: Binary
Title: "Binary einer Verschreibung (QES)"
Description: "Beispiel für binäre Daten einer elektronischen Verschreibung im PKCS#7-Format"
Usage: #inline
* contentType = #application/pkcs7-mime
* data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="

Instance: ExampleOperationActivateParametersInput
InstanceOf: Parameters
Title: "Example Activate operation input parameters"
Usage: #example
* parameter[+].name = "ePrescription"
* parameter[=].resource = PrescriptionBinary

Instance: ExampleOperationActivateError
InstanceOf: OperationOutcome
Title: "Example Activate operation error response"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "unknown or unexpected profile"
  * diagnostics = "Unable to determine profile type from name: https://fhir.kbv.de/StructureDefinition/KBV_PR_ERP_Bundle"