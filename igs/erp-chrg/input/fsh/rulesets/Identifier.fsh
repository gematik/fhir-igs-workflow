RuleSet: PKV_Identifier(field)
* {field}.value = "P987654321"
* {field}.system = $identifier-kvid-10

RuleSet: ApoTelematikID(field)
* {field}.system = $identifier-telematik-id
* {field}.value = "3-2-APO-XanthippeVeilchenblau01"

RuleSet: AccessCode(field)
* {field}.value = "555bjf73jr8d9si2ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"

RuleSet: InlineExample(sliceName, instanceName, rawUuid)
* entry[{sliceName}].fullUrl = "urn:uuid:{rawUuid}"
* entry[{sliceName}].resource = {instanceName}