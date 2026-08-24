Instance: ExampleCommunicationReplyPharmacy
InstanceOf: GEM_ERP_PR_Communication_Reply
Title: "Antwort-Nachricht der Apotheke an den Patienten"
Description: "Beispiel für eine Antwort-Nachricht, die von der Apotheke an den Patienten als Antwort auf eine vorherige Task-bezogene Nachricht gesendet wird"
Usage: #example
* basedOn.reference = "Task/160.000.033.491.280.78"
* insert GKV_Identifier(recipient.identifier)
* insert ApoTelematikID(sender.identifier)
* insert DateTimeStamp(sent)
* status = #unknown
* payload.contentString = "{\"version\": 1,\"supplyOptionsType\": \"onPremise\",\"info_text\": \"Hallo, wir haben das Medikament vorraetig. Kommen Sie gern in die Filiale oder wir schicken einen Boten.\",\"url\": \"https://sonnenschein-apotheke.de\"}"
* payload.extension[OfferedSupplyOptions]
  * extension[onPremise].valueBoolean = true
  * extension[delivery].valueBoolean = true
  * extension[shipment].valueBoolean = false
* payload.extension[AvailabilityStatus]
  * valueCoding = $cs-availability-status#20