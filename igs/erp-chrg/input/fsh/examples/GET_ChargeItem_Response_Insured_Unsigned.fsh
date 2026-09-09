Instance: Example-GEM-ERP-Bundle-GET-Response-Insured-Unsigned
InstanceOf: Bundle
Title: "Abrechnungsinformation zum Ändern abrufen"
Description: "Apotheke ruft mit dem AccessCode zum Ändern das Bundle mit ChargeItem, Verordnungsdatensatz (mit QES) und Abgabedatensatz (mit ursprünglicher Signatur) zur Korrektur ab"
Usage: #example
* type = #searchset
* total = 2
* entry[0].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Example-GEM-ERPCHRG-ChargeItem-1"
* entry[=].resource = Example-GEM-ERPCHRG-ChargeItem-1
* entry[=].search.mode = #match
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Example-GEM-ERPCHRG-ChargeItem-2"
* entry[=].resource = Example-GEM-ERPCHRG-ChargeItem-2

Instance: Example-GEM-ERPCHRG-ChargeItem-1
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Usage: #inline
* insert ChargeItemCompleteWithAccessCode

Instance: Example-GEM-ERPCHRG-ChargeItem-2
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Usage: #inline
* insert ChargeItemCompleteWithAccessCode