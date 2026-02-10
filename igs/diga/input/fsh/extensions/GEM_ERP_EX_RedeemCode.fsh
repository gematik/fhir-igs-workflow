Extension: EFlowRxRedeemCodeExtension
Id: eflow-rx-redeemcode-extension
Title: "GEM ERP EX RedeemCode"
Description: "Gibt den Einloesecode fuer eine DiGA an."
* insert Versioning
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* value[x] only string
  * ^short = "Gibt den Einloesecode fuer eine DiGA an."
