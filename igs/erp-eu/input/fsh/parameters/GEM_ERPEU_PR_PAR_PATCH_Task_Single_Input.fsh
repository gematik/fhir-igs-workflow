Profile: GEM_ERPEU_PR_PAR_PATCH_Task_Input
Parent: Parameters
Id: GEM-ERPEU-PR-PAR-PATCH-Task-Input
Title: "GEM ERPEU PR PAR PATCH Task Input"
Description: "This profile defines the parameters for patching the Task to mark the prescription as to-be-redeemed in the EU"
* insert Profile(GEM_ERPEU_PR_PAR_PATCH_Task_Input)

* parameter 1..* MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  eu-isRedeemableByPatientAuthorization 1..1 MS

* parameter[eu-isRedeemableByPatientAuthorization]
  * name MS
  * name = "eu-isRedeemableByPatientAuthorization"
  * value[x] 1..1
  * value[x] only boolean
  * resource 0..0
  * part 0..0

