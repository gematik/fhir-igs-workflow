Profile: GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input
Parent: Parameters
Id: GEM-ERPCHRG-PR-PAR-Patch-ChargeItem-Input
Title: "GEM ERPCHRG PR PAR Patch ChargeItem Input Parameter"
Description: "This profile defines the parameters for changing Information for the ChargeItem."
* insert LegacyMeta(StructureDefinition, GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input)

* parameter 1..1
* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains markingFlag 1..1 MS
  
* parameter[markingFlag] MS
  * obeys erpcharge-parameters-patch-chargeitem-part
  * name MS
  * name = "markingFlag"
  * resource 0..0
  * value[x] 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    insuranceProvider 0..1 MS and
    subsidy 0..1 MS and
    taxOffice 0..1 MS
  * part[insuranceProvider] MS
    * name MS
    * name = "insuranceProvider"
    * value[x] 1..1
    * value[x] only boolean
    * resource 0..0
    * part 0..0
  * part[subsidy] MS
    * name MS
    * name = "subsidy"
    * value[x] 1..1
    * value[x] only boolean
    * resource 0..0
    * part 0..0
  * part[taxOffice] MS
    * name MS
    * name = "taxOffice"
    * value[x] 1..1
    * value[x] only boolean
    * resource 0..0
    * part 0..0

Invariant: erpcharge-parameters-patch-chargeitem-part
Description: "At least one Part must be present."
Expression: "part.exists()"
Severity: #error
