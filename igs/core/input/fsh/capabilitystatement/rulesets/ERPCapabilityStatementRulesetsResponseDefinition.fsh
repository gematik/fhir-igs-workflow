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

RuleSet: SystemLevelPostOperation
* rest.operation[=] insert SuccessfulWithParameters
* rest.operation[=] insert IDTokenCheck

// Operations on Type and Instance Level ([base]/Task/$operation or [base]/Task/[resId]/$operation)

RuleSet: TypeLevelPostOperation
* rest.resource[=].operation[=] insert SuccessfulWithParameters
* rest.resource[=].operation[=] insert IDTokenCheck


RuleSet: TaskPostOperationStatusCodes //TODO: Alle Fehlercodes überarbeiten
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

RuleSet: UpdateInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: PatchInteractionStatusCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert InvalidRequest
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

// Resource-specific wrappers for interaction-level status codes.
// These wrappers make it easy to add endpoint-specific codes without changing shared baselines.

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
* insert TiflowAuthRoleNotAllowed
* insert TiflowFlowtypeMismatch
* insert TiflowIknrInvalid
* insert TiflowKvnrInvalid
* insert TiflowLanrZanrInvalid
* insert TiflowRxPznInvalid
* insert TiflowSignatureAuthoredonMismatch
* insert TiflowSignatureInvalid
* insert TiflowTaskStatusMismatch

RuleSet: TaskAcceptOperationStatusCodes
* insert TaskPostOperationStatusCodes
* insert TiflowAccesscodeMismatch
* insert TiflowTaskDeleted
* insert TiflowTaskExpired
* insert TiflowTaskStatusMismatch

RuleSet: TaskRejectOperationStatusCodes
* insert TaskNoContentOperationStatusCodes
* insert TiflowInvalidTaskStatus
* insert TiflowSecretMismatch
* insert TiflowTaskStatusMismatch

RuleSet: TaskCloseOperationStatusCodes
* insert TaskPostOperationStatusCodes
* insert SvcValidationFailed
* insert TiflowInvalidTaskStatus
* insert TiflowSecretMismatch
* insert TiflowSignatureNoOcspResponse
* insert TiflowTaskStatusMismatch

RuleSet: TaskAbortOperationStatusCodes
* insert TaskNoContentOperationStatusCodes
* insert SvcIdentityMismatch
* insert TiflowAccesscodeMismatch
* insert TiflowTaskStatusMismatch

RuleSet: TaskDispenseOperationStatusCodes
* insert TaskPostOperationStatusCodes

RuleSet: ChargeItemSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: ChargeItemReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: ChargeItemCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: ChargeItemUpdateInteractionStatusCodes
* insert UpdateInteractionStatusCodes

RuleSet: ChargeItemPatchInteractionStatusCodes
* insert PatchInteractionStatusCodes

RuleSet: ChargeItemDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

RuleSet: ConsentSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: ConsentCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: ConsentDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

RuleSet: CommunicationSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: CommunicationReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: CommunicationCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: CommunicationDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

RuleSet: AuditEventSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: AuditEventReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: MedicationDispenseSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: DeviceSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: SubscriptionSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: SubscriptionCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

