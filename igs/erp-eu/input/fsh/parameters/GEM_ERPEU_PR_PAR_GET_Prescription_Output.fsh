Profile: GEM_ERPEU_PR_PAR_GET_Prescription_Output
Parent: Parameters
Id: gem-erpeu-pr-par-get-prescription-output
Title: "GEM ERPEU PR PAR GET Prescription Output"
Description: "This profile defines the output parameters for the Get Prescription Operation"
* insert Profile(GEM_ERPEU_PR_PAR_GET_Prescription_Output)

* parameter 0..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains return 0..1

* parameter[return]
  * name MS
  * name = "return"
  * value[x] 0..0
  * resource 1..1
  * resource only Bundle
  * part 0..0
