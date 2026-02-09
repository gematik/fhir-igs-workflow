Instance: ERPFachdienstServerErpEU
InstanceOf: TICapabilityStatement
Usage: #definition

* id = "erp-fachdienst-server-erpeu"
* name = "ERPFachdienstServerErpEU"
* title = "ERPEU CapabilityStatement fuer den E-Rezept-Fachdienst"
* description = "CapabilityStatement fuer den E-Rezept-Fachdienst (EU)"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+json
* format[+] = #application/fhir+xml
* rest.mode = #server

* imports[+] = "https://gematik.de/fhir/workflow/core/CapabilityStatement/erp-fachdienst-server"
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = #SHALL

* rest.operation[+].name = "get-eu-prescriptions"
* rest.operation[=].definition = Canonical(GET-Prescription-EU)
* rest.operation[=].extension[0].url = $capabilitystatement-expectation
* rest.operation[=].extension[0].valueCode = #SHALL

* rest.operation[+].name = "grant-eu-access-permission"
* rest.operation[=].definition = Canonical(Grant-EU-Access-Permission)
* rest.operation[=].extension[0].url = $capabilitystatement-expectation
* rest.operation[=].extension[0].valueCode = #SHALL

* rest.operation[+].name = "read-eu-access-permission"
* rest.operation[=].definition = Canonical(Read-EU-Access-Permission)
* rest.operation[=].extension[0].url = $capabilitystatement-expectation
* rest.operation[=].extension[0].valueCode = #SHALL

* rest.operation[+].name = "revoke-eu-access-permission"
* rest.operation[=].definition = Canonical(Revoke-EU-Access-Permission)
* rest.operation[=].extension[0].url = $capabilitystatement-expectation
* rest.operation[=].extension[0].valueCode = #SHALL

* rest.resource[+].type = #Task
* rest.resource[=].operation[+].name = "eu-close"
* rest.resource[=].operation[=].definition = Canonical(EUCloseOperation)
* rest.resource[=].operation[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].operation[=].extension[0].valueCode = #SHALL
