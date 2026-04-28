Profile: GEM_ERP_PR_Task
Parent: TIFlowTask
Id: GEM-ERP-PR-Task
Title: "Task für E-Rezept"
Description: "Task für die Verwaltung des E-Rezept-Workflows"
* insert LegacyMetaProfile(GEM_ERP_PR_Task)

* extension ^slicing.rules = #closed

* extension contains GEM_ERP_EX_LastMedicationDispense named lastMedicationDispense 0..1 MS
and TIFlowAcceptDate named acceptDate 0..1 MS
and TIFlowExpiryDate named expiryDate 0..1 MS
and GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PROPERTIES named eu-isRedeemableByProperties 0..1 MS
and GEM_ERP_EX_EU_IS_REDEEMABLE_BY_PATIENT_AUTHORIZATION named eu-isRedeemableByPatientAuthorization 0..1 MS

* for.identifier only IdentifierKvid10

* performerType.coding 1..1
* performerType.coding from TIFlowRxTaskOrganizationsVS (required)

* input MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type.coding.code"
  * ^slicing.rules = #closed
  * ^short = "Input Bundle"
  * ^definition = "Referenz auf Eingabe und Ergebnis des E-Rezeptes während des Prozesses"
* input contains ePrescription 0..1 and patientReceipt 0..1

// QES Binary ePrescription
* input[ePrescription] 0..1 MS
  * ^short = "QES-Binary des E-Rezept"
  * value[x] only Reference(GEM_ERP_PR_Binary)
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #1 (exactly)

// ePriscription for the patient
* input[patientReceipt] 0..1 MS
  * ^short = "JSON-Bundle der Verordnung, das von einem FdV konsumiert werden soll"
  * value[x] only Reference(Bundle)
    * ^comment = "Dies ist ein Bundle eines Rezepts vom Profil [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle)."
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #2 (exactly)

* output MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type.coding.code"
  * ^slicing.rules = #closed
  * ^short = "Output Bundle"
  * ^definition = "Referenz auf das Bundle, das die Quittung darstellt."
* output contains receipt 0..1

// Receipt
* output[receipt] 0..1 MS
  * value[x] only Reference(GEM_ERP_PR_Bundle)
  * type.coding 1..1
  * type.coding from GEM_ERP_VS_DocumentType (required)
    * system 1..1
    * code 1..1
    * code = #3 (exactly)
