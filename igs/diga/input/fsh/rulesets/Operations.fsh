RuleSet: OperationResource(resource, affectsState, system, type, instance)
* insert Meta-Instance
* kind = #operation
* affectsState = {affectsState}
* resource = #{resource}
* system = {system}
* type = {type}
* instance = {instance}



RuleSet: Task162Exension
* extension[flowType].valueCoding = $cs-flowtype#162 "Flowtype für Digitale Gesundheitsanwendungen"
* insert DiGAExpiryDate(extension[acceptDate].valueDate) // Expiry, weil so festgelegt beide Daten 3 Monate
* insert DiGAExpiryDate(extension[expiryDate].valueDate)

RuleSet: TaskIdentifier(flowType)
* identifier[PrescriptionID].use = #official
* identifier[PrescriptionID].value = "{flowType}.000.000.000.000.01"

RuleSet: TaskMiscInfo
* insert DateTime(authoredOn)
* insert DateTimeStamp(lastModified)