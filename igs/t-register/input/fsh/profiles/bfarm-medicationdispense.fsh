Profile: ERP_TPrescription_MedicationDispense
Parent: MedicationDispense
Id: erp-tprescription-medication-dispense
Title: "E-T-Rezept Medication Dispense"
Description: "Abgabeinformationen einer Apotheke, die es im Rahmen der Belieferung eines T-Rezeptes an den E-Rezept-Fachdienst übermittelt hat."
* insert Profile(erp-tprescription-medication-dispense)

// Default FHIR Elements with 1..1 cardinality
* status = #completed (exactly)

// Fields that are to be supported by systems
* dosageInstruction MS
* whenHandedOver MS
* quantity MS
* performer MS
* medication[x] only Reference
* medicationReference MS

// Forbidden Elements
* subject 0..0
* identifier 0..0
* partOf 0..0
* statusReason[x] 0..0
* category 0..0
* context 0..0
* supportingInformation 0..0
* location 0..0
* authorizingPrescription 0..0
* type 0..0
* daysSupply 0..0
* whenPrepared 0..0
* destination 0..0
* receiver 0..0
* note 0..0
* detectedIssue 0..0
* eventHistory 0..0
* substitution 0..0