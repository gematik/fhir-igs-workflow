Extension: EFlowRxRedeemCodeExtension
Id: eflow-rx-redeemcode-extension
Title: "GEM ERP EX RedeemCode"
Description: "Gibt den Einlösecode für eine DiGA an."
* insert StructureDefinition(GEM_ERP_EX_RedeemCode)
* ^context[0].type = #element
* ^context[=].expression = "MedicationDispense"
* value[x] only string
  * ^short = "Gibt den Einlösecode für eine DiGA an."
