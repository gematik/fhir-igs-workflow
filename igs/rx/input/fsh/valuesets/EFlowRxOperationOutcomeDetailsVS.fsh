ValueSet: EFlowRxOperationOutcomeDetailsVS
Id: eflow-rx-operationoutcomedetails
Title: "GEM ERP VS OperationOutcomeDetails"
Description: "Fachliche Fehlercodes des E-Rezept-Fachdienst"
* insert ValueSet

// Include all from this Repository
* include codes from system EFlowRxOperationOutcomeDetailsCS

//TODO: Includes from HL7 Operation Outcome
* include $hl7-oo#MSG_AUTH_REQUIRED "You must authenticate before you can use this service"

//TODO: Includes from TI OperationOutcome
* include $ti-oo#SVC_INACTIVE_CODE "Use of inactive code not permitted"
