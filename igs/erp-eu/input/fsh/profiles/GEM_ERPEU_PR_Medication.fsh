Profile: GEM_ERPEU_PR_Medication
Parent: EPAMedication
Id: GEM-ERPEU-PR-Medication
Title: "EU-Medication"
Description: "Medication of a Prescription or Dispensation from the EU"
* insert Profile(GEM_ERPEU_PR_Medication)

* extension contains 
  GEM_ERPEU_EX_MedicinalPackageIdentifier named packageIdentifier 0..1
  and GEM_ERPEU_EX_MedicinalPackageDescription named packageDescription 0..1