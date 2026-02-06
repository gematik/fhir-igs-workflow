Profile: ERP_TPrescription_Medication
Parent: EPAMedication
Id: erp-tprescription-medication
Title: "E-T-Rezept Medication"
Description: "Medikationsprofil, welches Informationen zum verordneten oder abgegebenen Arzneimittel enthält."
* insert Profile(erp-tprescription-medication)

* contained MS
  * ^short = "Enthaltene Medikationen"
  * ^comment = "Im Falle einer Rezeptur oder Kombipackung sind die Bestandteile der Rezeptur, bzw. Kombipackung hier als Medications gelistet."

* extension[rxPrescriptionProcessIdentifier] 0..0
* extension[isVaccine] 0..0
* extension[drugCategory] 0..0
* extension[manufacturingInstructions] 0..0
* extension[type] 0..0

* meta 0..0
* implicitRules 0..0
* language 0..0
* text 0..0
* identifier 0..0
* status 0..0
* manufacturer 0..0
* batch 0..0

