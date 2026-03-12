Alias: $version = 2.0.0

RuleSet: MetaStatus(element)
* {element} = #draft
RuleSet: MetaVersion(element)
* {element} = $version
RuleSet: MetaDate(element)
* {element} = "2025-12-15"
RuleSet: Gematik(element)
* {element} = "gematik GmbH"
RuleSet: MetaCopyright(element)
* {element} = "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0."
RuleSet: MetaContact
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.gematik.de"

RuleSet: Meta
* insert MetaVersion(^version)
* insert MetaStatus(^status)
* insert MetaDate(^date)
* insert Gematik(^publisher)
* insert MetaCopyright(^copyright)
* ^experimental = false

RuleSet: Meta-VS
* insert Meta
* insert MetaContact
* ^experimental = false
* ^immutable = false

RuleSet: Meta-CS
* insert Meta
* insert MetaContact
* ^caseSensitive = true
* ^content = #complete

RuleSet: Meta-Instance
* insert MetaVersion(version)
* insert MetaStatus(status)
* insert Gematik(publisher)
* insert MetaDate(date)

//TODO !!!EDIT input/data/constants.yml for current ePA Medication IG!!!

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2026-07-01"

RuleSet: DateTime(field)
* {field} = "2026-07-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2026-07-01T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2026-07-01T16:44:00.434+00:00"

