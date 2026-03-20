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
* insert GrantEUAccessPermissionInteraction(#SHALL)
* insert ReadEUAccessPermissionInteraction(#SHALL)
* insert RevokeEUAccessPermissionInteraction(#SHALL)
* insert GetEUPrescriptionsInteraction(#SHALL)

RuleSet: TaskInteraction(expectation)
* insert CapSupportResource(Task, #SHALL)
* insert CapSupportProfileUrl($erp-task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes
* insert CapResourceInteraction(#patch, #SHALL)

* insert CapSupportResourceSearchParam(_id, http://hl7.org/fhir/SearchParameter/Resource-id, #token, {expectation}, "Search by Task.id")
* insert CapSupportResourceSearchParamNoDefinition(prescription-id, #token, {expectation}, "Search by Task.identifier")
* insert CapSupportResourceSearchParamNoDefinition(access-code, #token, {expectation}, "Search by Task.identifier")
* insert CapSupportResourceSearchParam(status, http://hl7.org/fhir/SearchParameter/Task-status, #token, {expectation}, "Search by Task.status")
* insert CapSupportResourceSearchParamNoDefinition(authored-on, #date, {expectation}, "Search by Task.authoredOn")
* insert CapSupportResourceSearchParamNoDefinition(accept-date, #date, {expectation}, "Search by Task.extension[acceptDate]")
* insert CapSupportResourceSearchParamNoDefinition(expiry-date, #date, {expectation}, "Search by Task.extension[expiryDate]")
* insert CapSupportResourceSearchParam(modified, http://hl7.org/fhir/SearchParameter/Task-modified, #date, {expectation}, "Search by Task.lastModified")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Supports sorting over supported Task search criteria")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximum number of returned entries per page; max value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Zero-based offset of the first returned entry; default is 0")

* insert CapSupportResourceOperation(eu-close, EUCloseOperation, {expectation})

RuleSet: GrantEUAccessPermissionInteraction(expectation)
* insert CapSupportSystemOperation(grant-eu-access-permission, Grant-EU-Access-Permission, {expectation})
* insert SystemLevelOperationStatusCodesWithParameters

RuleSet: ReadEUAccessPermissionInteraction(expectation)
* insert CapSupportSystemOperation(read-eu-access-permission, Read-EU-Access-Permission, {expectation})
* insert SystemLevelOperationStatusCodesWithParameters

RuleSet: RevokeEUAccessPermissionInteraction(expectation)
* insert CapSupportSystemOperation(revoke-eu-access-permission, Revoke-EU-Access-Permission, {expectation})
* insert SystemLevelQueryOperationStatusCodesWithNormalSuccess

RuleSet: GetEUPrescriptionsInteraction(expectation)
* insert CapSupportSystemOperation(get-eu-prescriptions, GET-Prescription-EU, {expectation})
* insert SystemLevelOperationStatusCodesWithParameters
