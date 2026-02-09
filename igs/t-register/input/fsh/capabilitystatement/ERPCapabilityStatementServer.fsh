Instance: ERPFachdienstServerTPrescription
InstanceOf: TICapabilityStatement
Usage: #definition

* id = "erp-fachdienst-server-tprescription"
* name = "ERPFachdienstServerTPrescription"
* title = "T-Prescription CapabilityStatement fuer den E-Rezept-Fachdienst"
* description = "CapabilityStatement fuer den E-Rezept-Fachdienst (T-Register)"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server

* imports[+] = "https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server"
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = #SHALL

* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile[+] = Canonical(ERP_TPrescription_MedicationRequest)
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read

* rest.resource[+].type = #MedicationDispense
* rest.resource[=].supportedProfile[+] = Canonical(ERP_TPrescription_MedicationDispense)
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read

* rest.resource[+].type = #Medication
* rest.resource[=].supportedProfile[+] = Canonical(ERP_TPrescription_Medication)
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read

* rest.resource[+].type = #Organization
* rest.resource[=].supportedProfile[+] = Canonical(ERP_TPrescription_Organization)
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[+].code = #read
