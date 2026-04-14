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

RuleSet: PatchInteractionStatusCodes
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

RuleSet: TypeOperationStatusCodes
* insert OpNotAllowed
* insert UnknownResourceType
* insert GlobalOperationErrorCodes

// Konkrete Operationen

// Task/$create
RuleSet: TaskCreateOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulCreated
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TypeOperationStatusCodes
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed

RuleSet: TaskSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: TaskReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: TaskPatchInteractionStatusCodes
* insert PatchInteractionStatusCodes

RuleSet: TaskActivateOperationStatusCodes
* rest.resource[=].operation[=] insert Successful
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
* rest.resource[=].operation[=] insert TiflowAlternativeIkForbidden
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowCoverageTypeMismatch
* rest.resource[=].operation[=] insert TiflowFlowtypeMismatch
* rest.resource[=].operation[=] insert TiflowIknrInvalid
* rest.resource[=].operation[=] insert TiflowKvnrInvalid
* rest.resource[=].operation[=] insert TiflowLanrZanrInvalid
* rest.resource[=].operation[=] insert TiflowSignatureAuthoredonMismatch
* rest.resource[=].operation[=] insert TiflowSignatureInvalid
* rest.resource[=].operation[=] insert TiflowSignatureInvalidIssuingRole
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert TiflowCertificateInvalid
* rest.resource[=].operation[=] insert TiflowErezeptPznInvalid
* rest.resource[=].operation[=] insert TiflowOcspBackendError
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskAcceptOperationStatusCodes
* rest.resource[=].operation[=] insert Successful
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowTaskDeleted
* rest.resource[=].operation[=] insert TiflowTaskExpired
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskRejectOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskCloseOperationStatusCodes
* rest.resource[=].operation[=] insert Successful
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowSignatureNoOcspResponse
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowMedicationDispenseInvalid
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskAbortOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert SvcIdentityMismatch
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: CommunicationSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: CommunicationReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: CommunicationCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: CommunicationDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

RuleSet: MedicationDispenseSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: MedicationDispenseReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

