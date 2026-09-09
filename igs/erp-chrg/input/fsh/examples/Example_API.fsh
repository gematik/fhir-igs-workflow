Instance: Example-Communication-Bundle
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for ERP-CHRG"
Description: "Example response for GET /Communication"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Example-Communication-ChargChangeReq"
* entry[=].resource = Example-Communication-ChargChangeReq
* entry[=].search.mode = #match

Instance: Example-Consent-Bundle
InstanceOf: Bundle
Usage: #example
Title: "Consent searchset response for ERP-CHRG"
Description: "Example response for GET /Consent"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Consent?category=CHARGCONS"
* entry[+].fullUrl = "https://erp-ref.example.org/Consent/Example-GEM-ERPCHRG-Consent"
* entry[=].resource = Example-GEM-ERPCHRG-Consent
* entry[=].search.mode = #match