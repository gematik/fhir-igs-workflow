Instance: Example-GET-MedicationDispense-Response-Name-And-PZN
InstanceOf: Bundle
Usage: #example
Title: "MedicationDispense searchset response for DiGA"
Description: "Example response for GET /MedicationDispense in DiGA workflow"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/MedicationDispense?whenhandedover=ge2026-03-01"
* entry[+].fullUrl = "https://erp-ref.example.org/MedicationDispense/Example-MedicationDispense-DiGA-Name-And-PZN"
* entry[=].resource = Example-MedicationDispense-DiGA-Name-And-PZN
* entry[=].search.mode = #match

Instance: Example-GET-MedicationDispense-Response-DeepLink
InstanceOf: Bundle
Usage: #example
Title: "MedicationDispense searchset response for DiGA with a deep link."
Description: "Example response for GET /MedicationDispense in DiGA workflow with a deep link."
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/MedicationDispense?whenhandedover=ge2026-03-01"
* entry[+].fullUrl = "https://erp-ref.example.org/MedicationDispense/Example-MedicationDispense-DiGA-DeepLink"
* entry[=].resource = Example-MedicationDispense-DiGA-DeepLink
* entry[=].search.mode = #match

Instance: Example-GET-MedicationDispense-Response-NoRedeemCode
InstanceOf: Bundle
Usage: #example
Title: "MedicationDispense searchset response for DiGA without a redeem code."
Description: "Example response for GET /MedicationDispense in DiGA workflow without a redeem code."
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/MedicationDispense?whenhandedover=ge2026-03-01"
* entry[+].fullUrl = "https://erp-ref.example.org/MedicationDispense/Example-MedicationDispense-DiGA-NoRedeemCode"
* entry[=].resource = Example-MedicationDispense-DiGA-NoRedeemCode
* entry[=].search.mode = #match