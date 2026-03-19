RuleSet: CapSupportResource(resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[+].url = $capabilitystatement-expectation
* rest.resource[=].extension[=].valueCode = {expectation}

RuleSet: CapSupportProfileUrl(profileUrl, expectation)
* rest.resource[=].supportedProfile[+] = "{profileUrl}"
* rest.resource[=].supportedProfile[=].extension[+].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[=].valueCode = {expectation}

RuleSet: CapResourceInteraction(interaction, expectation)
* rest.resource[=] insert CapInteraction({interaction}, {expectation})

RuleSet: CapInteraction(interaction, expectation)
* interaction[+]
  * code = {interaction}
  * extension[expectation].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParam(name, canonical, type, expectation, documentation)
* rest.resource[=] insert CapSupportSearchParam({name}, {canonical}, {type}, {expectation}, {documentation})

RuleSet: CapSupportResourceSearchParamNoDefinition(name, type, expectation, documentation)
* rest.resource[=].searchParam[+]
  * name = "{name}"
  * type = {type}
  * documentation = {documentation}
  * extension[+].url = $capabilitystatement-expectation
  * extension[=].valueCode = {expectation}

RuleSet: CapSupportSearchParam(name, canonical, type, expectation, documentation)
* searchParam[+]
  * name = "{name}"
  * definition = "{canonical}"
  * type = {type}
  * documentation = {documentation}
  * extension[+].url = $capabilitystatement-expectation
  * extension[=].valueCode = {expectation}

RuleSet: CapSupportResourceOperation(name, operation, expectation)
* rest.resource[=] insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportOperation(name, operation, expectation)
* operation[+]
  * name = "{name}"
  * definition = "{operation}"
  * extension[expectation].valueCode = {expectation}
