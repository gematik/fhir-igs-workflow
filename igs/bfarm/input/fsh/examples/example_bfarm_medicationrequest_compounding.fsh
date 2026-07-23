Instance: ExampleMedicationRequest-T-Compounding
InstanceOf: ERP_TPrescription_MedicationRequest
Title: "Beispiel BfArM MedicationRequest"
Description: "Ein MedicationRequest für die Ausgabe von Pomalidomid als Rezeptur"
* status = #completed
* intent = #order
* authoredOn = "2026-04-01"
* subject.identifier.system.extension[+].url = $data-absent-reason
* subject.identifier.system.extension[=].valueCode = #not-permitted
* subject.identifier.value.extension[+].url = $data-absent-reason
* subject.identifier.value.extension[=].valueCode = #not-permitted
* medicationReference = Reference(ExampleMedication1-Thalidomid-T-Compounding)
* dosageInstruction[+].text = "Nach Bedarf mit ausreichend Wasser einzunehmen."
* dispenseRequest
  * quantity.value = 10
  * quantity.unit = "Tablette"
* extension[teratogenic]
  * extension[off-label].valueBoolean = true
  * extension[childbearing-potential].valueBoolean = true
  * extension[security-compliance].valueBoolean = false
  * extension[hand-out-information-material].valueBoolean = false
  * extension[declaration-of-expertise].valueBoolean = true

Instance: ExampleMedication1-Thalidomid-T-Compounding
InstanceOf: ERP_TPrescription_Medication
Title: "Beispiel BfArM Medication (Verordnung) - Rezeptur"
Description: "Thalidomid Kapseln"
Usage: #example
* extension[packaging].valueString = "Packung als 20 Kapseln in Schachtel."
* extension[manufacturingInstructions].valueString = "M.D.S."
* code.coding[+]
  * system = "http://www.whocc.no/atc"
  * code = #L04AX02
  * display = "Thalidomid"
* form.coding[+]
  * system = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM
  * code = #HKP
  * display = "Hartkapseln"
* amount
  * numerator
    * extension[packagingSize].valueString = "100"
    * unit = "ml"
  * denominator.value = 1
* ingredient[0]
  * itemCodeableConcept.text = "Thalidomid"
  * strength.numerator.value = 5
  * strength.numerator.unit = "g"
  * strength.denominator.value = 1
* ingredient[+]
  * itemCodeableConcept.text = "Mannit"
  * strength.extension[amountText].valueString = "1g"
