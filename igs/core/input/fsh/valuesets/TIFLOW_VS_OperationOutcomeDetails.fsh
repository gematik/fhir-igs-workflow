ValueSet: TIFLOWOperationOutcomeDetailsVS
Id: tiflow-operation-outcome-details-vs
Title: "TIFLOW Operation Outcome Details VS"
Description: "Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert ValueSet(tiflow-operation-outcome-details-vs)
* include codes from system TIFLOWOperationOutcomeDetailsCS
* include $ti-oo#SVC_IDENTITY_MISMATCH "Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)"
* include $ti-oo#SVC_VALIDATION_FAILED "FHIR Profile Validation Failed"
* include $ti-oo#SVC_TELEMATIKID_TEMPORARILY_BLOCKED "The specified Telematik-ID is temporarily blocked"
* include $ti-oo#SVC_INVALID_ACCESS_TOKEN "Invalid access token provided"
* include $hl7-oo#MSG_RESOURCE_ID_MISMATCH "Resource Id Mismatch"
* include $hl7-oo#MSG_RESOURCE_ID_MISSING "Resource Id Missing"
* include $hl7-oo#MSG_RESOURCE_ID_FAIL "unable to allocate resource id"
