Instance: TIFlowBasicServer
InstanceOf: TICapabilityStatement
Usage: #definition
* insert Meta-Instance

* id = "tiflow-basic-server"
* name = "TIFlowBasicServer"
* title = "TIFlow Basic Server"
* description = "Das Basis Capability Statement für einen TIFlow Workflow. Es beschreibt globale Header-Anforderungen und einheitliche HTTP Fehler Codes."
* contact
  * telecom
    * system = #url
    * value = "https://www.gematik.de"
* fhirVersion = #4.0.1
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml
* kind = #requirements
* rest.mode = #server

// Header
* insert Content-Type(true)
* insert Authorization(true)