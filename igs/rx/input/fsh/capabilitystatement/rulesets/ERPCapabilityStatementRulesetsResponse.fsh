RuleSet: Successful
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"

RuleSet: SuccessfulCreated
* extension[responseInfo][+]
  * extension[statusCode].valueString = "201"
  * extension[description].valueString = "Resource created"

RuleSet: SuccessfulNoContent
* extension[responseInfo][+]
  * extension[statusCode].valueString = "204"
  * extension[description].valueString = "Successful operation without response body"

RuleSet: UnknownSearchParameter
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Unknown search parameter"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_PARAM_UNKNOWN"

RuleSet: InvalidQueryParameters
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid query parameter(s)"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_BAD_SYNTAX"

RuleSet: InvalidRequest
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid request"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_BAD_FORMAT"

RuleSet: UnknownResourceType
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Unknown resource type"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_UNKNOWN_TYPE"

RuleSet: Unauthorized
* extension[responseInfo][+]
  * extension[statusCode].valueString = "401"
  * extension[description].valueString = "Authentication is required and has failed or has not yet been provided"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_AUTH_REQUIRED"

RuleSet: MethodNotAllowed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "405"
  * extension[description].valueString = "Method not allowed for this endpoint"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_OP_NOT_ALLOWED"

RuleSet: RequestTimeout
* extension[responseInfo][+]
  * extension[statusCode].valueString = "408"
  * extension[description].valueString = "Request timeout"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_TIMEOUT"

RuleSet: TooManyRequests
* extension[responseInfo][+]
  * extension[statusCode].valueString = "429"
  * extension[description].valueString = "Too many requests"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_RATE_LIMIT"

RuleSet: InternalServerError
* extension[responseInfo][+]
  * extension[statusCode].valueString = "500"
  * extension[description].valueString = "Internal server error"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_INTERNAL_ERROR"

RuleSet: ResourceIsNotKnown
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Resource is not known"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_RESOURCE_ID_FAIL"

RuleSet: ResourceWasDeleted
* extension[responseInfo][+]
  * extension[statusCode].valueString = "410"
  * extension[description].valueString = "Resource was deleted"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_DELETED"

RuleSet: TiflowInvalidTaskStatus
* extension[responseInfo][+]
  * extension[statusCode].valueString = "412 - Precondition Failed"
  * extension[description].valueString = "TODO: add description for TIFLOW_INVALID_TASK_STATUS"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_INVALID_TASK_STATUS"

RuleSet: TiflowSecretMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "Task secret mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_SECRET_MISMATCH"

RuleSet: SvcValidationFailed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: description for SVC_VALIDATION_FAILED"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "SVC_VALIDATION_FAILED"

RuleSet: TiflowInvalidMedicationDispense
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Unzulässige Dispensierinformationen"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_INVALID_MEDICATION_DISPENSE"

RuleSet: TiflowMedicationDispenseMissing
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "MedicationDispense missing"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_MEDICATION_DISPENSE_MISSING"

RuleSet: TiflowSignatureNoOcspResponse
* extension[responseInfo][+]
  * extension[statusCode].valueString = "503 - Service Unavailable"
  * extension[description].valueString = "No OCSP response for signature"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_SIGNATURE_NO_OCSP_RESPONSE"

RuleSet: TiflowAuthRoleNotAllowed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "Access role not allowed"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_AUTH_ROLE_NOT_ALLOWED"

RuleSet: TiflowTaskStatusMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Task status mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_TASK_STATUS_MISMATCH"

RuleSet: TiflowMedicationDispenseInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "MedicationDispense invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_MEDICATION_DISPENSE_INVALID"

RuleSet: SvcIdentityMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "TODO: description for SVC_IDENTITY_MISMATCH"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "SVC_IDENTITY_MISMATCH"

RuleSet: TiflowAccesscodeMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "Access code mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_ACCESSCODE_MISMATCH"

RuleSet: TiflowCoverageTypeMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Coverage type mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_COVERAGE_TYPE_MISMATCH"

RuleSet: TiflowFlowtypeMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Flow type mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_FLOWTYPE_MISMATCH"

RuleSet: TiflowIknrInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "IKNR invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_IKNR_INVALID"

RuleSet: TiflowKvnrInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "KVNR invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_KVNR_INVALID"

RuleSet: TiflowLanrZanrInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "LANR or ZANR invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_LANR_ZANR_INVALID"

RuleSet: TiflowRxDrugCategoryForbidden
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_DRUG_CATEGORY_FORBIDDEN"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_DRUG_CATEGORY_FORBIDDEN"

RuleSet: TiflowRxMvoEnddateInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_MVO_ENDDATE_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_MVO_ENDDATE_INVALID"

RuleSet: TiflowRxMvoFlowtypeInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_MVO_FLOWTYPE_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_MVO_FLOWTYPE_INVALID"

RuleSet: TiflowRxMvoIdInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_MVO_ID_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_MVO_ID_INVALID"

RuleSet: TiflowRxMvoInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_MVO_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_MVO_INVALID"

RuleSet: TiflowRxMvoStartdateInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_MVO_STARTDATE_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_MVO_STARTDATE_INVALID"

RuleSet: TiflowRxPznInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_PZN_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_PZN_INVALID"

RuleSet: TiflowSignatureAuthoredonMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Signature authoredOn mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH"

RuleSet: TiflowSignatureInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Signature invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_SIGNATURE_INVALID"

RuleSet: TiflowSignatureInvalidIssuingRole
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Signature issuing role invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE"

RuleSet: TiflowRxMvoNotValid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "TODO: add description for TIFLOW_RX_MVO_NOT_VALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_RX_MVO_NOT_VALID"

RuleSet: TiflowTaskDeleted
* extension[responseInfo][+]
  * extension[statusCode].valueString = "410 - Gone"
  * extension[description].valueString = "Task deleted"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_TASK_DELETED"

RuleSet: TiflowTaskExpired
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Task expired"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_TASK_EXPIRED"

RuleSet: TiflowCertificateInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Certificate invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_CERTIFICATE_INVALID"

RuleSet: TiflowErezeptDrugCategoryForbidden
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "Drug category forbidden"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN"

RuleSet: TiflowErezeptMvoEnddateInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "MVO end date invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_MVO_ENDDATE_INVALID"

RuleSet: TiflowErezeptMvoFlowtypeInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "MVO flow type invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID"

RuleSet: TiflowErezeptMvoIdInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "MVO id invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_MVO_ID_INVALID"

RuleSet: TiflowErezeptMvoInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "MVO invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_MVO_INVALID"

RuleSet: TiflowErezeptMvoStartdateInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "MVO start date invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_MVO_STARTDATE_INVALID"

RuleSet: TiflowErezeptPznInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "PZN invalid"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_PZN_INVALID"

RuleSet: TiflowErezeptMvoNotValid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "MVO not valid yet"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_EREZEPT_MVO_NOT_VALID"

RuleSet: TiflowOcspBackendError
* extension[responseInfo][+]
  * extension[statusCode].valueString = "512 - OCSP Backend Error"
  * extension[description].valueString = "Invalid OCSP response"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_OCSP_BACKEND_ERROR"
