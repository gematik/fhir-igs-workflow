
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
* insert Unauthorized
* insert InvalidRequest
* insert MethodNotAllowed
* insert RequestTimeout
* insert TooManyRequests
* insert InternalServerError

RuleSet: SystemOperationStatusCodesWithParameters
* insert SuccessfulWithParameters
* insert GlobalSystemOperationErrorCodes

RuleSet: SystemQueryOperationStatusCodesWithNormalSuccess
* insert Successful
* insert GlobalSystemOperationErrorCodes

// Errors for all Resource Operations
RuleSet: GlobalOperationErrorCodes
* insert Unauthorized
* insert InvalidRequest
* insert MethodNotAllowed
* insert RequestTimeout
* insert TooManyRequests
* insert InternalServerError

RuleSet: InstanceOperationStatusCodes
* insert ResourceIsNotKnown
* insert ResourceWasDeleted
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
* rest.operation[=] insert SystemOperationStatusCodesWithParameters
* rest.operation[=] insert TiflowAccessCodeInvalid
* rest.operation[=] insert TiflowConsentRequired
* rest.operation[=] insert TiflowXborderCountryCodeInvalid

RuleSet: ReadEUAccessPermissionOperationStatusCodes
* rest.operation[=] insert SystemOperationStatusCodesWithParameters

RuleSet: RevokeEUAccessPermissionOperationStatusCodes
* rest.operation[=] insert SystemQueryOperationStatusCodesWithNormalSuccess

RuleSet: GetEUPrescriptionsOperationStatusCodes
* rest.operation[=] insert SystemOperationStatusCodesWithParameters
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
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes
