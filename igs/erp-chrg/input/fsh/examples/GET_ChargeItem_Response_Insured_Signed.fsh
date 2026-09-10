Instance: Example-GEM-ERP-Bundle-GET-Response-Insured-Signed
InstanceOf: Bundle
Title: "Abrechnungsinformationen einer konkreten Instanz abrufen"
Description: "Versicherter ruft ein bekanntes ChargeItem mit referenzierten Bundles ab — Verordnungs-, Abgabedatensatz und Quittung, jeweils mit Signatur im CAdES-Enveloping-Format"
Usage: #example
* type = #collection
* entry[0].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Example-GEM-ERPCHRG-ChargeItem-Signed"
* entry[=].resource = Example-GEM-ERPCHRG-ChargeItem-Signed
* entry[+].fullUrl = $URN_KBV_PR_ERP_Bundle_with_Signature
* entry[=].resource = Example-KBV-Bundle-PKV-with-Signature
* entry[+].fullUrl = $URN_DAV_PKV_AbgabedatenBundle_with_Signature
* entry[=].resource = Example-DAV-PKV-AbgabedatenBundle-with-Signature
* entry[+].fullUrl = $URN_GEM_ERP_Bundle
* entry[=].resource = Example-GEM-ERP-Bundle-Inline

Instance: Example-GEM-ERPCHRG-ChargeItem-Signed
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Usage: #inline
* insert ChargeItemWithAccessCode
* supportingInformation[prescriptionItemBundle] = Reference($URN_KBV_PR_ERP_Bundle_with_Signature)
* supportingInformation[dispenseItemBundle] = Reference(Example-DAV-PKV-AbgabedatenBundle-with-Signature)
* supportingInformation[receiptBundle] = Reference(Example-GEM-ERP-Bundle-Inline)