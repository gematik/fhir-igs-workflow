RuleSet: KVNR(field)
* {field} = "X123456789"

RuleSet: GKV_Identifier(field)
* insert KVNR({field}.value)
* {field}.system = $identifier-kvid-10
* {field}.assigner.identifier.value = "168140950"