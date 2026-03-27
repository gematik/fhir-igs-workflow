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

RuleSet: SuccessfulWithParameters
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
  * extension[responseType].valueString = "Parameters"

RuleSet: UnknownSearchParameter
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Unknown search parameter"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_PARAM_UNKNOWN"

RuleSet: InvalidQueryParameters
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid query parameter(s)"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_BAD_SYNTAX"

RuleSet: InvalidRequest
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid request"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_BAD_FORMAT"

RuleSet: UnknownResourceType
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Unknown resource type"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_UNKNOWN_TYPE"

RuleSet: Unauthorized
* extension[responseInfo][+]
  * extension[statusCode].valueString = "401"
  * extension[description].valueString = "Authentication is required and has failed or has not yet been provided"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_AUTH_REQUIRED"

RuleSet: MethodNotAllowed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "405"
  * extension[description].valueString = "Method not allowed for this endpoint"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_OP_NOT_ALLOWED"

RuleSet: RequestTimeout
* extension[responseInfo][+]
  * extension[statusCode].valueString = "408"
  * extension[description].valueString = "Request timeout"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_TIMEOUT"

RuleSet: Conflict
* extension[responseInfo][+]
  * extension[statusCode].valueString = "409"
  * extension[description].valueString = "Conflict"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_CONFLICT"

RuleSet: ResourceIsNotKnown
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "Resource is not known"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_RESOURCE_ID_FAIL"

RuleSet: ResourceWasDeleted
* extension[responseInfo][+]
  * extension[statusCode].valueString = "410"
  * extension[description].valueString = "Resource was deleted"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_DELETED"

RuleSet: TooManyRequests
* extension[responseInfo][+]
  * extension[statusCode].valueString = "429"
  * extension[description].valueString = "Too many requests"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_RATE_LIMIT"

RuleSet: InternalServerError
* extension[responseInfo][+]
  * extension[statusCode].valueString = "500"
  * extension[description].valueString = "Internal server error"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_INTERNAL_ERROR"

RuleSet: SvcValidationFailed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: description for SVC_VALIDATION_FAILED"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "SVC_VALIDATION_FAILED"

RuleSet: TiflowAccessPermissionInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "TODO: add description for TIFLOW_ACCESS_PERMISSION_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_ACCESS_PERMISSION_INVALID"

RuleSet: TiflowAuthRoleNotAllowed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "TODO: add description for TIFLOW_AUTH_ROLE_NOT_ALLOWED IS BAD"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_AUTH_ROLE_NOT_ALLOWED"

RuleSet: TiflowConsentRequired
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "TODO: add description for TIFLOW_CONSENT_REQUIRED"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_CONSENT_REQUIRED"


RuleSet: TiflowTaskStatusMismatch
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_TASK_STATUS_MISMATCH"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_TASK_STATUS_MISMATCH"

RuleSet: TiflowXborderNoPrescriptionsFound
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404 - Not Found"
  * extension[description].valueString = "TODO: add description for TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND"

RuleSet: TiflowXborderCountryCodeInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "409 - Conflict"
  * extension[description].valueString = "TODO: add description for TIFLOW_XBORDER_COUNTRY_CODE_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_XBORDER_COUNTRY_CODE_INVALID"

RuleSet: TiflowAccessCodeInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400 - Bad Request"
  * extension[description].valueString = "TODO: add description for TIFLOW_ACCESS_CODE_INVALID"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_ACCESS_CODE_INVALID"

RuleSet: TiflowConsentMissing
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403 - Forbidden"
  * extension[description].valueString = "TODO: add description for TIFLOW_CONSENT_MISSING"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_CONSENT_MISSING"
