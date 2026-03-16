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
* extension[baseUrl].valueString = "http://tiflow"
* insert TaskInteraction(#SHALL)
* insert ChargeItemInteraction(#SHALL)
* insert ConsentInteraction(#SHALL)
* insert CommunicationInteraction(#SHALL)
* insert AuditEventInteraction(#SHALL)
* insert WorkflowMedicationDispenseInteraction(#SHALL)
* insert DeviceInteraction(#SHALL)
* insert SubscriptionInteraction(#SHALL)
//* insert ImportCapabilityStatment("https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server", #SHALL)

RuleSet: TaskInteraction(expectation)
* insert CapSupportResource(Task, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)
* insert PatchInteractionStatusCodes

* insert CapSupportResourceSearchParamNoDefinition(authored-on, #date, {expectation}, "Task.authoredOn; default sort if _sort is not provided")
* insert CapSupportResourceSearchParamNoDefinition(status, #token, {expectation}, "Task.status")
* insert CapSupportCustomSearchParam(expiry-date, TaskExpiryDateSP, #date, {expectation}, "Task.extension:expiryDate.valueDate")
* insert CapSupportCustomSearchParam(accept-date, TaskAcceptDateSP, #date, {expectation}, "Task.extension:acceptDate.valueDate")
* insert CapSupportResourceSearchParamNoDefinition(modified, #date, {expectation}, "Task.lastModified")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported Task search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

* insert CapSupportResourceOperation(create, CreateOperation, {expectation})
* insert TaskCreateOperationStatusCodes
* insert CapSupportResourceOperation(activate, ActivateOperation, {expectation})
* insert TaskPostOperationStatusCodes
* insert CapSupportResourceOperation(accept, AcceptOperation, {expectation})
* insert TaskPostOperationStatusCodes
* insert CapSupportResourceOperation(reject, RejectOperation, {expectation})
* insert TaskNoContentOperationStatusCodes
* insert CapSupportResourceOperation(close, CloseOperation, {expectation})
* insert TaskPostOperationStatusCodes
* insert CapSupportResourceOperation(abort, AbortOperation, {expectation})
* insert TaskNoContentOperationStatusCodes
* insert CapSupportResourceOperation(dispense, DispenseOperation, {expectation})
* insert TaskPostOperationStatusCodes

RuleSet: ChargeItemInteraction(expectation)
* insert CapSupportResource(ChargeItem, {expectation})

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert CreateInteractionStatusCodes
* insert CapResourceInteraction(#update, #SHALL)
* insert UpdateInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)
* insert PatchInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert DeleteInteractionStatusCodes

* insert CapSupportResourceSearchParam(entered-date, http://hl7.org/fhir/SearchParameter/ChargeItem-enteredDate, #date, {expectation}, "ChargeItem.enteredDate; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "ChargeItem.meta.lastUpdated")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported ChargeItem search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

RuleSet: ConsentInteraction(expectation)
* insert CapSupportResource(Consent, {expectation})

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert CreateInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert DeleteInteractionStatusCodes

RuleSet: CommunicationInteraction(expectation)
* insert CapSupportResource(Communication, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_DispReq, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_Reply, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_Representative, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_DiGA, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert CreateInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert DeleteInteractionStatusCodes

* insert CapSupportResourceSearchParamNoDefinition(sent, #date, {expectation}, "Communication.sent; default sort if _sort is not provided")
* insert CapSupportResourceSearchParamNoDefinition(received, #date, {expectation}, "Communication.received")
* insert CapSupportResourceSearchParamNoDefinition(recipient, #string, {expectation}, "Communication.recipient.identifier.value")
* insert CapSupportResourceSearchParamNoDefinition(sender, #string, {expectation}, "Communication.sender.identifier.value")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported Communication search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

RuleSet: AuditEventInteraction(expectation)
* insert CapSupportResource(AuditEvent, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_AuditEvent, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParamNoDefinition(date, #date, {expectation}, "AuditEvent.recorded; default sort if _sort is not provided")
* insert CapSupportResourceSearchParamNoDefinition(entity, #string, {expectation}, "AuditEvent.entity.what.identifier.value")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported AuditEvent search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

RuleSet: WorkflowMedicationDispenseInteraction(expectation)
* insert CapSupportResource(MedicationDispense, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_MedicationDispense, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParamNoDefinition(whenhandedover, #date, {expectation}, "MedicationDispense.whenHandedOver; default sort if _sort is not provided")
* insert CapSupportResourceSearchParamNoDefinition(whenprepared, #date, {expectation}, "MedicationDispense.whenPrepared")
* insert CapSupportResourceSearchParamNoDefinition(performer, #string, {expectation}, "MedicationDispense.performer.actor.identifier.value")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported MedicationDispense search criteria")

RuleSet: DeviceInteraction(expectation)
* insert CapSupportResource(Device, {expectation})
* insert CapSupportProfile(GEM_ERP_PR_Device, {expectation})

* insert CapResourceInteraction(#search-type, {expectation})
* insert SearchTypeInteractionStatusCodes

RuleSet: SubscriptionInteraction(expectation)
* insert CapSupportResource(Subscription, {expectation})

* insert CapResourceInteraction(#search-type, {expectation})
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#create, {expectation})
* insert CreateInteractionStatusCodes

RuleSet: TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert Successful
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert Conflict
* rest.resource[=].operation[=] insert WrongStatusParameter

RuleSet: TaskCreateOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulCreated
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert Conflict
* rest.resource[=].operation[=] insert WrongStatusParameter

RuleSet: TaskNoContentOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert Conflict
* rest.resource[=].operation[=] insert WrongStatusParameter

RuleSet: CreateInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulCreated
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: DeleteInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulNoContent
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: UpdateInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: PatchInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

