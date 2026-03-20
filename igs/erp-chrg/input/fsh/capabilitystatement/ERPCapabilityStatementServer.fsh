Instance: ERPFachdienstServerErpChrg
InstanceOf: TICapabilityStatement
Usage: #definition
* insert MetaInstance(ERPFachdienstServerChrg)

* id = "erp-fachdienst-server-erpchrg"
* title = "ERPCHRG CapabilityStatement für den E-Rezept-Fachdienst"
* description = "CapabilityStatement für den E-Rezept-Fachdienst (PKV-Abrechnungsinformationen)"
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

* imports[+] = $cap-erp-fd
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = #SHALL

* insert TaskInteraction(#SHALL)
* insert ChargeItemInteraction(#SHALL)
* insert ConsentInteraction(#SHALL)
* insert CommunicationInteraction(#SHALL)

RuleSet: TaskInteraction(expectation)
* insert CapSupportResource(Task, #SHALL)
* insert CapSupportProfileUrl($erp-task, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

RuleSet: ChargeItemInteraction(expectation)
* insert CapSupportResource(ChargeItem, #SHALL)
* insert CapSupportProfile(GEM_ERPCHRG_PR_ChargeItem, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

* insert CapSupportResourceSearchParam(_lastUpdated, http://hl7.org/fhir/SearchParameter/Resource-lastUpdated, #date, {expectation}, "Resource.meta.lastUpdated - Unterstützt die Suche nach dem zuletzt aktualisierten Datum")
* insert CapSupportResourceSearchParam(entered-date, http://hl7.org/fhir/SearchParameter/ChargeItem-enteredDate, #date, {expectation}, "ChargeItem.enteredDate - Unterstützt die Suche nach dem Eingangsdatum; default sort if _sort is not provided")
* insert CapSupportResourceSearchParamNoDefinition(_sort, #string, {expectation}, "Unterstützt das Sortieren nach unterstützten ChargeItem-Suchkriterien")
* insert CapSupportResourceSearchParamNoDefinition(_count, #number, {expectation}, "Maximale Anzahl zurückgegebener Einträge pro Seite; maximum value is 50")
* insert CapSupportResourceSearchParamNoDefinition(__offset, #number, {expectation}, "Nullbasierter Offset des ersten zurückgegebenen Eintrags; default is 0")

RuleSet: CommunicationInteraction(expectation)
* insert CapSupportResource(Communication, #SHALL)
* insert CapSupportProfile(GEM_ERPCHRG_PR_Communication_ChargChangeReq, #SHALL)
* insert CapSupportProfile(GEM_ERPCHRG_PR_Communication_ChargChangeReply, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

RuleSet: ConsentInteraction(expectation)
* insert CapSupportResource(Consent, #SHALL)
* insert CapSupportProfile(GEM_ERPCHRG_PR_Consent, #SHALL)

* insert CapResourceInteraction(#search-type, #SHALL)
* insert SearchTypeInteractionStatusCodes
* insert CapResourceInteraction(#read, #SHALL)
* insert ReadInteractionStatusCodes

