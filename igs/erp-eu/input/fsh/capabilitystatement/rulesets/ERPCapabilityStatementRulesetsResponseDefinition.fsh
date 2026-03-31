
// Errors for all Resource Endpoints
RuleSet: GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Unauthorized
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert MethodNotAllowed
* rest.resource[=].interaction[=] insert RequestTimeout
* rest.resource[=].interaction[=] insert TooManyRequests
* rest.resource[=].interaction[=] insert InternalServerError

// Query-API Interactions
RuleSet: ReadInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: DeleteInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert SuccessfulNoContent
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: CreateInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert SuccessfulCreated
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: SearchTypeInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownSearchParameter
* rest.resource[=].interaction[=] insert InvalidQueryParameters
* rest.resource[=].interaction[=] insert UnknownResourceType

// Operation-API Error-Constellations

// Errors for all System Operations
RuleSet: GlobalSystemOperationErrorCodes
* rest.operation[=] insert Unauthorized
* rest.operation[=] insert InvalidRequest
* rest.operation[=] insert MethodNotAllowed
* rest.operation[=] insert RequestTimeout
* rest.operation[=] insert TooManyRequests
* rest.operation[=] insert InternalServerError

RuleSet: SystemOperationStatusCodesWithParameters
* rest.operation[=] insert SuccessfulWithParameters
* insert GlobalSystemOperationErrorCodes

RuleSet: SystemQueryOperationStatusCodesWithNormalSuccess
* rest.operation[=] insert Successful
* insert GlobalSystemOperationErrorCodes

// Errors for all Resource Operations
RuleSet: GlobalOperationErrorCodes
* rest.resource[=].operation[=] insert Unauthorized
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert MethodNotAllowed
* rest.resource[=].operation[=] insert RequestTimeout
* rest.resource[=].operation[=] insert TooManyRequests
* rest.resource[=].operation[=] insert InternalServerError

RuleSet: InstanceOperationStatusCodes
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* insert GlobalOperationErrorCodes

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
* insert SystemOperationStatusCodesWithParameters
* rest.operation[=] insert TiflowAccessCodeInvalid
* rest.operation[=] insert TiflowConsentRequired
* rest.operation[=] insert TiflowXborderCountryCodeInvalid

RuleSet: ReadEUAccessPermissionOperationStatusCodes
* insert SystemOperationStatusCodesWithParameters

RuleSet: RevokeEUAccessPermissionOperationStatusCodes
* insert SystemQueryOperationStatusCodesWithNormalSuccess

RuleSet: GetEUPrescriptionsOperationStatusCodes
* insert SystemOperationStatusCodesWithParameters
* rest.operation[=] insert SvcValidationFailed
* rest.operation[=] insert TiflowAccessPermissionInvalid
* rest.operation[=] insert TiflowAuthRoleNotAllowed
* rest.operation[=] insert TiflowConsentRequired
* rest.operation[=] insert TiflowXborderNoPrescriptionsFound

RuleSet: EuCloseOperationStatusCodes
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowAccessPermissionInvalid
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowConsentMissing
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* insert InstanceOperationStatusCodes
