// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #active
* ^version = "1.1.1"
* ^date = "2026-01-08"

RuleSet: OperationVersioning
* status = #active
* version = "1.1.1"
* date = "2026-01-08"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2026-10-01"

RuleSet: DateTime(field)
* {field} = "2026-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2026-10-01T15:29:00.434+00:00"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* insert MetaProfileExactly(https://gematik.de/fhir/erp-eu/{profile}, 1.1)

RuleSet: MetaProfileExactly(profile, version)
* meta.profile[workflowEUProfile] = "{profile}|{version}" (exactly)
