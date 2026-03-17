RuleSet: ImportCapabilityStatment (capabilityStatement, expectation)
* imports[+] = Canonical({capabilityStatement})
* imports[=].extension[0].url = $capabilitystatement-expectation
* imports[=].extension[0].valueCode = {expectation}


RuleSet: CapSupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].versioning = #versioned-update
* rest.resource[=].readHistory = true
* rest.resource[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].extension[0].valueCode = {expectation}

// RuleSet: CapProfile (profile, expectation)
// * rest.resource[=].profile = Canonical({profile})
// * rest.resource[=].profile.extension[0].url = $capabilitystatement-expectation
// * rest.resource[=].profile.extension[0].valueCode = {expectation}

RuleSet: CapProfile (profile)
* rest.resource[=].profile = Canonical({profile})


RuleSet: CapSupportProfile (profile, expectation)
* rest.resource[=].supportedProfile[+] = Canonical({profile})
* rest.resource[=].supportedProfile[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: CapSupportProfileUrl(profileUrl, expectation)
* rest.resource[=].supportedProfile[+] = "{profileUrl}"
* rest.resource[=].supportedProfile[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: CapResourceInteraction (interaction, expectation)
* rest.resource[=] insert CapInteraction({interaction}, {expectation})

RuleSet: CapSystemRestInteraction (interaction, expectation)
* rest insert CapInteraction({interaction}, {expectation})

RuleSet: CapInteraction (interaction, expectation)
* interaction[+]
  * code = {interaction}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceSearchParam (name, canonical, type, expectation, documentation)
* rest.resource[=] insert CapSupportSearchParam ({name}, {canonical}, {type}, {expectation}, {documentation})

RuleSet: CapSupportResourceSearchParamNoDefinition (name, type, expectation, documentation)
* rest.resource[=].searchParam[+]
  * name = "{name}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportSearchParam (name, canonical, type, expectation, documentation)
* searchParam[+]
  * name = "{name}"
  * definition = "{canonical}"
  * type = {type}
  * documentation = {documentation}
  * extension[0].url = $capabilitystatement-expectation
  * extension[0].valueCode = {expectation}

RuleSet: CapSupportCustomSearchParam (name, instance, type, expectation, documentation)
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = Canonical({instance})
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].documentation = {documentation}
* rest.resource[=].searchParam[=].extension[0].url = $capabilitystatement-expectation
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}

RuleSet: CapSupportResourceOperation(name, operation, expectation)
* rest.resource[=] insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportSystemOperation(name, operation, expectation)
* rest insert CapSupportOperation({name}, {operation}, {expectation})

RuleSet: CapSupportOperation(name, operation, expectation)
* operation[+]
  * name = "{name}"
  * definition = Canonical({operation})
  * extension.url = $capabilitystatement-expectation
  * extension.valueCode = {expectation}
