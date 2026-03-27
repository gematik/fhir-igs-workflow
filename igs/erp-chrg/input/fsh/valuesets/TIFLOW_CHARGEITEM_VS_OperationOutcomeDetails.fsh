ValueSet: TIFLOWChargeItemOperationOutcomeDetailsVS
Id: tiflow-chargeitem-operation-outcome-details-vs
Title: "TIFLOW ChargeItem Operation Outcome Details VS"
Description: "Abrechnungsinformationen-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert ValueSet(tiflow-chargeitem-operation-outcome-details-vs)
* include codes from system TIFLOWChargeItemOperationOutcomeDetailsCS
* include $tiflow-core-oo-cs#TIFLOW_AUTH_ROLE_NOT_ALLOWED
* include $ti-oo#SVC_IDENTITY_MISMATCH
* include $ti-oo#SVC_VALIDATION_FAILED
* include $tiflow-core-oo-cs#TIFLOW_CONSENT_ALREADY_EXISTS
* include $tiflow-core-oo-cs#TIFLOW_CONSENT_CATEGORY_REQUIRED
* include $tiflow-core-oo-cs#TIFLOW_CONSENT_CATEGORY_INVALID
* include $tiflow-core-oo-cs#TIFLOW_ACCESSCODE_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_TASK_REQUIRED
* include $tiflow-core-oo-cs#TIFLOW_TASK_NOT_FOUND
* include $tiflow-core-oo-cs#TIFLOW_SECRET_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_CONSENT_REQUIRED
* include $tiflow-core-oo-cs#TIFLOW_OCSP_BACKEND_ERROR
* include $tiflow-core-oo-cs#TIFLOW_MESSAGE_TO_SELF
* include $tiflow-core-oo-cs#TIFLOW_COMMUNICATION_PAYLOAD_INVALID
* include $tiflow-core-oo-cs#TIFLOW_INSURANT_NOT_ELIGIBLE
* include $tiflow-core-oo-cs#TIFLOW_RECIPIENT_INVALID
* include $tiflow-core-oo-cs#TIFLOW_TASK_STATUS_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_TASK_EXPIRED
* include $tiflow-core-oo-cs#TIFLOW_MVO_NOT_VALID_YET
