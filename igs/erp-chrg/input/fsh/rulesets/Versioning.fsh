Alias: $version = 2.0.0

RuleSet: MetaDate(element)
* {element} = "2028-04-01"

RuleSet: MetaStatus(element)
* {element} = #active

RuleSet: MetaVersion(element)
* {element} = $version

RuleSet: Gematik(element)
* {element} = "gematik GmbH"

RuleSet: MetaCopyright(element)
* {element} = "gematik GmbH / Dieses Artefakt ist lizenziert unter [Apache License](./license.html), Version 2.0."

RuleSet: MetaContact
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.gematik.de"

RuleSet: LegacyMeta(type, name)
* ^url = "https://gematik.de/fhir/erpchrg/{type}/{name}"
* insert Meta

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

RuleSet: Meta-With-Versioning
* insert Meta
* meta MS
  * versionId MS
  * lastUpdated MS

// Dates for Examples

// Dates for Examples (Date of actual release)
RuleSet: Date(field)
* {field} = "2028-10-01"

RuleSet: DateTime(field)
* {field} = "2028-10-01T15:29:00+00:00"

RuleSet: DateTimeStamp(field)
* {field} = "2028-10-01T15:29:00.434+00:00"

RuleSet: DateTimeStampPlus1Hr(field)
* {field} = "2028-10-01T16:44:00.434+00:00"

// Rules to set meta.profile in profiles and instances
RuleSet: PackageMetaProfileExactly(profile)
* meta.profile[workflowProfile] = "https://gematik.de/fhir/erpchrg/{profile}|2.0" (exactly)

