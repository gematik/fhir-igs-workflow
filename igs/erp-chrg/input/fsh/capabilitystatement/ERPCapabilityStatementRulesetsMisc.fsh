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

RuleSet: Error423Locked
* extension[responseInfo][+]
  * extension[statusCode].valueString = "423"
  * extension[description].valueString = "If the insurant objected to the medication process or objected to the submission of prescription and dispensation data into the ePA system, the Medication Service is locked."
  * extension[responseType].valueString = "application/json"
  * extension[errorCode].valueString = "locked"

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

RuleSet: IDTokenCheck
* extension[responseInfo][+]
  * extension[statusCode].valueString = "403"
  * extension[description].valueString = "ID-Token or Insurant-ID mismatch"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "SVC_IDENTITY_MISMATCH"

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


RuleSet: EmptyList
* extension[responseInfo][+]
  * extension[statusCode].valueString = "404"
  * extension[description].valueString = "No Resource found matching the query"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MSG_NO_MATCH"

RuleSet: DosageInvalid
* extension[responseInfo][+]
  * extension[statusCode].valueString = "400"
  * extension[description].valueString = "Invalid dosage structure or content"
  * extension[responseType].valueString = "EPAMSOperationOutcome"
  * extension[errorCode].valueString = "MEDSVC_DOSAGE_INVALID"


RuleSet: ImportCapabilityStatment (capabilityStatement, expectation)
* imports[+] = capabilityStatement
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = {expectation}


RuleSet: CapSupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].extension[0].valueCode = {expectation}

// RuleSet: CapProfile (profile, expectation)
// * rest.resource[=].profile = Canonical({profile})
// * rest.resource[=].profile.extension[0].url = $capabilitystatement-expectation
// * rest.resource[=].profile.extension[0].valueCode = {expectation}

RuleSet: CapProfile (profile)
* rest.resource[=].profile = Canonical({profile})


