Instance: ERPFachdienstServer
InstanceOf: TICapabilityStatement
Usage: #definition
* insert Meta-Instance

* id = "erp-fachdienst-server"
* name = "ERPFachdienstServer"
* title = "ERP CapabilityStatement für den E-Rezept-Fachdienst"
* description = "ERP CapabilityStatement für den E-Rezept-Fachdienst"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server
* extension[baseUrl].valueString = "http://todo"

* insert CapSupportResource(Task, #SHALL)
* insert CapSupportResourceOperation(createOperation, CreateOperation, #SHALL)
* insert CapSupportResourceOperation(activateOperation, ActivateOperation, #SHALL)
* insert CapSupportResourceOperation(abortOperation, AbortOperation, #SHALL)
* insert CapSupportResourceOperation(acceptOperation, AcceptOperation, #SHALL)
* insert CapSupportResourceOperation(closeOperation, CloseOperation, #SHALL)
* insert CapSupportResourceOperation(dispenseOperation, DispenseOperation, #SHALL)
* insert CapSupportResourceOperation(rejectOperation, RejectOperation, #SHALL)

* insert MedicationInteraction(#SHALL)
* insert MedicationRequestInteraction(#SHALL)
* insert MedicationDispenseInteraction(#SHALL)
* insert MedicationStatementInteraction(#SHALL)
* insert OrganizationInteraction(#SHALL)
* insert PractitionerInteraction(#SHALL)
* insert PractitionerRoleInteraction(#SHALL)
* insert ProvenanceInteraction(#SHALL)

