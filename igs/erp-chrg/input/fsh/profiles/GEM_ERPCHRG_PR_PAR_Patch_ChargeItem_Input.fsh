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

* parameter contains markingFlag 1..1
  
* parameter[markingFlag]
  * obeys erpcharge-parameters-patch-chargeitem-part
  * name MS
  * name = "markingFlag"
  * resource 0..0
  * value[x] 0..0

* parameter[markingFlag].part MS
* parameter[markingFlag].part ^slicing.discriminator.type = #pattern
* parameter[markingFlag].part ^slicing.discriminator.path = "name"
* parameter[markingFlag].part ^slicing.rules = #closed
* parameter[markingFlag].part contains
    insuranceProvider 0..1 and
    subsidy 0..1 and
    taxOffice 0..1

* parameter[markingFlag].part[insuranceProvider] MS
* parameter[markingFlag].part[insuranceProvider].name MS
* parameter[markingFlag].part[insuranceProvider].name = "insuranceProvider"
* parameter[markingFlag].part[insuranceProvider].value[x] 1..1
* parameter[markingFlag].part[insuranceProvider].value[x] only boolean
* parameter[markingFlag].part[insuranceProvider].resource 0..0
* parameter[markingFlag].part[insuranceProvider].part 0..0

* parameter[markingFlag].part[subsidy] MS
* parameter[markingFlag].part[subsidy].name MS
* parameter[markingFlag].part[subsidy].name = "subsidy"
* parameter[markingFlag].part[subsidy].value[x] 1..1
* parameter[markingFlag].part[subsidy].value[x] only boolean
* parameter[markingFlag].part[subsidy].resource 0..0
* parameter[markingFlag].part[subsidy].part 0..0

* parameter[markingFlag].part[taxOffice] MS
* parameter[markingFlag].part[taxOffice].name MS
* parameter[markingFlag].part[taxOffice].name = "taxOffice"
* parameter[markingFlag].part[taxOffice].value[x] 1..1
* parameter[markingFlag].part[taxOffice].value[x] only boolean
* parameter[markingFlag].part[taxOffice].resource 0..0
* parameter[markingFlag].part[taxOffice].part 0..0

Invariant: erpcharge-parameters-patch-chargeitem-part
Description: "At least one Part must be present."
Expression: "part.exists()"
Severity: #error

