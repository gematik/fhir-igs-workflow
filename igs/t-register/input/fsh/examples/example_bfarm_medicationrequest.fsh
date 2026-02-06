Instance: ExampleMedicationRequest-T
InstanceOf: ERP_TPrescription_MedicationRequest
Title: "Beispiel BfArM MedicationRequest"
Description: "Ein MedicationRequest für die Ausgabe von Pomalidomid mit einer Dosierung von 1-1-1-1"
* status = #completed
* intent = #order
* authoredOn = "2026-04-01"
* subject.identifier.system.extension[+].url = $data-absent-reason
* subject.identifier.system.extension[=].valueCode = #not-permitted
* subject.identifier.value.extension[+].url = $data-absent-reason
* subject.identifier.value.extension[=].valueCode = #not-permitted
* medicationReference = Reference(ExampleMedication1-Pomalidomid-T)
* dosageInstruction[+].text = "1-1-1-1"
* dispenseRequest
  * quantity.value = 10
  * quantity.unit = "Tablette"
* extension[teratogenic]
  * extension[off-label].valueBoolean = true
  * extension[childbearing-potential].valueBoolean = true
  * extension[security-compliance].valueBoolean = false
  * extension[hand-out-information-material].valueBoolean = false
  * extension[declaration-of-expertise].valueBoolean = true

Instance: ExampleMedication1-Pomalidomid-T
InstanceOf: ERP_TPrescription_Medication
Title: "Beispiel BfArM Medication (Verordnung) - Pomalidomid"
Description: "Pomalidomid Hartkapseln"
* code.coding[+]
  * system = "http://www.whocc.no/atc"
  * code = #L04AX06
  * display = "pomalidomide"
* form.coding[+]
  * system = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM
  * code = #HKP
  * display = "Hartkapseln"
