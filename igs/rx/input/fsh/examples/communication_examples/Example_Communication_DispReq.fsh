Instance: ExampleCommunicationDispReq
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Zuweisung des Patienten an die Apotheke"
Description: "Beispiel für eine Nachricht des Patienten an die Apotheke zur Anfrage der Medikamentenabgabe mit AccessCode"
Usage: #inline
* meta.tag[+].display = "Dispense Request from Patient to Pharmacy"
* meta.tag[+].display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* basedOn.reference = "Task/160.000.033.491.280.78"
* insert TaskExension(160)
* insert ApoTelematikID(recipient.identifier)
* insert GKV_Identifier(sender.identifier)
* insert DateTimeStamp(sent)
* status = #unknown
* payload.contentString = "{ \"version\": 1, \"supplyOptionsType\": \"onPremise\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"phone\": \"004916094858168\" }"

Instance: ExampleCommunicationGetDispReq
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for Rx"
Description: "Example response for GET /Communication"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?_sort=sent&_count=50&sent=gt2025-01-14"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/ExampleCommunicationDispReq"
* entry[=].resource = ExampleCommunicationDispReq
* entry[=].search.mode = #match