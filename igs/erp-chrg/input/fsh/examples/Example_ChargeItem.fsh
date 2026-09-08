Instance: Example-GEM-ERPCHRG-ChargeItem
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title: "ChargeItem with Bundles completed by Fachdienst"
Usage: #example
* insert ChargeItemWithAccessCode
* supportingInformation[prescriptionItemBundle] = Reference($URN_KBV_PR_ERP_Bundle)
* supportingInformation[dispenseItemBundle] = Reference($URN_DAV_PKV_AbgabedatenBundle)
* supportingInformation[dispenseItemBundle].display = $DAV-PKV-PR-ERP-AbgabedatenBundle
* supportingInformation[receiptBundle] = Reference(Example-GEM-ERP-Bundle)
* supportingInformation[receiptBundle].display = $GEM_ERP_PR_Bundle

Instance: Example-GEM-ERPCHRG-ChargeItem-Binary
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Title:   "ChargeItem with contained Binary to Fachdienst"
Usage: #example
* contained[+] = Example-DispenseItem-Binary
* insert ChargeItemWithAccessCode
* supportingInformation[dispenseItemBinary] = Reference(Example-DispenseItem-Binary)

Instance: Example-GEM-ERPCHRG-Patch-ChargeItem-Input
InstanceOf: GEM_ERPCHRG_PR_PAR_Patch_ChargeItem_Input
Usage: #example
* parameter[markingFlag].part[insuranceProvider].valueBoolean = false
* parameter[markingFlag].part[taxOffice].valueBoolean = false