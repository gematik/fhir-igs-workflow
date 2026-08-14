// TODO: Validate and replace placeholder examples used by gematik-api blocks in pagecontent.

Instance: ExampleERPEUOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Example error response for ERP-EU operations"
Description: "Representative validation error for EU access operation input"
* id = "ExampleERPEUOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.text = "countryCode is not supported"
* issue[0].diagnostics = "Expected one of approved EU country codes in requestData.countryCode"
