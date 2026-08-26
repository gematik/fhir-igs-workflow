CodeSystem: TIFLOWEREZEPTOperationOutcomeDetailsCS
Id: tiflow-erezept-operation-outcome-details-cs
Title: "TIFLOW EREZEPT Operation Outcome Details CS"
Description: "E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert Meta-CS
* #TIFLOW_EREZEPT_PZN_INVALID "PZN invalid" "The provided PZN is invalid or not permitted in the current processing context"
  * ^designation.language = #de-DE
  * ^designation.value = "PZN ungültig"
* #TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN "Drug category forbidden" "The prescription contains a forbidden medication category, for example BTM"
  * ^designation.language = #de-DE
  * ^designation.value = "Arzneimittelkategorie nicht zulässig"
* #TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID "MVO flow type invalid" "A multiple prescription is not allowed for the addressed flow type"
  * ^designation.language = #de-DE
  * ^designation.value = "MVO-Flowtyp ungültig"
* #TIFLOW_EREZEPT_MVO_INVALID "MVO invalid" "The multiple prescription metadata is inconsistent or violates MVO constraints"
  * ^designation.language = #de-DE
  * ^designation.value = "Mehrfachverordnung ungültig"
* #TIFLOW_EREZEPT_MVO_STARTDATE_INVALID "MVO start date invalid" "The start date of the multiple prescription redemption period is missing or invalid"
  * ^designation.language = #de-DE
  * ^designation.value = "MVO-Startdatum ungültig"
* #TIFLOW_EREZEPT_MVO_ENDDATE_INVALID "MVO end date invalid" "The end date of the multiple prescription redemption period is invalid"
  * ^designation.language = #de-DE
  * ^designation.value = "MVO-Enddatum ungültig"
* #TIFLOW_EREZEPT_MVO_ID_INVALID "MVO id invalid" "The multiple prescription id does not match the required identifier schema"
  * ^designation.language = #de-DE
  * ^designation.value = "MVO-ID ungültig"
* #TIFLOW_EREZEPT_MVO_NOT_VALID "MVO not valid yet" "The multiple prescription part is not redeemable yet because its redemption period has not started"
  * ^designation.language = #de-DE
  * ^designation.value = "Teilverordnung noch nicht einlösbar"
* #TIFLOW_EREZEPT_NO_PRESCRIPTIONS_FOUND "No prescriptions found" "No redeemable prescriptions were found for the requested query scope"
  * ^designation.language = #de-DE
  * ^designation.value = "Keine einlösbaren Verordnungen gefunden"
* #TIFLOW_EREZEPT_NOT_ACTIVATED "EU redemption not activated" "The addressed task is not activated for EU redemption"
  * ^designation.language = #de-DE
  * ^designation.value = "EU-Einlösung nicht aktiviert"
* #TIFLOW_EREZEPT_COUNTRY_CODE_INVALID "Country code invalid" "The provided country code is not supported for ePrescription or eDispensation processing"
  * ^designation.language = #de-DE
  * ^designation.value = "Ländercode ungültig"
