Instance: Example-MedicationDispense-EU
InstanceOf: GEM_ERPEU_PR_MedicationDispense
Usage: #example
Title: "Example Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor = Reference(Example-EU-PractitionerRole)
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* quantity
  * value = 2
  * unit = "pkg"