Profile: GEM_ERP_PR_Task
Parent: TIFlowTask
Id: GEM-ERP-PR-Task
Title: "Task für E-Rezept"
Description: "Task für die Verwaltung des E-Rezept-Workflows"
* insert LegacyMetaProfile(GEM_ERP_PR_Task)

* extension ^slicing.rules = #closed

* extension contains GEM_ERP_EX_LastMedicationDispense named lastMedicationDispense 0..1 MS
and GEM_ERP_EX_AcceptDate named acceptDate 0..1 MS
and GEM_ERP_EX_ExpiryDate named expiryDate 0..1 MS

* input[patientReceipt]
  * ^short = "JSON-Bundle des E-Rezepts, das vom E-Rezept-FdV konsumiert werden soll"
  * value[x]
    * ^comment = "Dies ist ein Bundle eines Rezepts vom Profil [KBV_PR_ERP_Bundle](https://simplifier.net/erezept/kbv_pr_erp_bundle)."

* output[receipt].value[x] only Reference(GEM_ERP_PR_Bundle)