Instance: Example-GEM-ERP-Bundle-GET-Response-Pharmacy
InstanceOf: Bundle
Title: "Abrechnungsinformation zum Ändern abrufen"
Description: "Apotheke ruft mit dem AccessCode zum Ändern das Bundle mit ChargeItem, Verordnungsdatensatz (mit QES) und Abgabedatensatz (mit ursprünglicher Signatur) zur Korrektur ab"
Usage: #example
* type = #collection
* insert DateTimeStamp(timestamp)
* entry[0].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/ChargeItem/Example-GEM-ERPCHRG-ChargeItem"
* entry[=].resource = Example-GEM-ERPCHRG-ChargeItem
* entry[+].fullUrl = $URN_KBV_PR_ERP_Bundle
* entry[=].resource = Example-KBV-Bundle-PKV
* entry[+].fullUrl = $URN_DAV_PKV_AbgabedatenBundle
* entry[=].resource = Example-DAV-PKV-AbgabedatenBundle
* entry[+].fullUrl = $URN_GEM_ERP_Bundle
* entry[=].resource = Example-GEM-ERP-Bundle-Inline

Instance: Example-GEM-ERPCHRG-ChargeItem
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Usage: #inline
* insert ChargeItemComplete