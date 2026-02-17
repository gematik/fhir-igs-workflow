Profile: GEM_ERP_PR_Communication_DiGA
Parent: Communication
Id: GEM-ERP-PR-Communication-DiGA
Title: "GEM ERP PR Communication DiGA"
Description: "Antwort des Leistungserbringers an den Patienten"
* insert Versioning

* status MS
* status = #unknown (exactly)
  * ^comment = "Muss standardmäßig laut FHIR Core Specification angegeben werden, wird jedoch während des Lebenszyklus der Ressource nicht verändert."

* basedOn 1..1 MS
* basedOn only Reference(Task) //TODO: Wechsel auf Identifier
* basedOn ^type.aggregation = #referenced
  * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
  * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"
  * reference 1..1 MS
    * ^short = "Gibt das E-Rezept-Token gemäß gemSpec_DM_eRp an."
    * ^comment = "Hat die Form 'Task/{{PrescriptionID}}'"

* recipient 1..1 MS
  * ^short = "Die Entität (z. B. Person, Organisation), die Ziel der Kommunikation war."
  * ^comment = "Muss vom Absender der Kommunikation gesetzt werden, um das Ziel festzulegen."

* recipient.identifier 1..1
* recipient.identifier only IdentifierKvid10

* sender MS
  * ^short = "Die Entität (z. B. Person, Organisation), die Quelle der Kommunikation war."
  * ^comment = "Wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt."
  * ^definition = "Nachrichtenabsender — wird vom E-Rezept-Server unter Verwendung der AuthN-Credential des Clients gesetzt.\r\nDie Entität (z. B. Person, Organisation), die Quelle der Kommunikation war."

* sender.identifier 1..1
* sender.identifier only IdentifierTelematikId

* payload 1..1 MS
  * content[x]
    * ^short = "Der tatsächliche Inhalt der Nachricht"
    * ^comment = "Dieser Inhalt muss ein JSON gemäß gemSpec_DM_eRp sein."

* payload.content[x] only string
* payload.content[x] MS

* sent MS
  * ^short = "Der Zeitpunkt, zu dem diese Kommunikation gesendet wurde."
  * ^comment = "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar."
* received MS
  * ^short = "Der Zeitpunkt, zu dem diese Kommunikation empfangen wurde."
  * ^comment = "Wird vom E-Rezept-Server gesetzt. Ein Client hat diesen Wert daher immer verfügbar."

