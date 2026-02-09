Instance: ERPFachdienstServerDiGA
InstanceOf: TICapabilityStatement
Usage: #definition

* id = "erp-fachdienst-server-diga"
* name = "ERPFachdienstServerDiGA"
* title = "DiGA CapabilityStatement fuer den E-Rezept-Fachdienst"
* description = "CapabilityStatement fuer den E-Rezept-Fachdienst (DiGA)"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server

* imports[+] = "https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server"
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = #SHALL

* rest.resource[+].type = #Communication
* rest.resource[=].supportedProfile[+] = Canonical(GEM_ERP_PR_Communication_DiGA)
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read

* rest.resource[+].type = #MedicationDispense
* rest.resource[=].supportedProfile[+] = Canonical(GEM_ERP_PR_MedicationDispense_DiGA)
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read
