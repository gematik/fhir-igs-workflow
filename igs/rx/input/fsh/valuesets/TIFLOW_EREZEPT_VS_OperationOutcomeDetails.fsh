ValueSet: TIFLOWEREZEPTOperationOutcomeDetailsVS
Id: tiflow-erezept-operation-outcome-details-vs
Title: "TIFLOW EREZEPT Operation Outcome Details VS"
Description: "E-Rezept-spezifische Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert ValueSet(tiflow-erezept-operation-outcome-details-vs)
* include codes from system TIFLOWEREZEPTOperationOutcomeDetailsCS
* include $tiflow-core-oo-cs#TIFLOW_AUTH_ROLE_NOT_ALLOWED
* include $tiflow-core-oo-cs#TIFLOW_SECRET_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_TASK_STATUS_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_MEDICATION_DISPENSE_INVALID
* include $tiflow-core-oo-cs#TIFLOW_MEDICATION_DISPENSE_MISSING
* include $ti-oo#SVC_VALIDATION_FAILED
* include $tiflow-core-oo-cs#TIFLOW_SIGNATURE_NO_OCSP_RESPONSE
* include $ti-oo#SVC_IDENTITY_MISMATCH
* include $ti-oo#SVC_TELEMATIKID_TEMPORARILY_BLOCKED
* include $tiflow-core-oo-cs#TIFLOW_AUTH_NOT_OWNER
* include $tiflow-core-oo-cs#TIFLOW_ACCESSCODE_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_TASK_ID_REQUIRED
* include $tiflow-core-oo-cs#TIFLOW_KVNR_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE
* include $tiflow-core-oo-cs#TIFLOW_FLOWTYPE_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_COVERAGE_TYPE_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_CERTIFICATE_INVALID
* include $tiflow-core-oo-cs#TIFLOW_OCSP_BACKEND_ERROR
* include $tiflow-core-oo-cs#TIFLOW_SIGNATURE_INVALID
* include $tiflow-core-oo-cs#TIFLOW_KVNR_INVALID
* include $tiflow-core-oo-cs#TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_IKNR_INVALID
* include $tiflow-core-oo-cs#TIFLOW_LANR_ZANR_INVALID
* include $tiflow-core-oo-cs#TIFLOW_TASK_DELETED
* include $tiflow-core-oo-cs#TIFLOW_TASK_EXPIRED
* include $tiflow-core-oo-cs#TIFLOW_MESSAGE_TO_SELF
* include $tiflow-core-oo-cs#TIFLOW_COMMUNICATION_PAYLOAD_INVALID
* include $tiflow-core-oo-cs#TIFLOW_INSURANT_NOT_ELIGIBLE
* include $tiflow-core-oo-cs#TIFLOW_RECIPIENT_INVALID
* include $tiflow-core-oo-cs#TIFLOW_TASK_NOT_FOUND
* include $tiflow-core-oo-cs#TIFLOW_MVO_NOT_VALID_YET
