Instance: ExampleMedicationDispense-T
InstanceOf: ERP_TPrescription_MedicationDispense
Title: "Beispiel BfArM MedicationDispense"
Description: "Ein MedicationDispense für die Ausgabe von Pomalidomid mit einer Dosierung von 1-1-1-1 nach Bedarf"
* status = #completed
* medicationReference = Reference(ExampleMedication2-Pomalidomid-T)
* quantity.value = 10
* quantity.unit = "Tablette"
* dosageInstruction[+].text = "1-1-1-1 nach Bedarf"
* whenHandedOver = "2026-04-02"
* performer.actor.identifier.value = "3-07.2.1234560000.10.789"
* performer.actor.identifier.system = "https://gematik.de/fhir/sid/telematik-id"

Instance: ExampleMedication2-Pomalidomid-T
InstanceOf: ERP_TPrescription_Medication
Title: "Beispiel BfArM Medication (Abgabe) - Pomalidomid"
Description: "Pomalidomid Accord 1 mg"
* code.text = "Pomalidomid Accord 1 mg 21 x 1 Hartkapseln"
* code = $pzn#19201712
* form = $KBV_CS_SFHIR_KBV_DARREICHUNGSFORM#HKP