RuleSet: CapSupportProfile (profile, expectation)
* rest.resource[=].supportedProfile[+] = Canonical({profile})
* rest.resource[=].supportedProfile[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: CapSupportProfileUrl (profile, expectation)
* rest.resource[=].supportedProfile[+] = {profile}
* rest.resource[=].supportedProfile[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: CapResourceInteraction (interaction, expectation)
* rest.resource[=] insert CapInteraction({interaction}, {expectation})

RuleSet: CapSystemRestInteraction (interaction, expectation)
* rest insert CapInteraction({interaction}, {expectation})

RuleSet: CapInteraction (interaction, expectation)
* interaction[+]
  * code = {interaction}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParam (name, canonical, type, expectation, documentation)
* rest.resource[=] insert CapSupportSearchParam ({name}, {canonical}, {type}, {expectation}, {documentation})

RuleSet: CapSupportResourceSearchParamNoDefinition (name, type, expectation, documentation)
* rest.resource[=].searchParam[+]
  * name = "{name}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportSearchParam (name, canonical, type, expectation, documentation)
* searchParam[+]
  * name = "{name}"
  * definition = "{canonical}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportCustomSearchParam (name, instance, type, expectation, documentation)
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = Canonical({instance})
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].documentation = {documentation}
* rest.resource[=].searchParam[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}

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


RuleSet: HistoryInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType


RuleSet: SearchTypeInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert Unauthorized
* rest.resource[=].interaction[=] insert UnknownSearchParameter
* rest.resource[=].interaction[=] insert InvalidQueryParameters
* rest.resource[=].interaction[=] insert MethodNotAllowed
* rest.resource[=].interaction[=] insert RequestTimeout
* rest.resource[=].interaction[=] insert TooManyRequests
* rest.resource[=].interaction[=] insert InternalServerError
* rest.resource[=].interaction[=] insert UnknownResourceType


RuleSet: ReadInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert Unauthorized
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert MethodNotAllowed
* rest.resource[=].interaction[=] insert RequestTimeout
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted
* rest.resource[=].interaction[=] insert TooManyRequests
* rest.resource[=].interaction[=] insert InternalServerError


// RuleSet: SystemLevelOperationStatusCodes
// * rest.operation[=] insert Successful

RuleSet: SystemLevelOperationStatusCodes
* rest.operation[=] insert Unauthorized
* rest.operation[=] insert UnknownSearchParameter
* rest.operation[=] insert InvalidQueryParameters
* rest.operation[=] insert InvalidRequest
* rest.operation[=] insert MethodNotAllowed
* rest.operation[=] insert RequestTimeout
* rest.operation[=] insert TooManyRequests
* rest.operation[=] insert InternalServerError

RuleSet: SystemLevelOperationStatusCodesWithBundle
* rest.operation[=] insert SuccessfulWithBundle
* insert SystemLevelOperationStatusCodes


RuleSet: SystemLevelQueryOperationStatusCodesWithNormalSuccess
* rest.operation[=] insert Successful
* insert SystemLevelOperationStatusCodes


RuleSet: SystemLevelOperationStatusCodesWithParameters
* rest.operation[=] insert SuccessfulWithParameters
* insert SystemLevelOperationStatusCodes

RuleSet: SystemLevelOperationStatusCodesEmptyIdTokenCheck
* rest.operation[=] insert IDTokenCheck

RuleSet: SystemLevelOperationStatusCodesEmptyList
* rest.operation[=] insert EmptyList

RuleSet: SystemLevelOperationStatusCodesGeteMP
* insert SystemLevelOperationStatusCodesEmptyList
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert EMPNoExist


RuleSet: SystemLevelPostOperation
* rest.operation[=] insert X-Requesting-Organization(true)
* rest.operation[=] insert SuccessfulWithParameters
* rest.operation[=] insert IDTokenCheck
* rest.operation[=] insert OrgHeaderProfileMismatch


RuleSet: SystemLevelPostEMLOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter


RuleSet: SystemLevelUpdateEMLOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert VersionAwareConflict
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert OpNotAllowed
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter


RuleSet: SystemLevelPostEMPOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter
* rest.operation[=] insert EMPChronologyIdMismatch
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert ResourceWasDeleted
* rest.operation[=] insert EMPEntryAlreadyExists


// RuleSet: SystemLevelPostEMPByMedicationReferenceOperation
// * insert SystemLevelPostOperation
// * rest.operation[=] insert ResourceIsNotKnown
// * rest.operation[=] insert ResourceWasDeleted
// * rest.operation[=] insert DosageInvalid
// * rest.operation[=] insert NoValidStructure
// * rest.operation[=] insert WrongStatusParameter
// * rest.operation[=] insert EMPChronologyIdMismatch


RuleSet: SystemLevelUpdateEMPOperation
* insert SystemLevelPostOperation
* rest.operation[=] insert VersionAwareConflict
* rest.operation[=] insert ResourceIsNotKnown
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert WrongStatusParameter
* rest.operation[=] insert EMPChronologyIdMismatch


RuleSet: SystemLevelPostBatchEMPOperation
* rest.operation[=] insert X-Requesting-Organization(true)
* rest.operation[=] insert SuccessfulWithBundle
* rest.operation[=] insert InvalidRequest
* rest.operation[=] insert EMPChronologyIdMismatch
* rest.operation[=] insert DosageInvalid
* rest.operation[=] insert NoValidStructure
* rest.operation[=] insert OrgHeaderProfileMismatch
* rest.operation[=] insert WrongStatusParameter
* rest.operation[=] insert VersionAwareConflict
* rest.operation[=] insert ResourceIsNotKnown


RuleSet: SystemLevelPostEMPCommitOperation
// * rest.operation[=] insert X-Requesting-Organization(true)
* rest.operation[=] insert SuccessfulWithParameters
* rest.operation[=] insert OperationOutsideBatch
* rest.operation[=] insert EMPChronologyIdMismatch

// Operations on Type and Instance Level ([base]/Medication/$operation or [base]/Medication/[resId]/$operation)

RuleSet: TypeLevelPostOperation
* rest.resource[=].operation[=] insert X-Requesting-Organization(true)
* rest.resource[=].operation[=] insert SuccessfulWithParameters
* rest.resource[=].operation[=] insert IDTokenCheck
* rest.resource[=].operation[=] insert OrgHeaderProfileMismatch


RuleSet: TypeLevelPostEMLOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert NoValidStructure
* rest.resource[=].operation[=] insert DosageInvalid
* rest.resource[=].operation[=] insert WrongStatusParameter


RuleSet: TypeLevelCancelEMLOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert OpNotAllowed


RuleSet: TypeLevelLinkEMPOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert NoValidStructure
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert WrongStatusParameter
* rest.resource[=].operation[=] insert EMPLinkingNotSuccessful
* rest.resource[=].operation[=] insert AlreadyLinked


RuleSet: TypeLevelUnlinkEMPOperation
* insert TypeLevelPostOperation
* rest.resource[=].operation[=] insert NoValidStructure
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert OpNotAllowed
* rest.resource[=].operation[=] insert EMPUnlinkingNotSuccessful