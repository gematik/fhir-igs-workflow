Profile: GEM_ERP_PR_Communication_DiGA
Parent: Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "GEM ERP PR Communication DiGA"
Description: "Antwort des Leistungserbringers an den Patienten"
* insert LegacyMeta(StructureDefinition, GEM_ERP_PR_Communication_DiGA)

* basedOn 1..1 MS
* basedOn only Reference(Task)
* basedOn ^type.aggregation = #referenced
  * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
  * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"
  * reference 1..1 MS
    * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
    * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"

* status MS
* status = #unknown (exactly)
  * ^comment = "Muss standardmäßig laut FHIR Core Specification angegeben werden, wird jedoch während des Lebenszyklus der Ressource nicht verändert."
* sent MS
  * ^short = "Der Zeitpunkt, zu dem diese Kommunikation gesendet wurde."
  * ^comment = "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar."
* received MS
  * ^short = "Der Zeitpunkt, zu dem diese Kommunikation empfangen wurde."
  * ^comment = "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar."

* recipient 1..1 MS
  * ^short = "Die Entität (z. B. Person, Organisation), die Ziel der Kommunikation war."
  * ^comment = "Muss vom Absender der Kommunikation gesetzt werden, um das Ziel festzulegen."
  * identifier 1..1 MS
  * identifier only IdentifierKvid10

* sender MS
  * ^short = "Die Entität (z. B. Person, Organisation), die Quelle der Kommunikation war."
  * ^comment = "Wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt."
  * ^definition = "Nachrichtenabsender — wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt.\r\nDie Entität (z. B. Person, Organisation), die Quelle der Kommunikation war."
  * identifier 1..1
  * identifier only IdentifierTelematikId

* payload 1..1 MS
  * content[x] only string
    * ^short = "Der tatsächliche Inhalt der Nachricht"
    * ^comment = "Dieser Inhalt muss ein JSON gemäß gemSpec_DM_eRp sein."
  * content[x] MS


// Remove unused fields
* instantiatesCanonical 0..0
* instantiatesUri 0..0
* partOf 0..0
* inResponseTo 0..0
* statusReason 0..0
* category 0..0
* priority 0..0
* medium 0..0
* subject 0..0
* topic 0..0
* about 0..0
* encounter 0..0
* reasonCode 0..0
* reasonReference 0..0
* note 0..0






