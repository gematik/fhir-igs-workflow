Instance: ERPFachdienstServerErpEu
InstanceOf: TICapabilityStatement
Usage: #definition
* id = "erp-fachdienst-server-erpeu"
* title = "ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst"
* description = "CapabilityStatement fuer den E-Rezept-Fachdienst (EU-Zugriff)"
* version = "1.1.1"
* status = #active
* date = "2026-01-08"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server
* extension[baseUrl].valueString = $erp-base-url

* insert TaskInteraction(#SHALL)
* insert ConsentInteraction(#SHALL)
* insert GrantEUAccessPermissionInteraction(#SHALL)
* insert ReadEUAccessPermissionInteraction(#SHALL)
* insert RevokeEUAccessPermissionInteraction(#SHALL)
* insert GetEUPrescriptionsInteraction(#SHALL)

RuleSet: TaskInteraction(expectation)
* insert CapSupportResource(Task, #SHALL)
* insert CapSupportProfileUrl($erp-task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert TaskSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert TaskReadInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Task.id - Unterstützt die Suche nach der Task-ID")
* insert CapSupportResourceSearchParamNoDefinition(prescription-id, #token, {expectation}, "Task.identifier - Unterstützt die Suche nach der E-Rezept-ID")
* insert CapSupportResourceSearchParamNoDefinition(access-code, #token, {expectation}, "Task.identifier - Unterstützt die Suche nach dem Zugriffscode")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, {expectation}, "Task.status - Unterstützt die Suche nach dem Status einer Task")
* insert CapSupportResourceSearchParamNoDefinition(authored-on, #date, {expectation}, "Task.authoredOn - Unterstützt die Suche nach dem Erstellungsdatum")
* insert CapSupportResourceSearchParamNoDefinition(accept-date, #date, {expectation}, "Task.extension:acceptDate.valueDate - Unterstützt die Suche nach dem Akzeptanzdatum")
* insert CapSupportResourceSearchParamNoDefinition(expiry-date, #date, {expectation}, "Task.extension:expiryDate.valueDate - Unterstützt die Suche nach dem Verfallsdatum")
* insert CapSupportResourceSearchParam(modified, http://hl7.org/fhir/SearchParameter/Task-modified, #date, {expectation}, "Task.lastModified - Unterstützt die Suche nach dem zuletzt modifizierten Datum")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten Task-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

* insert CapSupportResourceOperation(eu-close, EUCloseOperation, {expectation}, "Finishes the EU ePrescription workflow and creates a signed receipt bundle")

RuleSet: ConsentInteraction(expectation)
* insert CapSupportResource(Consent, {expectation})

* insert CapResourceInteraction(#search-type, #SHALL)
* insert ConsentSearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#create, #SHALL)
* insert ConsentCreateInteractionStatusCodes
* insert CapResourceInteraction(#delete, #SHALL)
* insert ConsentDeleteInteractionStatusCodes

* insert CapSupportResourceSearchParam(category, http://hl7.org/fhir/SearchParameter/Consent-category, #token, {expectation}, "Consent.category - Unterstützt die Suche nach der Art der Einwilligung")

RuleSet: GrantEUAccessPermissionInteraction(expectation)
* insert CapSupportSystemOperation(grant-eu-access-permission, Grant-EU-Access-Permission, {expectation}, "Registers access code and country for EU prescription access")
* insert GrantEUAccessPermissionOperationStatusCodes

RuleSet: ReadEUAccessPermissionInteraction(expectation)
* insert CapSupportSystemOperation(read-eu-access-permission, Read-EU-Access-Permission, {expectation}, "Reads the currently registered EU access code")
* insert ReadEUAccessPermissionOperationStatusCodes

RuleSet: RevokeEUAccessPermissionInteraction(expectation)
* insert CapSupportSystemOperation(revoke-eu-access-permission, Revoke-EU-Access-Permission, {expectation}, "Revokes the currently registered EU access code")
* insert RevokeEUAccessPermissionOperationStatusCodes

RuleSet: GetEUPrescriptionsInteraction(expectation)
* insert CapSupportSystemOperation(get-eu-prescriptions, GET-Prescription-EU, {expectation}, "Returns prescription information for EU ePrescription workflows")
* insert GetEUPrescriptionsOperationStatusCodes
