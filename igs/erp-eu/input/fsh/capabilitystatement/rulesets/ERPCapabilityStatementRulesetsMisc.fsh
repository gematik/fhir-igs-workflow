RuleSet: CapSupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[+].url = $capabilitystatement-expectation
* rest.resource[=].extension[=].valueCode = {expectation}

RuleSet: CapSupportProfileUrl (profile, expectation)
* rest.resource[=].supportedProfile[+] = {profile}
* rest.resource[=].supportedProfile[=].extension[+].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[=].valueCode = {expectation}

RuleSet: CapResourceInteraction (interaction, expectation)
* rest.resource[=] insert CapInteraction({interaction}, {expectation})

RuleSet: CapInteraction (interaction, expectation)
* interaction[+]
  * code = {interaction}
  * extension[+].url = $capabilitystatement-expectation
  * extension[=].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParam (name, canonical, type, expectation, documentation)
* rest.resource[=] insert CapSupportSearchParam ({name}, {canonical}, {type}, {expectation}, {documentation})

RuleSet: CapSupportSearchParam (name, canonical, type, expectation, documentation)
* searchParam[+]
  * name = "{name}"
  * definition = "{canonical}"
  * type = {type}
  * documentation = {documentation}
  * extension[+].url = $capabilitystatement-expectation
  * extension[=].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParamNoDefinition (name, type, expectation, documentation)
* rest.resource[=].searchParam[+]
  * name = "{name}"
  * type = {type}
  * documentation = {documentation}
  * extension[+].url = $capabilitystatement-expectation
  * extension[=].valueCode = {expectation}

RuleSet: CapSupportResourceOperation(name, operation, expectation, documentation)
* rest.resource[=] insert CapSupportOperation({name}, {operation}, {expectation}, {documentation})

RuleSet: CapSupportSystemOperation(name, operation, expectation, documentation)
* rest insert CapSupportOperation({name}, {operation}, {expectation}, {documentation})

RuleSet: CapSupportOperation(name, operation, expectation, documentation)
* operation[+]
  * name = "{name}"
  * definition = Canonical({operation})
  * documentation = {documentation}
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = {expectation}
