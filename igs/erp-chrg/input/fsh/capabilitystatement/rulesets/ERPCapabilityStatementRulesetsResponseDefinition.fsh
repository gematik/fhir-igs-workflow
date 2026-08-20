// Errors for all Resource Endpoints
RuleSet: GlobalQueryErrorCodes

* rest.resource[=].interaction[=] insert InvalidRequest

* rest.resource[=].interaction[=] insert RequestTimeout

* rest.resource[=].interaction[=] insert InternalServerError

// Query-API Interactions
RuleSet: ReadInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownResourceType
* rest.resource[=].interaction[=] insert ResourceIsNotKnown
* rest.resource[=].interaction[=] insert ResourceWasDeleted

RuleSet: SearchTypeInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Successful
* rest.resource[=].interaction[=] insert UnknownSearchParameter
* rest.resource[=].interaction[=] insert InvalidQueryParameters
* rest.resource[=].interaction[=] insert UnknownResourceType

RuleSet: CreateInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert SuccessfulCreated

RuleSet: UpdateInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Successful

RuleSet: PatchInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert Successful

RuleSet: DeleteInteractionStatusCodes
* insert GlobalQueryErrorCodes
* rest.resource[=].interaction[=] insert SuccessfulNoContent


RuleSet: TaskSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: TaskReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

// ChargeItem
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

//Communication
RuleSet: CommunicationSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: CommunicationReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: CommunicationCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: CommunicationDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes

//Consent
RuleSet: ConsentSearchTypeInteractionStatusCodes
* insert SearchTypeInteractionStatusCodes

RuleSet: ConsentReadInteractionStatusCodes
* insert ReadInteractionStatusCodes

RuleSet: ConsentCreateInteractionStatusCodes
* insert CreateInteractionStatusCodes

RuleSet: ConsentDeleteInteractionStatusCodes
* insert DeleteInteractionStatusCodes