Instance: TIFlowClientValidationServer
InstanceOf: TICapabilityStatement
Usage: #definition
* insert Meta-Instance
* id = "ti-flow-client-validation-server"
* name = "TIFlowClientValidationServer"
* title = "CapabilityStatement für die TIFlow-Validierung"
* description = """
Dieses CapabilityStatement beschreibt die für die Entwicklung von Client-Systemen
bereitgestellte Validierungsschnittstelle.

Die Schnittstelle ermöglicht die Validierung von FHIR-Ressourcen gegen eine
ausgewählte FHIR-Konfiguration und dient insbesondere der frühzeitigen Prüfung
von FHIR-Daten während der Entwicklung und Integration von Client-Systemen.
"""
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"

* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

* kind = #requirements
* rest.mode = #server

* extension[baseUrl].valueString = "/"

// // System-level Operations
* insert CapSupportSystemOperation(validate, TIFlowCOREOPValidate, #MAY, "Diese Operation validiert eine FHIR-Ressource gegen eine konfigurierbare FHIR-Konfiguration.")
