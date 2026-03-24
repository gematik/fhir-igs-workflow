
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

RuleSet: CreateInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulCreated
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: DeleteInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulNoContent
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: SystemLevelOperationStatusCodes
* rest.operation[=] insert Unauthorized
* rest.operation[=] insert UnknownSearchParameter
* rest.operation[=] insert InvalidQueryParameters
* rest.operation[=] insert InvalidRequest
* rest.operation[=] insert MethodNotAllowed
* rest.operation[=] insert RequestTimeout
* rest.operation[=] insert TooManyRequests
* rest.operation[=] insert InternalServerError

RuleSet: SystemLevelOperationStatusCodesWithParameters
* rest.operation[=] insert SuccessfulWithParameters
* insert SystemLevelOperationStatusCodes

RuleSet: SystemLevelQueryOperationStatusCodesWithNormalSuccess
* rest.operation[=] insert Successful
* insert SystemLevelOperationStatusCodes

RuleSet: TaskSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: TaskReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: ConsentSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: ConsentCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: ConsentDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

RuleSet: GrantEUAccessPermissionOperationStatusCodes
* insert SystemLevelOperationStatusCodesWithParameters

RuleSet: ReadEUAccessPermissionOperationStatusCodes
* insert SystemLevelOperationStatusCodesWithParameters

RuleSet: RevokeEUAccessPermissionOperationStatusCodes
* insert SystemLevelQueryOperationStatusCodesWithNormalSuccess

RuleSet: GetEUPrescriptionsOperationStatusCodes
* insert SystemLevelOperationStatusCodesWithParameters
