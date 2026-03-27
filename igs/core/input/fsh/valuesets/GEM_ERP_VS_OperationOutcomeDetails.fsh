ValueSet: GEM_ERP_VS_OperationOutcomeDetails
Id: GEM-ERP-VS-OperationOutcomeDetails
Title: "GEM ERP VS OperationOutcomeDetails"
Description: "Fachliche Fehlercodes des E-Rezept-Fachdienst"
* insert ValueSet(GEM_ERP_VS_OperationOutcomeDetails)

// Include all from this Repository
* include codes from system GEM_ERP_CS_OperationOutcomeDetails

//TODO: Includes from HL7 Operation Outcome
* include $hl7-oo#MSG_AUTH_REQUIRED "You must authenticate before you can use this service"

//TODO: Includes from TI OperationOutcome
* include $ti-oo#SVC_INACTIVE_CODE "Use of inactive code not permitted"
* include $ti-oo#SVC_VALIDATION_FAILED "TODO: description for SVC_VALIDATION_FAILED"
* include $ti-oo#SVC_IDENTITY_MISMATCH "TODO: description for SVC_IDENTITY_MISMATCH"
* include $ti-oo#SVC_TELEMATIKID_TEMPORARILY_BLOCKED "TODO: description for SVC_TELEMATIKID_TEMPORARILY_BLOCKED"
* include $ti-oo#SVC_INVALID_ACCESS_TOKEN "TODO: description for SVC_INVALID_ACCESS_TOKEN"
* include $hl7-oo#MSG_RESOURCE_ID_MISMATCH "TODO: description for MSG_RESOURCE_ID_MISMATCH"
* include $hl7-oo#MSG_RESOURCE_ID_MISSING "TODO: description for MSG_RESOURCE_ID_MISSING"
* include $hl7-oo#MSG_RESOURCE_ID_FAIL "TODO: description for MSG_RESOURCE_ID_FAIL"
* include $ExternalCS#OperationOutcome.issue.details.coding.code "TODO: description for OperationOutcome.issue.details.coding.code"
