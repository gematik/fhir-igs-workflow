RuleSet: OperationResource(resource, affectsState, system, type, instance)
* insert Meta-Instance
* kind = #operation
* affectsState = {affectsState}
* resource = #{resource}
* system = {system}
* type = {type}
* instance = {instance}


RuleSet: DiGA_Task(status)
* status = #{status}
* insert Task162Exension
* extension[flowType].valueCoding.display = "Muster 16 (Digitale Gesundheitsanwendungen)"
* insert TaskIdentifier(162)
* insert GKV_Identifier(for.identifier)
* insert TaskMiscInfo
* performerType = $GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.59 "Kostenträger"
* performerType.text = "Kostenträger"

RuleSet: Task162Exension
* extension[flowType].valueCoding = $GEM_ERP_CS_FlowType#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* insert DiGAExpiryDate(extension[acceptDate].valueDate) // Expiry, weil so festgelegt beide Daten 3 Monate
* insert DiGAExpiryDate(extension[expiryDate].valueDate)

RuleSet: TaskIdentifier(flowType)
* identifier[PrescriptionID].use = #official
* identifier[PrescriptionID].value = "{flowType}.000.000.000.000.01"

RuleSet: GKV_Identifier(field)
* insert KVNR({field}.value)
* {field}.system = "http://fhir.de/sid/gkv/kvid-10"

RuleSet: TaskMiscInfo
* insert DateTime(authoredOn)
* insert DateTimeStamp(lastModified)