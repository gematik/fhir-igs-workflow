Extension: EFlowRxAvailabilityStateExtension
Id: eflow-rx-availabilitystate-extension
Title: "GEM ERP EX AvailabilityState"
Description: "Extension zur Angabe von Typ des Verfügbarkeitsstatus für die Anfrage zur Medikamentenverfügbarkeit."
* insert Versioning
* ^context.type = #element
* ^context.expression = "Communication.payload"
* value[x] only Coding
* value[x] from EFlowRxAvailabilityStatusVS (required)
* value[x] ^binding.description = "Availability of medication"
* value[x].system 1..
* value[x].code 1..
