Instance: ExampleCapabilityStatementServerPU
InstanceOf: GEM_ERP_PR_CapabilityStatement
Title: "Example CapabilityStatement Server PU"
Description: "Example capability statement for productive environment with common ERP features enabled."
Usage: #example
* id = "example-capabilitystatement-server-pu"
* name = "ExampleCapabilityStatementServerPU"
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

* extension[environment].valueCode = #PU
* extension[fhirConfiguration][+].valueCode = #erp_2026_03

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#subscription "Push notification via Subscription resource"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#multi-prescription "Mehrfachverordnung (MVO) support"
* extension[capabilityFeature][=].extension[value].valueBoolean = true
