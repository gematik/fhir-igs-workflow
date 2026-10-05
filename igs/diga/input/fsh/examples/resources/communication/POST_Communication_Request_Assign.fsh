Instance: Example-POST-Communication-Request-Assign
InstanceOf: Communication
Title: "DiGA-Verordnung dem Kostenträger zuweisen"
Description: "Versicherter sendet eine Communication mit AccessCode zur Anforderung der DiGA-Abgabe an den Kostenträger (WorkflowType '162'), ohne JSON-Payload, nur mit E-Rezept-Token"
Usage: #example
* meta.profile[0] = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Communication_DispReq"
* extension[0].url = $cs-prescription-type
* extension[0].valueCoding = $cs-flowtype#160
* status = #unknown
* basedOn.reference = "Task/Example-DiGA-Task-Ready"
* insert KTRTelematik_Identifier(recipient.identifier)