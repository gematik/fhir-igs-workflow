/** Commented out for build
Instance: Example-INVALID-Pkg-MedicationDispense-EU
InstanceOf: GEM_ERPEU_PR_MedicationDispense
Usage: #example
Title: "Example of Invalid Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor = Reference(Example-EU-PractitionerRole)
* insert Date(whenHandedOver)
* medicationReference = Reference(SumatripanMedication)
* quantity
  * value = -1
  * unit = "pkg"

Instance: Example-INVALID-handedover-MedicationDispense-EU
InstanceOf: GEM_ERPEU_PR_MedicationDispense
Usage: #example
Title: "Example of Invalid Medication Dispense"
Description: "Example of a Medication Dispense."
* identifier[prescriptionID].value = "160.000.033.491.280.78"
* subject.identifier.system = $identifier-kvid-10
* subject.identifier.value = "X123456789"
* performer.actor = Reference(Example-EU-PractitionerRole)
* whenHandedOver = "2025-10-01T12:00:00Z"
* medicationReference = Reference(SumatripanMedication)
* quantity
  * value = 1
  * unit = "pkg"

**/