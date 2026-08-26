RuleSet: KVNR(field)
* {field} = "X123456789"

RuleSet: GKV_Identifier(field)
* insert KVNR({field}.value)
* {field}.system = $identifier-kvid-10
* {field}.assigner.identifier.value = "168140950"

RuleSet: ApoTelematikID(field)
* {field}.system = $identifier-telematik-id
* {field}.value = "3-2-APO-XanthippeVeilchenblau01"

RuleSet: TaskExension(flowType)
* extension[flowType].valueCoding = $cs-flowtype#{flowType}