// TODO: Validate and replace placeholder examples used by gematik-api blocks in pagecontent.

Instance: ExampleDiGAOperationRequestParameters
InstanceOf: Parameters
Usage: #example
Title: "Example request parameters for DiGA operations"
Description: "Reusable operation request payload for DiGA API documentation"
* id = "ExampleDiGAOperationRequestParameters"
* parameter[+].name = "accessCode"
* parameter[=].valueString = "AC-162-EXAMPLE-0001"
* parameter[+].name = "secret"
* parameter[=].valueString = "SECRET-DIGA-01"

Instance: ExampleDiGAOperationOutcomeError
InstanceOf: OperationOutcome
Usage: #example
Title: "Example error response for DiGA operations"
Description: "Representative business error for DiGA operation calls"
* id = "ExampleDiGAOperationOutcomeError"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.text = "Task has invalid status for requested operation"
* issue[0].diagnostics = "Expected status ready but found completed"

Instance: ExampleDiGATaskInReadyState
InstanceOf: Task
Usage: #example
Title: "DiGA Task in ready state"
* id = "ExampleDiGATaskInReadyState"
* status = #ready
* intent = #order
* authoredOn = "2026-03-20"

Instance: ExampleDiGATaskSearchset
InstanceOf: Bundle
Usage: #example
Title: "Task searchset response for DiGA"
Description: "Example response for GET /Task in DiGA workflow"
* id = "ExampleDiGATaskSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task?status=ready&_count=1"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/ExampleDiGATaskInReadyState"
* entry[=].resource = ExampleDiGATaskInReadyState
* entry[=].search.mode = #match

Instance: ExampleDiGACommunicationSearchset
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for DiGA"
Description: "Example response for GET /Communication in DiGA workflow"
* id = "ExampleDiGACommunicationSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Communication_Reply_DiGA"
* entry[=].resource = Communication_Reply_DiGA
* entry[=].search.mode = #match

Instance: ExampleDiGAMedicationDispenseSearchset
InstanceOf: Bundle
Usage: #example
Title: "MedicationDispense searchset response for DiGA"
Description: "Example response for GET /MedicationDispense in DiGA workflow"
* id = "ExampleDiGAMedicationDispenseSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/MedicationDispense?whenhandedover=ge2026-03-01"
* entry[+].fullUrl = "https://erp-ref.example.org/MedicationDispense/Example-MedicationDispense-DiGA-Name-And-PZN"
* entry[=].resource = Example-MedicationDispense-DiGA-Name-And-PZN
* entry[=].search.mode = #match
