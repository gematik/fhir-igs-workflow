RuleSet: Successful
* extension[responseInfo][+]
  * extension[statusCode].valueString = "200"
  * extension[description].valueString = "Successful operation"

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

RuleSet: CapSupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].extension[0].valueCode = {expectation}

RuleSet: CapSupportProfileUrl (profile, expectation)
* rest.resource[=].supportedProfile[+] = {profile}
* rest.resource[=].supportedProfile[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: CapResourceInteraction (interaction, expectation)
* rest.resource[=] insert CapInteraction({interaction}, {expectation})

RuleSet: CapInteraction (interaction, expectation)
* interaction[+]
  * code = {interaction}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParamNoDefinition (name, type, expectation, documentation)
* rest.resource[=].searchParam[+]
  * name = "{name}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceOperation(name, operation, expectation)
* rest.resource[=] insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportSystemOperation(name, operation, expectation)
* rest insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportOperation(name, operation, expectation)
* operation[+]
  * name = "{name}"
  * definition = Canonical({operation})
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = {expectation}

RuleSet: SearchTypeInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownSearchParameter
* rest.resource[=].interaction[=] insert InvalidQueryParameters
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: ReadInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: SystemLevelOperationStatusCodes
* rest.operation[=] insert UnknownSearchParameter
* rest.operation[=] insert InvalidQueryParameters
* rest.operation[=] insert InvalidRequest

RuleSet: SystemLevelOperationStatusCodesWithParameters
* rest.operation[=] insert SuccessfulWithParameters
* insert SystemLevelOperationStatusCodes

RuleSet: SystemLevelQueryOperationStatusCodesWithNormalSuccess
* rest.operation[=] insert Successful
* insert SystemLevelOperationStatusCodes
