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

/*
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
*/

Instance: ExampleDiGATaskInReadyState
InstanceOf: TIFlowDiGATask
Usage: #example
Title: "DiGA Task in ready state"
* id = "ExampleDiGATaskInReadyState"
* insert DiGA_Task(ready)
* insert GKV_Identifier(for.identifier) // Only when not draft
* insert TaskIdentifierAccessCode
* insert TaskInputReceipt(ExampleDiGABundle)
// TODO: Bug im E-Rezept-Fachdienst
* input[patientReceipt].type = $GEM_ERP_CS_DocumentType#2
* input[patientReceipt].valueReference.reference = "Bundle/ExampleDiGABundle"

Instance: ExampleDiGABundle
InstanceOf: Bundle
Usage: #example
Title: "DiGA-Verordnungs-Bundle (unvollständig)"
Description: "Unvollständiges Beispiel eines DiGA-Rezept-Bundles nach KBV_PR_EVDGA_Bundle"
//* meta.profile[0] = "$evdga-bundle|1.2"
* meta.tag.display = "Unvollständiges Beispiel eines DiGA-Rezept-Bundles - https://fhir.kbv.de/StructureDefinition/KBV_PR_EVDGA_Bundle|1.2"
* id = "ExampleDiGABundle"
* identifier.system = $prescription-id-ns
* identifier.value = "162.000.000.000.000.01"
* type = #document
* insert DateTimeStamp(timestamp)
* entry[+].fullUrl = "https://erp-ref.example.org/Composition/ExampleDiGAComposition"
* entry[=].resource = ExampleDiGAComposition

Instance: ExampleDiGAComposition
InstanceOf: Composition
Usage: #inline
* status = #final
* type.coding.system = "https://fhir.kbv.de/CodeSystem/KBV_CS_SFHIR_KBV_FORMULAR_ART"
* type.coding.code = #e16D
* date = "2026-03-01T10:00:00+01:00"
* author.display = "Verordnende Praxis"
* title = "elektronische Verordnung digitaler Gesundheitsanwendungen"

Instance: ExampleDiGABinary
InstanceOf: TIFlowDiGABinary
Usage: #inline
//* id = "b939a82a-9c23-4b6d-a139-f468d1b9d652"
* contentType = #application/octet-stream
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

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
//* entry[+].fullUrl = "https://erp-ref.example.org/Bundle/ExampleDiGABundle"
//* entry[=].resource = ExampleDiGABundle

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
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Communication-Reply-DiGA"
* entry[=].resource = Communication-Reply-DiGA
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
