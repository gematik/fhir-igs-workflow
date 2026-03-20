Instance: ERPFachdienstServerDiGA
InstanceOf: TICapabilityStatement
Usage: #definition

* id = "erp-fachdienst-server-diga"
* title = "ERP DiGA CapabilityStatement für den E-Rezept-Fachdienst"
* description = "CapabilityStatement für den E-Rezept-Fachdienst (Digitale Gesundheitsanwendungen)"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* insert Version
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server
* extension[baseUrl].valueString = $erp-base-url

* imports[+] = $cap-erp-fd
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = #SHALL

* insert TaskInteraction(#SHALL)
* insert CommunicationInteraction(#SHALL)
* insert MedicationDispenseInteraction(#SHALL)

RuleSet: TaskInteraction(expectation)
* insert CapSupportResource(Task, #SHALL)
* insert CapSupportProfileUrl(https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_Task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)
* insert PatchInteractionStatusCodes

* insert CapSupportResourceSearchParam(authored-on, http://hl7.org/fhir/SearchParameter/Task-authored-on, #date, {expectation}, "Task.authoredOn; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, {expectation}, "Task.status")
* insert CapSupportResourceSearchParam(modified, http://hl7.org/fhir/SearchParameter/Task-modified, #date, {expectation}, "Task.lastModified")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported Task search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

* insert CapSupportResourceOperation(create, $op-create, {expectation})
* insert TaskCreateOperationStatusCodes
* insert CapSupportResourceOperation(activate, $op-activate, {expectation})
* insert TaskPostOperationStatusCodes
* insert CapSupportResourceOperation(accept, $op-accept, {expectation})
* insert TaskPostOperationStatusCodes
* insert CapSupportResourceOperation(reject, $op-reject, {expectation})
* insert TaskNoContentOperationStatusCodes
* insert CapSupportResourceOperation(close, $op-close, {expectation})
* insert TaskPostOperationStatusCodes
* insert CapSupportResourceOperation(abort, $op-abort, {expectation})
* insert TaskNoContentOperationStatusCodes

RuleSet: CommunicationInteraction(expectation)
* insert CapSupportResource(Communication, #SHALL)
* insert CapSupportProfileUrl(GEM_ERP_PR_Communication_DiGA, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert CreateInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert DeleteInteractionStatusCodes

* insert CapSupportResourceSearchParam(sent, http://hl7.org/fhir/SearchParameter/Communication-sent, #date, {expectation}, "Communication.sent; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(received, http://hl7.org/fhir/SearchParameter/Communication-received, #date, {expectation}, "Communication.received")
* insert CapSupportResourceSearchParam(recipient, http://hl7.org/fhir/SearchParameter/Communication-recipient, #string, {expectation}, "Communication.recipient.identifier.value")
* insert CapSupportResourceSearchParam(sender, http://hl7.org/fhir/SearchParameter/Communication-sender, #string, {expectation}, "Communication.sender.identifier.value")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported Communication search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

RuleSet: MedicationDispenseInteraction(expectation)
* insert CapSupportResource(MedicationDispense, #SHALL)
* insert CapSupportProfileUrl(https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(whenhandedover, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover, #date, {expectation}, "MedicationDispense.whenHandedOver; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(whenprepared, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenprepared, #date, {expectation}, "MedicationDispense.whenPrepared")
* insert CapSupportResourceSearchParam(performer, http://hl7.org/fhir/SearchParameter/MedicationDispense-performer, #string, {expectation}, "MedicationDispense.performer.actor.identifier.value")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported MedicationDispense search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")
