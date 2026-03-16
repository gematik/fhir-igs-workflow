Instance: ExampleCapabilityStatementServerRU
InstanceOf: GEM_ERP_PR_CapabilityStatement
Title: "Example CapabilityStatement Server RU"
Description: "Example capability statement for reference environment with selected features enabled."
Usage: #example
* id = "example-capabilitystatement-server-ru"
* name = "ExampleCapabilityStatementServerRU"
* status = #active
* version = "1.1.1"
* date = "2026-03-16"
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server

* extension[environment].valueCode = #RU
* extension[fhirConfiguration][+].valueCode = #erp_2026_02

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#169 "Flowtype zur Workflow-Steuerung durch Leistungserbringer"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#eu-prescription "EU cross-border prescription support"
* extension[capabilityFeature][=].extension[value].valueBoolean = false

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#medication-dispense-v2 "MedicationDispense V2 profile support"
* extension[capabilityFeature][=].extension[value].valueBoolean = true
