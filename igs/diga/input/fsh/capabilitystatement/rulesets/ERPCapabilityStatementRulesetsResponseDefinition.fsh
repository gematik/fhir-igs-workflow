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

RuleSet: PatchInteractionStatusCodes
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

RuleSet: TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert Successful
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted

RuleSet: TaskCreateOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulCreated
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted
* rest.resource[=].operation[=] insert SvcValidationFailed

RuleSet: TaskNoContentOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert InvalidRequest
* rest.resource[=].operation[=] insert ResourceIsNotKnown
* rest.resource[=].operation[=] insert ResourceWasDeleted

RuleSet: TaskSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: TaskReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: TaskPatchInteractionStatusCodes
* insert PatchInteractionStatusCodes

RuleSet: TaskActivateOperationStatusCodes
* insert TaskPostOperationStatusCodes
* insert SvcValidationFailed
* insert TiflowAccesscodeMismatch
* insert TiflowAlternativeIkForbidden
* insert TiflowAuthRoleNotAllowed
* insert TiflowCoverageTypeMismatch
* insert TiflowFlowtypeMismatch
* insert TiflowIknrInvalid
* insert TiflowKvnrInvalid
* insert TiflowLanrZanrInvalid
* insert TiflowRxPznInvalid
* insert TiflowSignatureAuthoredonMismatch
* insert TiflowSignatureInvalid
* insert TiflowSignatureInvalidIssuingRole
* insert TiflowTaskStatusMismatch
* insert TiflowCertificateInvalid
* insert TiflowErezeptPznInvalid

RuleSet: TaskAcceptOperationStatusCodes
* insert TaskPostOperationStatusCodes
* insert TiflowAccesscodeMismatch
* insert TiflowAuthRoleNotAllowed
* insert TiflowTaskDeleted
* insert TiflowTaskExpired
* insert TiflowTaskStatusMismatch

RuleSet: TaskRejectOperationStatusCodes
* insert TaskNoContentOperationStatusCodes
* insert TiflowInvalidTaskStatus
* insert TiflowSecretMismatch
* insert TiflowAuthRoleNotAllowed
* insert TiflowTaskStatusMismatch

RuleSet: TaskCloseOperationStatusCodes
* insert TaskPostOperationStatusCodes
* insert SvcValidationFailed
* insert TiflowInvalidMedicationDispense
* insert TiflowInvalidTaskStatus
* insert TiflowSecretMismatch
* insert TiflowSignatureNoOcspResponse
* insert TiflowAuthRoleNotAllowed
* insert TiflowMedicationDispenseInvalid
* insert TiflowTaskStatusMismatch

RuleSet: TaskAbortOperationStatusCodes
* insert TaskNoContentOperationStatusCodes
* insert SvcIdentityMismatch
* insert TiflowAccesscodeMismatch
* insert TiflowAuthRoleNotAllowed
* insert TiflowTaskStatusMismatch

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

