Instance: ERPFachdienstServer
InstanceOf: GEM_ERP_PR_CapabilityStatement
Usage: #definition
* insert Meta-Instance
//TODO: Rename from ERP -> TI Flow
//TODO: Authorization Header, wie auch immer er aussieht
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
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server
* extension[baseUrl].valueString = "http://tiflow"

//Header
* insert X-erp-user(true)
* insert X-erp-resource(true)
* insert Content-Type(true)
* insert Authorization(true)

//Ressourcen
* insert TaskInteraction(#SHALL)
* insert ChargeItemInteraction(#SHALL)
* insert ConsentInteraction(#SHALL)
* insert CommunicationInteraction(#SHALL)
* insert AuditEventInteraction(#SHALL)
* insert MedicationDispenseInteraction(#SHALL)
* insert DeviceInteraction(#SHALL)
* insert SubscriptionInteraction(#SHALL)
//* insert ImportCapabilityStatment("https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server", #SHALL)

RuleSet: TaskInteraction(expectation)
* insert CapSupportResource(Task, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert TaskSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert TaskReadInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)
* insert TaskPatchInteractionStatusCodes

* insert CapSupportResourceSearchParam(authored-on, http://hl7.org/fhir/SearchParameter/Task-authored-on, #date, {expectation}, "Task.authoredOn - Unterstützt die Suche nach dem Erstellungsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, {expectation}, "Task.status - Unterstützt die Suche nach dem Status einer Task")
* insert CapSupportCustomSearchParam(expiry-date, TaskExpiryDateSP, #date, {expectation}, "Task.extension:expiryDate.valueDate - Unterstützt die Suche nach dem Verfallsdatum")
* insert CapSupportCustomSearchParam(accept-date, TaskAcceptDateSP, #date, {expectation}, "Task.extension:acceptDate.valueDate - Unterstützt die Suche nach dem Akzeptanzdatum")
* insert CapSupportResourceSearchParam(modified, http://hl7.org/fhir/SearchParameter/Task-modified, #date, {expectation}, "Task.lastModified - Unterstützt die Suche nach dem zuletzt modifizierten Datum")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten Task-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

* insert CapSupportResourceOperation(create, CreateOperation, {expectation}, "Creates a Task for a specific flow type")
* insert TaskCreateOperationStatusCodes
* insert CapSupportResourceOperation(activate, ActivateOperation, {expectation}, "Activates the created Task using the signed ePrescription bundle")
* insert TaskActivateOperationStatusCodes
* insert CapSupportResourceOperation(accept, AcceptOperation, {expectation}, "Pharmacy claims an ePrescription and sets Task status to in-progress")
* insert TaskAcceptOperationStatusCodes
* insert CapSupportResourceOperation(reject, RejectOperation, {expectation}, "Rejects dispensing and resets Task status to active")
* insert TaskRejectOperationStatusCodes
* insert CapSupportResourceOperation(close, CloseOperation, {expectation}, "Finishes the ePrescription workflow and sets Task status to completed")
* insert TaskCloseOperationStatusCodes
* insert CapSupportResourceOperation(abort, AbortOperation, {expectation}, "Aborts the ePrescription workflow and deletes Task related data")
* insert TaskAbortOperationStatusCodes
* insert CapSupportResourceOperation(dispense, DispenseOperation, {expectation}, "Documents medication dispensation without changing Task status")
* insert TaskDispenseOperationStatusCodes

RuleSet: ChargeItemInteraction(expectation)
* insert CapSupportResource(ChargeItem, {expectation})

* insert CapResourceInteraction(#search-type, #SHALL)
* insert ChargeItemSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ChargeItemReadInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert ChargeItemCreateInteractionStatusCodes
* insert CapResourceInteraction(#update, #SHALL)
* insert ChargeItemUpdateInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)
* insert ChargeItemPatchInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert ChargeItemDeleteInteractionStatusCodes

* insert CapSupportResourceSearchParam(entered-date, http://hl7.org/fhir/SearchParameter/ChargeItem-entered-date, #date, {expectation}, "ChargeItem.enteredDate - Unterstützt die Suche nach dem Eingangsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "ChargeItem.meta.lastUpdated - Unterstützt die Suche nach dem zuletzt aktualisierten Datum")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten ChargeItem-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

RuleSet: ConsentInteraction(expectation)
* insert CapSupportResource(Consent, {expectation})

* insert CapResourceInteraction(#search-type, #SHALL)
* insert ConsentSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert ConsentCreateInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert ConsentDeleteInteractionStatusCodes

* insert CapSupportResourceSearchParam(category, http://hl7.org/fhir/SearchParameter/Consent-category, #token, {expectation}, "Consent.category - Unterstützt die Suche nach der Art der Einwilligung")

RuleSet: CommunicationInteraction(expectation)
* insert CapSupportResource(Communication, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_DispReq, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_Reply, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_Communication_Representative, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert CommunicationSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert CommunicationReadInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert CommunicationCreateInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert CommunicationDeleteInteractionStatusCodes

* insert CapSupportResourceSearchParam(sent, http://hl7.org/fhir/SearchParameter/Communication-sent, #date, {expectation}, "Communication.sent - Unterstützt die Suche nach dem Sendedatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(received, http://hl7.org/fhir/SearchParameter/Communication-received, #date, {expectation}, "Communication.received - Unterstützt die Suche nach dem Empfangsdatum")
* insert CapSupportResourceSearchParam(recipient, http://hl7.org/fhir/SearchParameter/Communication-recipient, #string, {expectation}, "Communication.recipient.identifier.value - Unterstützt die Suche nach dem Empfänger einer Nachricht")
* insert CapSupportResourceSearchParam(sender, http://hl7.org/fhir/SearchParameter/Communication-sender, #string, {expectation}, "Communication.sender.identifier.value - Unterstützt die Suche nach dem Absender einer Nachricht")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten Communication-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

RuleSet: AuditEventInteraction(expectation)
* insert CapSupportResource(AuditEvent, #SHALL)
* insert CapSupportProfile(GEM_ERP_PR_AuditEvent, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert AuditEventSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert AuditEventReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(date, http://hl7.org/fhir/SearchParameter/AuditEvent-date, #date, {expectation}, "AuditEvent.recorded - Unterstützt die Suche nach dem Aufzeichnungsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(entity, http://hl7.org/fhir/SearchParameter/AuditEvent-entity, #string, {expectation}, "AuditEvent.entity.what.identifier.value - Unterstützt die Suche nach betroffenen Entitäten")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten AuditEvent-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

RuleSet: MedicationDispenseInteraction(expectation)
* insert CapSupportResource(MedicationDispense, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert MedicationDispenseSearchTypeInteractionStatusCodes

* insert CapSupportResourceSearchParam(whenhandedover, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover, #date, {expectation}, "MedicationDispense.whenHandedOver - Unterstützt die Suche nach dem Abgabedatum")
* insert CapSupportResourceSearchParam(whenprepared, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenprepared, #date, {expectation}, "MedicationDispense.whenPrepared - Unterstützt die Suche nach dem Herstellungsdatum")
* insert CapSupportResourceSearchParam(performer, http://hl7.org/fhir/SearchParameter/MedicationDispense-performer, #string, {expectation}, "MedicationDispense.performer.actor.identifier.value - Unterstützt die Suche einer MedicationDispense zu einer Abgebenden LEI.")
* insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/MedicationDispense-identifier, #token, {expectation}, "MedicationDispense.identifier - Unterstützt die Suche nach einer MedicationDispense zu einem E-Rezept.")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten MedicationDispense-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

RuleSet: DeviceInteraction(expectation)
* insert CapSupportResource(Device, {expectation})
* insert CapSupportProfile(GEM_ERP_PR_Device, {expectation})

* insert CapResourceInteraction(#search-type, {expectation})
* insert DeviceSearchTypeInteractionStatusCodes

RuleSet: SubscriptionInteraction(expectation)
* insert CapSupportResource(Subscription, {expectation})

* insert CapResourceInteraction(#search-type, {expectation})
* insert SubscriptionSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#create, {expectation})
* insert SubscriptionCreateInteractionStatusCodes
