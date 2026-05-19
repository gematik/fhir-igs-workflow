// General rule for to handle versions for all structure definitions

//WICHTIG: Auch die OpenAPI Version anpassen!

RuleSet: Versioning
* ^status = #draft
* ^version = "2.0.0"
* ^date = "2026-05-26"

RuleSet: InstanceVersioning
* status = #draft
* version = "2.0.0"
* date = "2026-05-26"

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2028-10-01"

RuleSet: DateTime(field)
* {field} = "2028-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2028-10-01T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2028-10-01T16:44:00.434+00:00"

RuleSet: setMetaProfileCC(context, to)
* insert targetBase({context}, {to})
* target[=].parameter.valueString = "https://gematik.de/fhir/tiflow/bfarm/StructureDefinition/erp-tprescription-carbon-copy|1.1"