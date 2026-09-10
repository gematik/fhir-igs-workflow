Instance: Example-Bundle-Consent-GET-Response
InstanceOf: Bundle
Title: "Einwilligung zum Speichern der Abrechnungsinformationen einsehen"
Description: "Versicherter ruft per GET seine erteilte Einwilligung (Consent) beim TiFlow-Fachdienst ab, gefiltert nach der KVNR aus dem ACCESS_TOKEN"
Usage: #example
* type = #searchset
* insert DateTimeStamp(timestamp)
* total = 1
* entry.fullUrl = "https://erp-dev.zentral.erp.splitdns.ti-dienste.de/Consent/Example-GEM-ERPCHRG-Consent-GET-Response"
* entry.resource = Example-GEM-ERPCHRG-Consent-GET-Response


Instance: Example-GEM-ERPCHRG-Consent-GET-Response
InstanceOf: GEM_ERPCHRG_PR_Consent
Title: "Die Erteilte Einwilligung"
Description: "Consent-Ressource des TiFlow-Fachdienstes"
Usage: #example
* insert Consent