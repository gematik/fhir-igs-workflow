Instance: ERP-TPrescription-OperationOutcome-1
InstanceOf: OperationOutcome
Usage: #example
Title: "Fehlermeldung BfArM Webdienst"
Description: "Beispielhafte Fehlermeldung des BfArM Webdienstes bei einem invaliden digitalen Durchschlag"
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "Invalid request payload"
  * expression = "parameter[rxPrescription].part[prescriptionId].value"
  * diagnostics = "This field is required"

* issue[+]
  * severity = #error
  * code = #value
  * details.text = "Invalid format for field"
  * expression = "parameter[rxPrescription].part[medicationRequest].resource.authoredOn"
  * diagnostics = "Value must be a date"