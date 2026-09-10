Instance: Example-Bundle-Communication-ChargChangeReq-GET-Response
InstanceOf: Bundle
Usage: #example
Title: "Liste aller abgerufenen Nachrichten"
Description: "Bundle mit allen Communication-Ressourcen des TiFlow-Fachdienstes für den angefragten Zeitraum"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Example-Communication-ChargChangeReq-GET-Response"
* entry[=].resource = Example-Communication-ChargChangeReq-GET-Response
* entry[=].search.mode = #match

Instance: Example-Communication-ChargChangeReq-GET-Response
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* insert Communication_ChargChangeReq
