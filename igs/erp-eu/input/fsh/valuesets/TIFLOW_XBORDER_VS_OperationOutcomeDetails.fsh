ValueSet: TIFLOWXBORDEROperationOutcomeDetailsVS
Id: tiflow-xborder-operation-outcome-details-vs
Title: "TIFLOW XBORDER Operation Outcome Details VS"
Description: "Fehlercodes für cross-border Szenarien, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert ValueSet(tiflow-xborder-operation-outcome-details-vs)
* include codes from system TIFLOWXBORDEROperationOutcomeDetailsCS
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_AUTH_ROLE_NOT_ALLOWED "Access role not allowed"
* include TIOperationOutcomeDetailsCS#SVC_VALIDATION_FAILED "FHIR Profile Validation Failed"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_CONSENT_REQUIRED "Consent required"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_ACCESS_PERMISSION_INVALID "Access permission invalid"
* include TIOperationOutcomeDetailsCS#SVC_TELEMATIKID_TEMPORARILY_BLOCKED "The specified Telematik-ID is temporarily blocked"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_AUTH_NOT_OWNER "Authenticated actor is not owner"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_ACCESSCODE_MISMATCH "Access code mismatch"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_TASK_STATUS_MISMATCH "Task status mismatch"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_TASK_ID_REQUIRED "Task id required"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_KVNR_MISMATCH "KVNR mismatch"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_CONSENT_MISSING "Consent missing"
* include TIFLOWOperationOutcomeDetailsCS#TIFLOW_ACCESS_CODE_INVALID "Access code invalid"
