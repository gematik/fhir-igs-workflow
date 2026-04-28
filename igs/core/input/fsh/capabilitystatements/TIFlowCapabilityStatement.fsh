Instance: TIFlowFachdienstServer
InstanceOf: TICapabilityStatement
Usage: #definition
* insert Meta-Instance
* id = "ti-flow-fachdienst-server"
* name = "TIFlowFachdienstServer"
* title = "CapabilityStatement für den TI-Flow-Fachdienst"
* description = "CapabilityStatement für den TI-Flow-Fachdienst"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* kind = #requirements
* rest.mode = #server

//Header
* insert Content-Type(true)
* insert Authorization(true)

//Ressourcen
* insert DeviceInteraction(#SHALL)
* insert AuditEventInteraction(#SHALL)

// Move to ChargeItem
// RuleSet: ChargeItemInteraction(expectation)
// * insert CapSupportResource(ChargeItem, {expectation})

// * insert CapResourceInteraction(#search-type, #SHALL)
// * insert ChargeItemSearchTypeInteractionStatusCodes
// * insert CapResourceInteraction(#read, #SHALL)
// * insert ChargeItemReadInteractionStatusCodes
// * insert CapResourceInteraction(#create, #SHALL)
// * insert ChargeItemCreateInteractionStatusCodes
// * insert CapResourceInteraction(#update, #SHALL)
// * insert ChargeItemUpdateInteractionStatusCodes
// * insert CapResourceInteraction(#patch, #SHALL)
// * insert ChargeItemPatchInteractionStatusCodes
// * insert CapResourceInteraction(#delete, #SHALL)
// * insert ChargeItemDeleteInteractionStatusCodes

// * insert CapSupportResourceSearchParam(entered-date, http://hl7.org/fhir/SearchParameter/ChargeItem-entered-date, #date, {expectation}, "ChargeItem.enteredDate - Unterstützt die Suche nach dem Eingangsdatum; default sort if _sort is not provided")
// * insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "ChargeItem.meta.lastUpdated - Unterstützt die Suche nach dem zuletzt aktualisierten Datum")
// * insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten ChargeItem-Suchkriterien")
// * insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
// * insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

// Abrechnung: Move to chrg und erp-eu
// RuleSet: ConsentInteraction(expectation)
// * insert CapSupportResource(Consent, {expectation})

// * insert CapResourceInteraction(#search-type, #SHALL)
// * insert ConsentSearchTypeInteractionStatusCodes
// * insert CapResourceInteraction(#create, #SHALL)
// * insert ConsentCreateInteractionStatusCodes
// * insert CapResourceInteraction(#delete, #SHALL)
// * insert ConsentDeleteInteractionStatusCodes

// * insert CapSupportResourceSearchParam(category, http://hl7.org/fhir/SearchParameter/Consent-category, #token, {expectation}, "Consent.category - Unterstützt die Suche nach der Art der Einwilligung")

// RuleSet: MedicationDispenseInteraction(expectation)
// * insert CapSupportResource(MedicationDispense, #SHALL)

// * insert CapResourceInteraction(#search-type, #SHALL)
// * insert MedicationDispenseSearchTypeInteractionStatusCodes

// * insert CapSupportResourceSearchParam(whenhandedover, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenhandedover, #date, {expectation}, "MedicationDispense.whenHandedOver - Unterstützt die Suche nach dem Abgabedatum")
// * insert CapSupportResourceSearchParam(whenprepared, http://hl7.org/fhir/SearchParameter/MedicationDispense-whenprepared, #date, {expectation}, "MedicationDispense.whenPrepared - Unterstützt die Suche nach dem Herstellungsdatum")
// * insert CapSupportResourceSearchParam(performer, http://hl7.org/fhir/SearchParameter/MedicationDispense-performer, #string, {expectation}, "MedicationDispense.performer.actor.identifier.value - Unterstützt die Suche einer MedicationDispense zu einer Abgebenden LEI.")
// * insert CapSupportResourceSearchParam(identifier, http://hl7.org/fhir/SearchParameter/MedicationDispense-identifier, #token, {expectation}, "MedicationDispense.identifier - Unterstützt die Suche nach einer MedicationDispense zu einem E-Rezept.")
// * insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten MedicationDispense-Suchkriterien")
// * insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
// * insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

RuleSet: DeviceInteraction(expectation)
* insert CapSupportResource(Device, {expectation})
* insert CapSupportProfile(GEM_ERP_PR_Device, {expectation})

* insert CapResourceInteraction(#search-type, {expectation})
* insert DeviceSearchTypeInteractionStatusCodes

// Protokollierung
RuleSet: AuditEventInteraction(expectation)
* insert CapSupportResource(AuditEvent, #SHALL)
* insert CapSupportProfile(TIAuditEventRest, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert AuditEventSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert AuditEventReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(date, http://hl7.org/fhir/SearchParameter/AuditEvent-date, #date, {expectation}, "AuditEvent.recorded - Unterstützt die Suche nach dem Aufzeichnungsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(entity, http://hl7.org/fhir/SearchParameter/AuditEvent-entity, #reference, {expectation}, "AuditEvent.entity.what.identifier.value - Unterstützt die Suche nach betroffenen Entitäten")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten AuditEvent-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")


