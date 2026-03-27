ValueSet: TIFLOWXBORDEROperationOutcomeDetailsVS
Id: tiflow-xborder-operation-outcome-details-vs
Title: "TIFLOW XBORDER Operation Outcome Details VS"
Description: "Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert ValueSet(tiflow-xborder-operation-outcome-details-vs)
* include codes from system TIFLOWXBORDEROperationOutcomeDetailsCS
* include $tiflow-core-oo-cs#TIFLOW_AUTH_ROLE_NOT_ALLOWED
* include $ti-oo#SVC_VALIDATION_FAILED
* include $tiflow-core-oo-cs#TIFLOW_CONSENT_REQUIRED
* include $tiflow-core-oo-cs#TIFLOW_ACCESS_PERMISSION_INVALID
* include $ti-oo#SVC_TELEMATIKID_TEMPORARILY_BLOCKED
* include $tiflow-core-oo-cs#TIFLOW_AUTH_NOT_OWNER
* include $tiflow-core-oo-cs#TIFLOW_ACCESSCODE_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_TASK_STATUS_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_TASK_ID_REQUIRED
* include $tiflow-core-oo-cs#TIFLOW_KVNR_MISMATCH
* include $tiflow-core-oo-cs#TIFLOW_CONSENT_MISSING
* include $tiflow-core-oo-cs#TIFLOW_ACCESS_CODE_INVALID
