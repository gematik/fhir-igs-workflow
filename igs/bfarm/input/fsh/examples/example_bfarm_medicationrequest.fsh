Instance: ExampleMedicationRequest-T
InstanceOf: ERP_TPrescription_MedicationRequest
Title: "Beispiel BfArM MedicationRequest"
Description: "Ein MedicationRequest für die Ausgabe von Pomalidomid mit einer Freitextdosierung"
* status = #completed
* intent = #order
* authoredOn = "2026-04-01"
* subject.identifier.system.extension[+].url = $data-absent-reason
* subject.identifier.system.extension[=].valueCode = #not-permitted
* subject.identifier.value.extension[+].url = $data-absent-reason
* subject.identifier.value.extension[=].valueCode = #not-permitted
* medicationReference = Reference(ExampleMedication1-Pomalidomid-T)
* extension[renderedDosageInstruction].valueMarkdown = "nach Bedarf mit ausreichend Flüssigkeit"
* extension[generatedDosageInstructionsMeta]
  * url = $generatedMeta
  * extension[+].url = "algorithmVersion"
  * extension[=].valueString = "1.0.0"
  * extension[+].url = "language"
  * extension[=].valueCode = #de-DE
* dosageInstruction[+].text = "nach Bedarf mit ausreichend Flüssigkeit"
* dispenseRequest
  * quantity.value = 10
  * quantity.unit = "Tablette"
* extension[teratogenic]
  * extension[off-label].valueBoolean = true
  * extension[childbearing-potential].valueBoolean = true
  * extension[security-compliance].valueBoolean = true
  * extension[hand-out-information-material].valueBoolean = true
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
