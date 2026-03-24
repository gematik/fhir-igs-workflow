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
* rest.operation[=] insert SuccessfulWithParameters
* rest.operation[=] insert IDTokenCheck
* rest.operation[=] insert OrgHeaderProfileMismatch


// Operations on Type and Instance Level ([base]/Medication/$operation or [base]/Medication/[resId]/$operation)

RuleSet: TypeLevelPostOperation
* rest.resource[=].operation[=] insert SuccessfulWithParameters
* rest.resource[=].operation[=] insert IDTokenCheck
* rest.resource[=].operation[=] insert OrgHeaderProfileMismatch

RuleSet: TaskSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: TaskReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: ChargeItemSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: ChargeItemReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: CommunicationSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: CommunicationReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: ConsentSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: ConsentReadInteractionStatusCodes
* insert ReadInteractionStatusCodes