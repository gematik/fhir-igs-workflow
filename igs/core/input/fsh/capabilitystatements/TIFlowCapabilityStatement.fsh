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

* extension[baseUrl].valueString = $erp-base-url

// Header
* insert Content-Type(true)
* insert Authorization(true)

// Ressourcen
* insert DeviceInteraction(#SHALL)
* insert AuditEventInteraction(#SHALL)

// // System-level Operations
// * insert CapSupportSystemOperation(validate, TIFlowCOREOPValidate, #MAY, "Diese Operation validiert eine FHIR-Ressource gegen eine konfigurierbare FHIR-Konfiguration.")


RuleSet: DeviceInteraction(expectation)
* insert CapSupportResource(Device, {expectation})
* insert CapSupportProfile(GEM_ERP_PR_Device, {expectation})

* insert CapResourceInteraction(#search-type, {expectation})
* insert DeviceSearchTypeInteractionStatusCodes

// Protokollierung
RuleSet: AuditEventInteraction(expectation)
* insert CapSupportResource(AuditEvent, #SHALL)
* insert CapSupportProfile(TIFlowAuditEventRest, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert AuditEventSearchTypeInteractionStatusCodes

* insert CapResourceInteraction(#read, #SHALL)
* insert AuditEventReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(date, http://hl7.org/fhir/SearchParameter/AuditEvent-date, #date, {expectation}, "AuditEvent.recorded - Unterstützt die Suche nach dem Aufzeichnungsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParam(entity, http://hl7.org/fhir/SearchParameter/AuditEvent-entity, #reference, {expectation}, "AuditEvent.entity.what.identifier.value - Unterstützt die Suche nach betroffenen Entitäten")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten AuditEvent-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(_offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")
