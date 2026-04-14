CodeSystem: TIFLOWChargeItemOperationOutcomeDetailsCS
Id: tiflow-chargeitem-operation-outcome-details-cs
Title: "TIFLOW ChargeItem Operation Outcome Details CS"
Description: "Abrechnungsinformationen-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* #TIFLOW_CHARGEITEM_COVERAGE_NOT_PKV "Coverage not PKV" "The referenced prescription coverage type is not PKV and therefore not valid for ChargeItem processing"
  * ^designation.language = #de-DE
  * ^designation.value = "Kostenträgertyp nicht PKV"
* #TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID "Dispense signature invalid" "The PKV dispense dataset is missing a valid signature or contains an invalid signature"
  * ^designation.language = #de-DE
  * ^designation.value = "Signatur des PKV-Abgabedatensatzes ungültig"
* #TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID "Dispense certificate invalid" "The certificate used for the signature of the PKV dispense dataset is invalid, expired, or revoked"
  * ^designation.language = #de-DE
  * ^designation.value = "Zertifikat des PKV-Abgabedatensatzes ungültig"
* #TIFLOW_CHARGEITEM_ID_REQUIRED "ChargeItem id required" "The operation requires a concrete ChargeItem id in the request path"
  * ^designation.language = #de-DE
  * ^designation.value = "ChargeItem-ID erforderlich"
* #TIFLOW_CHARGEITEM_NOT_FOUND "ChargeItem not found" "The referenced ChargeItem resource does not exist"
  * ^designation.language = #de-DE
  * ^designation.value = "ChargeItem nicht gefunden"
