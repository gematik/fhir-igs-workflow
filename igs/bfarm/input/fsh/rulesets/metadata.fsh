RuleSet: Profile(name)
* ^url = "https://gematik.de/fhir/erp-t-prescription/StructureDefinition/{name}"
* insert Versioning

RuleSet: Instance(resourcetype, resname)
* url = "https://gematik.de/fhir/erp-t-prescription/{resourcetype}/{resname}"
* insert InstanceVersioning
* name = "{resname}"
* experimental = false