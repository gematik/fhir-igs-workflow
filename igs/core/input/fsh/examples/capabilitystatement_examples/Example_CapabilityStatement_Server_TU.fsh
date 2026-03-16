Instance: ExampleCapabilityStatementServerTU
InstanceOf: GEM_ERP_PR_CapabilityStatement
Title: "Example CapabilityStatement Server TU"
Description: "Example capability statement for test environment with experimental feature toggles."
Usage: #example
* id = "example-capabilitystatement-server-tu"
* name = "ExampleCapabilityStatementServerTU"
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

* extension[environment].valueCode = #TU
* extension[fhirConfiguration][+].valueCode = #erp_2026_03

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#200 "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#subscription "Push notification via Subscription resource"
* extension[capabilityFeature][=].extension[value].valueBoolean = false

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#eu-prescription "EU cross-border prescription support"
* extension[capabilityFeature][=].extension[value].valueBoolean = true
