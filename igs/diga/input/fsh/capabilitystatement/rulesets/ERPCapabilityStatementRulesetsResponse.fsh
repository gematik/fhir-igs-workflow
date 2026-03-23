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

RuleSet: SuccessfulWithBundle
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
  * extension[responseType].valueString = "Bundle"

RuleSet: SuccessfulWithParameters
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"
  * extension[responseType].valueString = "Parameters"

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

RuleSet: IDTokenCheck
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403"
  * extension[description].valueString = "ID-Token or Insurant-ID mismatch"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "SVC_IDENTITY_MISMATCH"

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

RuleSet: EmptyList
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "No Resource found matching the query"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_NO_MATCH"

RuleSet: DosageInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid dosage structure or content"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "TIFLOW_DOSAGE_INVALID"

RuleSet: OpNotAllowed
* extension[responseInfo][+]
  * extension[statusCode].valueString = "405"
  * extension[description].valueString = "Operation %s not allowed for resource %s"
  * extension[responseType].valueString = "TIFlowOperationOutcome"
  * extension[errorCode].valueString = "MSG_OP_NOT_ALLOWED"
