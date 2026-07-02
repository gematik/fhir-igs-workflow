RuleSet: Profile(name)
* ^url = "https://gematik.de/fhir/tiflow-bfarm/StructureDefinition/{name}"
* insert Versioning

RuleSet: Instance(resourcetype, resname)
* url = "https://gematik.de/fhir/tiflow-bfarm/{resourcetype}/{resname}"
* insert InstanceVersioning
* name = "{resname}"
* experimental = false
