// General rule for to handle versions for all structure definitions
RuleSet: Versioning
* ^status = #draft
* ^version = "1.0.0"
* ^date = "2026-05-31"

RuleSet: OperationVersioning
* status = #draft
* version = "1.0.0"
* date = "2026-05-31"

//!!!EDIT input/data/constants.yml for current ePA Medication IG!!!

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2026-07-01"

RuleSet: DateTime(field)
* {field} = "2026-07-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2026-07-01T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2026-07-01T16:44:00.434+00:00"

