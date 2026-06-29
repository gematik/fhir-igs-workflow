// TODO: Validate and replace placeholder examples used by gematik-api blocks in pagecontent.

Instance: ExampleRxOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for Rx operations"
Description: "Reusable example request payload for operation documentation in the Rx IG"
* id = "ExampleRxOperationRequestParameters"
* parameter[+].name = "accessCode"
* parameter[=].valueString = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* parameter[+].name = "secret"
* parameter[=].valueString = "A1B2C3D4E5"

Instance: ExampleRxOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Example error response for Rx operations"
Description: "Representative error response for invalid task status during operation invocation"
* id = "ExampleRxOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #conflict
* issue[0].details.text = "Task has invalid status draft"
* issue[0].diagnostics = "Operation requires Task status ready or in-progress"

Instance: ExampleRxTaskInReadyState
InstanceOf: Task
Usage: #example
Title: "Rx Task in ready state"
* id = "ExampleRxTaskInReadyState"
* status = #ready
* intent = #order
* authoredOn = "2026-03-20"

Instance: ExampleRxCommunicationDispReq
InstanceOf: Communication
Usage: #example
Title: "Rx Communication request example"
* id = "ExampleRxCommunicationDispReq"
* status = #unknown
* sent = "2026-03-20T10:15:00+01:00"
* payload[+].contentString = "Bitte Rezept in Filiale bereitstellen"

Instance: ExampleRxMedicationDispense
InstanceOf: MedicationDispense
Usage: #example
Title: "Rx MedicationDispense example"
* id = "ExampleRxMedicationDispense"
* status = #completed
* medicationCodeableConcept.text = "Sumatriptan 50 mg"
* subject.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* subject.identifier.value = "X123456789"
* whenHandedOver = "2026-03-20T11:10:00+01:00"

Instance: ExampleRxTaskSearchset
InstanceOf: Bundle
Usage: #example
Title: "Task searchset response for Rx"
Description: "Example response for GET /Task"
* id = "ExampleRxTaskSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task?status=ready&_count=1"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/ExampleRxTaskInReadyState"
* entry[=].resource = ExampleRxTaskInReadyState
* entry[=].search.mode = #match

Instance: ExampleRxCommunicationSearchset
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for Rx"
Description: "Example response for GET /Communication"
* id = "ExampleRxCommunicationSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/ExampleRxCommunicationDispReq"
* entry[=].resource = ExampleRxCommunicationDispReq
* entry[=].search.mode = #match

Instance: ExampleRxMedicationDispenseSearchset
InstanceOf: Bundle
Usage: #example
Title: "MedicationDispense searchset response for Rx"
Description: "Example response for GET /MedicationDispense"
* id = "ExampleRxMedicationDispenseSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/MedicationDispense?whenhandedover=ge2026-03-01"
* entry[+].fullUrl = "https://erp-ref.example.org/MedicationDispense/ExampleRxMedicationDispense"
* entry[=].resource = ExampleRxMedicationDispense
* entry[=].search.mode = #match
