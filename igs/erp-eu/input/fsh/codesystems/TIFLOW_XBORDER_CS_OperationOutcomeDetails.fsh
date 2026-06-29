CodeSystem: TIFLOWXBORDEROperationOutcomeDetailsCS
Id: tiflow-xborder-operation-outcome-details-cs
Title: "TIFLOW XBORDER Operation Outcome Details CS"
Description: "Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert CodeSystem(tiflow-xborder-operation-outcome-details-cs)
* #TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND "No prescriptions found" "No redeemable prescriptions were found for the requested query scope"
  * ^designation.language = #de-DE
  * ^designation.value = "Keine einlösbaren Verordnungen gefunden"
* #TIFLOW_XBORDER_NOT_ACTIVATED "EU redemption not activated" "The addressed task is not activated for EU redemption"
  * ^designation.language = #de-DE
  * ^designation.value = "EU-Einlösung nicht aktiviert"
* #TIFLOW_XBORDER_COUNTRY_CODE_INVALID "Country code invalid" "The provided country code is not supported for ePrescription or eDispensation processing"
  * ^designation.language = #de-DE
  * ^designation.value = "Ländercode ungültig"
