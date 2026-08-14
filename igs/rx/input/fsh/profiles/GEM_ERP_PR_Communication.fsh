Profile: GEM_ERP_PR_Communication
Parent: TIFlowCommunication
Id: GEM-ERP-PR-Communication
Title: "GEM ERP PR Communication"
Description: "Generische Workflow-Communication"
* insert Meta
* ^abstract = true

* basedOn 1..1 MS
* basedOn only Reference(GEM_ERP_PR_Task)
* basedOn ^type.aggregation = #referenced
  * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
  * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"
  * reference 1..1 MS
    * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
    * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"



// Remove unused fields
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* partOf 0..0
* inResponseTo 0..0
* statusReason 0..0
* category 0..0
* priority 0..0
* medium 0..0
* subject 0..0
* topic 0..0
* about 0..0
* encounter 0..0
* reasonCode 0..0
* reasonReference 0..0
* note 0..0
