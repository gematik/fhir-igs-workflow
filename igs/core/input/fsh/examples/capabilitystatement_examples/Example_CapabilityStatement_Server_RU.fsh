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
* kind = #instance
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server

* extension[environment].valueCode = #RU
* extension[fhirConfiguration][+].valueCode = #erp_2026_02

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#162 "Flowtype für Digitale Gesundheitsanwendungen"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#165 "Flowtype für Betäubungsmittel"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#166 "Flowtype für Arzneimittel nach § 3a AMVV"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#169 "Flowtype zur Workflow-Steuerung durch Leistungserbringer"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#200 "Flowtype für Apothekenpflichtige Arzneimittel (PKV)"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-flowtype#209 "Flowtype zur Workflow-Steuerung durch Leistungserbringer (PKV)"
* extension[capabilityFeature][=].extension[value].valueBoolean = true

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#eu-prescription "EU-Feature"
* extension[capabilityFeature][=].extension[value].valueBoolean = false

* extension[capabilityFeature][+].extension[coding].valueCoding = $cs-features#t-prescription-transfer "Übertragung digitaler Durchschlag"
* extension[capabilityFeature][=].extension[value].valueBoolean = false
