// Errors for all Resource Endpoints
RuleSet: GlobalErrorsStatusCodes
* rest.resource[=].interaction[=] insert TiflowTimeout
* rest.resource[=].interaction[=] insert TiflowInternalError

// Query-API Interactions
RuleSet: ReadInteractionStatusCodes
// * rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
// * rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: PatchInteractionStatusCodes
// * rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
// * rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: DeleteInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulNoContent
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
// * rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: CreateInteractionStatusCodes
// * rest.resource[=].interaction[=] insert SuccessfulCreated
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: SearchTypeInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulWithBundle
* rest.resource[=].interaction[=] insert UnknownSearchParameter
* rest.resource[=].interaction[=] insert InvalidQueryParameters
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: InstanceOperationfullURLValidate
* insert ResourceIsNotKnown

RuleSet: InstanceOperationStatusCodes
* insert ResourceIsNotKnown
* insert SvcIdentityMismatch
* insert ResourceWasDeleted

// Konkrete Operationen

// Task/$create
RuleSet: TaskCreateOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulCreatedWithResponseType("Parameters")
// * rest.resource[=].operation[=] insert SuccessfulCreated
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes


RuleSet: TaskSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes
* insert GlobalErrorsStatusCodes

RuleSet: TaskReadInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulWithResponseType("Task")
* insert ReadInteractionStatusCodes
* rest.resource[=].interaction[=] insert SvcIdentityMismatch
* rest.resource[=].interaction[=] insert ResourceWasDeleted
* insert GlobalErrorsStatusCodes

RuleSet: TaskPatchInteractionStatusCodes
* rest.resource[=].interaction[=] insert SuccessfulWithResponseType("Task")
* insert ReadInteractionStatusCodes
* rest.resource[=].interaction[=] insert SvcIdentityMismatch
* rest.resource[=].interaction[=] insert SvcValidationFailed
* rest.resource[=].interaction[=] insert TiflowNotActivated
* rest.resource[=].interaction[=] insert ResourceWasDeleted
* insert GlobalErrorsStatusCodes


RuleSet: TaskActivateOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulWithResponseType("Parameters")
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
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
* rest.resource[=].operation[=] insert TiflowErezeptDrugCategoryForbidden
* rest.resource[=].operation[=] insert TiflowErezeptMvoEnddateInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoFlowtypeInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoIdInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoInvalid
* rest.resource[=].operation[=] insert TiflowErezeptMvoStartdateInvalid
* rest.resource[=].operation[=] insert TiflowErezeptPznInvalid
* rest.resource[=].operation[=] insert TiflowOcspBackendError
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes


RuleSet: TaskAcceptOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulWithResponseType("Bundle")
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
// * rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowTaskDeleted
* rest.resource[=].operation[=] insert TiflowTaskExpired
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert TiflowErezeptMvoNotValid
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskRejectOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert TiflowSecretMismatch
// * rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskCloseOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulWithResponseType("Parameters")
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowMedicationDispenseMissing
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowSignatureNoOcspResponse
* rest.resource[=].operation[=] insert TiflowMedicationDispenseInvalid
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
// * rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes


RuleSet: TaskAbortOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert SvcIdentityMismatch
* rest.resource[=].operation[=] insert TiflowAccesscodeMismatch
// * rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowSecretMismatch
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes

RuleSet: TaskDispenseOperationStatusCodes
* rest.resource[=].operation[=] insert SuccessfulNoContent
* rest.resource[=].operation[=] insert SvcValidationFailed
// * rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowSecretMismatch
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
* rest.resource[=].interaction[=] insert SuccessfulWithResponseType("MedicationDispense")
* insert ReadInteractionStatusCodes

// EU-spezifische Status-Codes (grenzüberschreitender Datenaustausch)

RuleSet: GlobalSystemOperationErrorCodes

* insert InvalidRequest

RuleSet: SystemOperationStatusCodesWithParameters
* insert SuccessfulWithParameters
* insert GlobalSystemOperationErrorCodes

RuleSet: SystemQueryOperationStatusCodesWithNormalSuccess
* insert Successful
* insert GlobalSystemOperationErrorCodes

// Consent Query-API Interactions

RuleSet: ConsentSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes


RuleSet: ConsentCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: ConsentDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

// EU Operationen

RuleSet: GrantEUAccessPermissionOperationStatusCodes
* rest.operation[=] insert SystemOperationStatusCodesWithParameters
* rest.operation[=] insert TiflowAccessCodeInvalid
* rest.operation[=] insert TiflowConsentRequired
* rest.operation[=] insert TiflowErezeptCountryCodeInvalid

// * rest.operation[=] insert TiflowAuthRoleNotAllowed

RuleSet: ReadEUAccessPermissionOperationStatusCodes
* rest.operation[=] insert SystemOperationStatusCodesWithParameters

// * rest.operation[=] insert TiflowAuthRoleNotAllowed

RuleSet: RevokeEUAccessPermissionOperationStatusCodes
* rest.operation[=] insert SystemQueryOperationStatusCodesWithNormalSuccess

// * rest.operation[=] insert TiflowAuthRoleNotAllowed

RuleSet: GetEUPrescriptionsOperationStatusCodes
* rest.operation[=] insert SystemOperationStatusCodesWithParameters
* rest.operation[=] insert SvcValidationFailed
* rest.operation[=] insert TiflowAccessPermissionInvalid
// * rest.operation[=] insert TiflowAuthRoleNotAllowed
* rest.operation[=] insert TiflowConsentRequired
* rest.operation[=] insert TiflowErezeptNoPrescriptionsFound

RuleSet: EuCloseOperationStatusCodes
* rest.resource[=].operation[=] insert SvcValidationFailed
* rest.resource[=].operation[=] insert TiflowAccessPermissionInvalid
// * rest.resource[=].operation[=] insert TiflowAuthRoleNotAllowed
* rest.resource[=].operation[=] insert TiflowConsentMissing
* rest.resource[=].operation[=] insert TiflowTaskStatusMismatch
* rest.resource[=].operation[=] insert InstanceOperationStatusCodes
