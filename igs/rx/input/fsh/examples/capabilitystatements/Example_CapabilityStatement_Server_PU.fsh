Instance: ExampleCapabilityStatementServerPU
InstanceOf: TICapabilityStatement
Title: "Example CapabilityStatement Server PU - RX"
Description: "Example capability statement for productive environment with common features enabled."
Usage: #example
* status = #active
* version = "2.0.0"
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

* extension[environment].valueCode = #PU
* extension[fhirConfiguration][+].valueCode = #erp_2028_03
* extension[feature][+]
  * extension[definition].valueCanonical = Canonical(TIFlowFeatureWF160)
  * extension[value].valueBoolean = true
* extension[feature][+]
  * extension[definition].valueCanonical = Canonical(TIFlowFeatureWF169)
  * extension[value].valueBoolean = false