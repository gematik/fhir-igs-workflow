Profile: GEM_ERPEU_PR_MedicationDispense
Parent: EPAMedicationDispense
Id: GEM-ERPEU-PR-MedicationDispense
Title: "Dispensation of the Prescription from the EU"
Description: "Handles information about the redeem of the prescription and the submited medication from the EU."
* insert Profile(GEM_ERPEU_PR_MedicationDispense)

* identifier contains prescriptionID 1..1
* identifier[prescriptionID] only EPrescriptionId
* identifier[prescriptionID] ^patternIdentifier.system = $prescription-id-ns
* identifier ^short = "ePrescription identifier"

* status = #completed (exactly)
* status ^short = "completed"

* medication[x] only Reference(GEM_ERPEU_PR_Medication)
* medication[x] MS
  * ^definition = "The MedicationDispense references a medication which was dispensed"

* performer 1..1
  * ^definition = "References a pracitioner role in order to state practitioner and organization information"
* performer.actor only Reference(GEM_ERPEU_PR_PractitionerRole)

* whenHandedOver 1..1 MS
* whenHandedOver obeys erp-eu-abgabeDatumsFormat
* whenPrepared obeys erp-eu-abgabeDatumsFormat

* substitution MS
* substitution.wasSubstituted MS
  * ^short = "Indicates whether a substitution was made on the dispensed medication"

* dosageInstruction MS

* quantity MS
* quantity obeys erp-eu-positiveAnzahlPackungen
  * ^short = "Number of dispensed packages/ units"
  * value MS
  * unit MS

Invariant: erp-eu-positiveAnzahlPackungen
Description: "Der Wert der Packungen muss positiv sein (größer gleich 0)."
* severity = #error
* expression = "value>=0"

Invariant: erp-eu-abgabeDatumsFormat
Description: "Wert muss ein Datum in der Form: YYYY-MM-DD sein."
* severity = #error
* expression = "toString().length()=10"