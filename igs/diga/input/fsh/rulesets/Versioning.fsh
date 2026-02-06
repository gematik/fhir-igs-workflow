// General rule to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "2.0.0"
* ^date = "2026-02-06"

RuleSet: OperationVersioning
* status = #draft
* version = "2.0.0"
* date = "2026-02-06"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2026-02-06"

RuleSet: DateTime(field)
* {field} = "2026-02-06T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2026-02-06T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2026-02-06T16:44:00.434+00:00"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* meta.profile[workflowProfile] = "https://gematik.de/fhir/erp-diga/{profile}|2.0" (exactly)
