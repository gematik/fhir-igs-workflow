Profile: EFlowRxCommunicationReply
Parent: EFlowRxCommunication
Id: eflow-rx-communication-reply
Title: "GEM ERP PR Communication Reply"
Description: "Antwort vom Leistungserbringer an den Patienten"
* insert Versioning

* recipient 1..1
  * identifier 1..1
  * identifier only IdentifierKvid10

* sender MS
  * identifier 1..1
  * identifier only IdentifierKvid10 or IdentifierTelematikId

* payload 1..1 MS
  * content[x] only string
  * content[x] MS
    * ^short = "Der tatsächliche Inhalt der Nachricht"
    * ^comment = "Dieser Inhalt muss gemäß gemSpec_DM_eRp ein JSON sein."

  * extension
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.description = "Erweiterungen werden immer (mindestens) nach url gesliced."
    * ^slicing.rules = #closed
  * extension contains
    EFlowRxSupplyOptionsTypeExtension named OfferedSupplyOptions 0..1 and
    EFlowRxAvailabilityStateExtension named AvailabilityStatus 0..1

  * extension[OfferedSupplyOptions] ^short = "Angebotene Lieferoptionen durch die Apotheke"
  * extension[OfferedSupplyOptions] ^definition = "In einer Kommunikation kann eine Apotheke ihre verfügbaren Lieferoptionen angeben, ob sie Kunden im Geschäft bedienen, Medikamente per Boten senden oder den Versand per Paket nutzen."
  * extension[AvailabilityStatus] ^short = "Verfügbarkeitsstatus des abgefragten Medikaments"

