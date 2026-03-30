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

RuleSet: TaskActivateOperationStatusCodes
* insert TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowCoverageTypeMismatch
* rest.resource[=].operation[=] insert TiflowFlowtypeMismatch
* rest.resource[=].operation[=] insert TiflowIknrInvalid
* rest.resource[=].operation[=] insert TiflowKvnrInvalid
* rest.resource[=].operation[=] insert TiflowLanrZanrInvalid
* rest.resource[=].operation[=] insert TiflowRxDrugCategoryForbidden
* rest.resource[=].operation[=] insert TiflowRxMvoEnddateInvalid
* rest.resource[=].operation[=] insert TiflowRxMvoFlowtypeInvalid
* rest.resource[=].operation[=] insert TiflowRxMvoIdInvalid
* rest.resource[=].operation[=] insert TiflowRxMvoInvalid
* rest.resource[=].operation[=] insert TiflowRxMvoStartdateInvalid
* rest.resource[=].operation[=] insert TiflowRxPznInvalid
* rest.resource[=].operation[=] insert TiflowSignatureAuthoredonMismatch
* rest.resource[=].operation[=] insert TiflowSignatureInvalid
* rest.resource[=].operation[=] insert TiflowSignatureInvalidIssuingRole
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert TiflowCertificateInvalid
* rest.resource[=].operation[=] insert TiflowErezeptDrugCategoryForbidden
* rest.resource[=].operation[=] insert TiflowErezeptMvoEnddateInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoFlowtypeInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoIdInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoStartdateInvalid
* rest.resource[=].operation[=] insert TiflowErezeptPznInvalid
* rest.resource[=].operation[=] insert TiflowOcspBackendError

RuleSet: TaskAcceptOperationStatusCodes
* insert TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowRxMvoNotValid
* rest.resource[=].operation[=] insert TiflowTaskDeleted
* rest.resource[=].operation[=] insert TiflowTaskExpired
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert TiflowErezeptMvoNotValid

RuleSet: TaskRejectOperationStatusCodes
* insert TaskNoContentOperationStatusCodes
* rest.resource[=].operation[=] insert TiflowInvalidTaskStatus
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch

RuleSet: TaskCloseOperationStatusCodes
* insert TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowInvalidMedicationDispense
* rest.resource[=].operation[=] insert TiflowInvalidTaskStatus
* rest.resource[=].operation[=] insert TiflowMedicationDispenseMissing
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowSignatureNoOcspResponse
* rest.resource[=].operation[=] insert TiflowMedicationDispenseInvalid
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch

RuleSet: TaskAbortOperationStatusCodes
* insert TaskNoContentOperationStatusCodes
* rest.resource[=].operation[=] insert SvcIdentityMismatch
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch

RuleSet: TaskDispenseOperationStatusCodes
* insert TaskPostOperationStatusCodes
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch

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

