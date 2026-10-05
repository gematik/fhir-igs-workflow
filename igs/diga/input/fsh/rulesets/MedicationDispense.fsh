Instance: Example-MedicationDispense-DiGA-Name-And-PZN
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA, Name and PZN"
Description: "Example of a Medication Dispense for DiGAs only stating the name of the DiGA."
* insert MedicationDispense

Instance: Example-MedicationDispense-DiGA-DeepLink
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA with a deep link."
Description: "Example of a Medication Dispense for DiGAs which states a deep link."
* insert MedicationDispense
* extension[deepLink].valueUrl = "https://example.com?redeemCode=DE12345678901234"

Instance: Example-MedicationDispense-DiGA-NoRedeemCode
InstanceOf: GEM_ERP_PR_MedicationDispense_DiGA
Usage: #example
Title: "Medication Dispense DiGA without a redeem code"
Description: "Example of a Medication Dispense for DiGAs which has no redeem code."
* insert MedicationDispense_Base
* note.text = "Freischaltcode für DiGA konnte nicht erstellt werden"
* medicationReference.extension[data-absent-reason].valueCode = #asked-declined

RuleSet: MedicationDispense
* extension[redeemCode].valueString = "DE12345678901234"
* medicationReference.display = "Gematico Diabetestherapie"
* insert Medication_Identifier(medicationReference.identifier)
* insert MedicationDispense_Base

RuleSet: MedicationDispense_Base
* insert Prescription_Identifier(identifier[prescriptionID])
* insert GKV_Identifier(subject.identifier)
* insert KTRTelematik_Identifier(performer.actor.identifier)
* insert Date(whenHandedOver)

RuleSet: Medication_Identifier(field)
* {field}.system = $cs-pzn
* {field}.value = "12345678"
