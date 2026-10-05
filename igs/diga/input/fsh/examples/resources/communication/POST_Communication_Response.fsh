Instance: Example-POST-Communication-Response
InstanceOf: GEM_ERP_PR_Communication_DiGA
Title: "DiGA-Nachricht eines Kostenträgers an den Patienten"
Description: "Beispiel für eine DiGA-bezogene Nachricht, die vom Kostenträgers an den Patienten gesendet wird"
Usage: #example
* insert CommunicationDiGA
* insert KTRTelematik_Identifier(sender.identifier)
* insert DateTimeStamp(sent)