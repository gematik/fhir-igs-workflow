Profile: ERP_TPrescription_MedicationRequest
Parent: EPAMedicationRequest
Id: erp-tprescription-medication-request
Title: "E-T-Rezept Medication Request"
Description: "Informationen zu einer Verordnung, die ein Arzt im E-T-Rezept angegeben hat."
* insert Profile(erp-tprescription-medication-request)

// Default FHIR Elements with 1..1 cardinality
* status = #completed (exactly)
* intent = #order (exactly)

* extension MS

// Allow only the data-absent-reason extension on subject
* subject 
  * reference 0..0
  * display 0..0
  * type 0..0
  
// Fields that are to be supported by systems
* authoredOn MS
* dosageInstruction MS
* dispenseRequest MS
  * expectedSupplyDuration MS
  * quantity MS
  * initialFill 0..0
  * dispenseInterval 0..0
  * validityPeriod 0..0
  * numberOfRepeatsAllowed 0..0
  * performer 0..0
* medication[x] MS
* medication[x] only Reference

// Forbidden Elements
* identifier 0..0
* statusReason 0..0
* category 0..0
* priority 0..0
* doNotPerform 0..0
* reported[x] 0..0
* encounter 0..0
* supportingInformation 0..0
* requester 0..0
* performer 0..0
* performerType 0..0
* recorder 0..0
* reasonCode 0..0
* reasonReference 0..0
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* basedOn 0..0
* groupIdentifier 0..0
* courseOfTherapyType 0..0
* insurance 0..0
* note 0..0
* substitution 0..0
* priorPrescription 0..0
* detectedIssue 0..0
* eventHistory 0..0