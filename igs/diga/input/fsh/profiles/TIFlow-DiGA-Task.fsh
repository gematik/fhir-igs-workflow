Profile: TIFlowDiGATask
Parent: TIFlowTask
Id: tiflow-diga-task
Title: "TIFlow - DiGA - Task"
Description: "Task für die Verwaltung des E-Rezept-Workflows für digitale Gesundheitsanwendungen"
* insert Meta

* extension contains GEM_ERP_EX_AcceptDate named acceptDate 0..1 MS
and GEM_ERP_EX_ExpiryDate named expiryDate 0..1 MS

* input[patientReceipt]
  * ^short = "JSON-Bundle der DiGA-Verordnung, das vom E-Rezept-FdV konsumiert werden soll"
  * value[x]
    * ^comment = "Dies ist ein Bundle eines Rezepts vom Profil [KBV_PR_EVDGA_Bundle](https://simplifier.net/evdga/kbv_pr_evdga_bundle)."

* output[receipt].value[x] only Reference(TIFlowDiGAReceiptBundle)