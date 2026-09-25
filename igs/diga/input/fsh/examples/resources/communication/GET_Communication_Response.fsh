Instance: Example-GET-Communication-Response
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for DiGA"
Description: "Example response for GET /Communication in DiGA workflow"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Example-Communication-DiGA"
* entry[=].resource = Example-Communication-DiGA
* entry[=].search.mode = #match

Instance: Example-Communication-DiGA
InstanceOf: GEM_ERP_PR_Communication_DiGA
Title: "DiGA-Nachricht eines Kostenträgers an den Patienten"
Description: "Beispiel für eine DiGA-bezogene Nachricht, die vom Kostenträgers an den Patienten gesendet wird"
Usage: #example
* insert CommunicationDiGA
* insert KTRTelematik_Identifier(sender.identifier)
* insert DateTimeStamp(sent)