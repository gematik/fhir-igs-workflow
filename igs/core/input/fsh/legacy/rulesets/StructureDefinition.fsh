RuleSet: LegacyERPUrl(type, name)
* ^url = "https://gematik.de/fhir/erp/{type}/{name}"

RuleSet: StructureDefinition(name)
* insert LegacyERPUrl(StructureDefinition, {name})
* insert Meta