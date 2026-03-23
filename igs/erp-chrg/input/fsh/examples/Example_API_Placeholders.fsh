// TODO: Validate and replace placeholder examples used by gematik-api blocks in pagecontent.

Instance: ExampleERPCHRGChargeItemSearchset
InstanceOf: Bundle
Usage: #example
Title: "ChargeItem searchset response for ERP-CHRG"
Description: "Example response for GET /ChargeItem"
* id = "ExampleERPCHRGChargeItemSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/ChargeItem?_count=1"
* entry[+].fullUrl = "https://erp-ref.example.org/ChargeItem/ChargeItem-GET-Completed"
* entry[=].resource = ChargeItem-GET-Completed
* entry[=].search.mode = #match

Instance: ExampleERPCHRGCommunicationSearchset
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for ERP-CHRG"
Description: "Example response for GET /Communication"
* id = "ExampleERPCHRGCommunicationSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Communication_ChargChangeRequest"
* entry[=].resource = Communication_ChargChangeRequest
* entry[=].search.mode = #match

Instance: ExampleERPCHRGConsentSearchset
InstanceOf: Bundle
Usage: #example
Title: "Consent searchset response for ERP-CHRG"
Description: "Example response for GET /Consent"
* id = "ExampleERPCHRGConsentSearchset"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Consent?category=CHARGCONS"
* entry[+].fullUrl = "https://erp-ref.example.org/Consent/ChargeItemConsent-Response"
* entry[=].resource = ChargeItemConsent-Response
* entry[=].search.mode = #match
