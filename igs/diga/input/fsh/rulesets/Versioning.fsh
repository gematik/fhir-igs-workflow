RuleSet: StructureDefinition(name)
* ^url = "https://gematik.de/fhir/tiflow/diga/StructureDefinition/{name}" //TODO:verify after naming complete
* insert Versioning

RuleSet: Versioning
* ^status = #draft
* ^version = "0.9.0" //TODO: Verify
* ^date = "2025-09-25"

RuleSet: Version
* version = "0.9.0"
* status = #draft
* date = "2026-03-17"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2026-07-01"

RuleSet: DateTime(field)
* {field} = "2026-07-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2026-07-01T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2026-07-01T16:44:00.434+00:00"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* meta.profile[workflowProfile] = "https://gematik.de/fhir/erp/{profile}|1.6" (exactly)
