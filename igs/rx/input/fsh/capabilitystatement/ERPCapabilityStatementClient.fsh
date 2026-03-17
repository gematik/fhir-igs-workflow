Instance: ERPFachdienstClientRx
InstanceOf: TICapabilityStatement
Usage: #definition

* id = "erp-fachdienst-client-rx"
* title = "ERP Rx CapabilityStatement fuer Clients des E-Rezept-Fachdienst"
* description = "Dieses CapabilityStatement legt die Anforderungen an Clients des E-Rezept-Fachdienst fuer den Arzneimittel-Workflow fest."
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* version = "1.0.0-draft"
* status = #draft
* date = "2026-03-17"
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #client

* extension[baseUrl].valueString = "https://gematik.de/fhir/erp"

* insert CapSupportResource(Task, #MAY)
* insert CapResourceInteraction(#read, #MAY)
* insert CapResourceInteraction(#search-type, #MAY)
* insert CapSupportResourceOperation(create, $op-create, #MAY)
* insert CapSupportResourceOperation(activate, $op-activate, #MAY)
* insert CapSupportResourceOperation(accept, $op-accept, #MAY)
* insert CapSupportResourceOperation(reject, $op-reject, #MAY)
* insert CapSupportResourceOperation(dispense, $op-dispense, #MAY)
* insert CapSupportResourceOperation(close, $op-close, #MAY)
* insert CapSupportResourceOperation(abort, $op-abort, #MAY)

* insert CapSupportResource(Communication, #MAY)
* insert CapResourceInteraction(#read, #MAY)
* insert CapResourceInteraction(#search-type, #MAY)
* insert CapResourceInteraction(#create, #MAY)
* insert CapResourceInteraction(#delete, #MAY)

* insert CapSupportResource(MedicationDispense, #MAY)
* insert CapResourceInteraction(#read, #MAY)
* insert CapResourceInteraction(#search-type, #MAY)
