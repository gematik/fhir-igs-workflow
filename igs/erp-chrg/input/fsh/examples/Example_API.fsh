// TODO: Validate and replace placeholder examples used by gematik-api blocks in pagecontent.

Instance: Example-ChargeItem-Bundle
InstanceOf: Bundle
Usage: #example
Title: "ChargeItem searchset response for ERP-CHRG"
Description: "Example response for GET /ChargeItem"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/ChargeItem?_count=1"
* entry[+].fullUrl = "https://erp-ref.example.org/ChargeItem/Example-GEM-ERPCHRG-ChargeItem"
* entry[=].resource = Example-GEM-ERPCHRG-ChargeItem
* entry[=].search.mode = #match

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

// POST Request
Instance: POST-ChargeItem-Request
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Usage: #example
* contained = Example-DispenseItem-Binary
* insert ChargeItem
* supportingInformation[dispenseItemBinary] = Reference(Example-DispenseItem-Binary)

Instance: Example-DispenseItem-Binary
InstanceOf: Binary
Usage: #inline
* contentType = #application/pkcs7-mime
* data = "RGllcyBpc3QgZWluIEJlaXNwaWVs"

// POST Response
Instance: POST-ChargeItem-Response
InstanceOf: GEM_ERPCHRG_PR_ChargeItem
Usage: #example
* meta.id = "ChargeItem-erp-chargeItem-04-POST-ChargeItem-Response"
* insert ChargeItem
* supportingInformation[prescriptionItemBundle] = Reference(Example-KBV-PKV-Verordnungsdatensatz)
* supportingInformation[receiptBundle] = Reference(Example-GEM-ERP-Bundle)
* supportingInformation[dispenseItemBundle] = Reference(Example-DAV-PKV-Abgabedatensatz)