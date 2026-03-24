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
* insert TaskSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert TaskReadInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)
* insert TaskPatchInteractionStatusCodes

* insert CapSupportResourceSearchParam(authored-on, http://hl7.org/fhir/SearchParameter/Task-authored-on, #date, {expectation}, "Task.authoredOn - Unterstützt die Suche nach dem Erstellungsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, {expectation}, "Task.status - Unterstützt die Suche nach dem Status einer Task")
* insert CapSupportResourceSearchParam(modified, http://hl7.org/fhir/SearchParameter/Task-modified, #date, {expectation}, "Task.lastModified - Unterstützt die Suche nach dem zuletzt modifizierten Datum")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten Task-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

* insert CapSupportResourceOperation(create, $op-create, {expectation}, "Creates a Task for a specific flow type")
* insert TaskCreateOperationStatusCodes
* insert CapSupportResourceOperation(activate, $op-activate, {expectation}, "Activates the created Task using the signed ePrescription bundle")
* insert TaskActivateOperationStatusCodes
* insert CapSupportResourceOperation(accept, $op-accept, {expectation}, "Pharmacy claims an ePrescription and sets Task status to in-progress")
* insert TaskAcceptOperationStatusCodes
* insert CapSupportResourceOperation(reject, $op-reject, {expectation}, "Rejects dispensing and resets Task status to active")
* insert TaskRejectOperationStatusCodes
* insert CapSupportResourceOperation(close, $op-close, {expectation}, "Finishes the ePrescription workflow and sets Task status to completed")
* insert TaskCloseOperationStatusCodes
* insert CapSupportResourceOperation(abort, $op-abort, {expectation}, "Aborts the ePrescription workflow and deletes Task related data")
* insert TaskAbortOperationStatusCodes

RuleSet: CommunicationInteraction(expectation)
* insert CapSupportResource(Communication, #SHALL)
* insert CapSupportProfileUrl(GEM_ERP_PR_Communication_DiGA, #SHALL)

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

RuleSet: MedicationDispenseInteraction(expectation)
* insert CapSupportResource(MedicationDispense, #SHALL)
* insert CapSupportProfileUrl(https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_PR_MedicationDispense_DiGA, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert MedicationDispenseSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert MedicationDispenseReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(whenhandedover, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover, #date, {expectation}, "MedicationDispense.whenHandedOver - Unterstützt die Suche nach dem Abgabedatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(whenprepared, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenprepared, #date, {expectation}, "MedicationDispense.whenPrepared - Unterstützt die Suche nach dem Herstellungsdatum")
* insert CapSupportResourceSearchParam(performer, http://hl7.org/fhir/SearchParameter/MedicationDispense-performer, #string, {expectation}, "MedicationDispense.performer.actor.identifier.value - Unterstützt die Suche einer MedicationDispense zu einer Abgebenden LEI.")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten MedicationDispense-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")
