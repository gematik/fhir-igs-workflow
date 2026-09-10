Instance: Example-Communication-ChargChangeReq
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem-Complete"
* status = #unknown
* insert PKV_Identifier(sender.identifier)
* insert ApoTelematikID(recipient.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."

Instance: Example-Communication-ChargChangeReply
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReply
Title: "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
Usage: #example
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem-Complete"
* status = #unknown
* insert PKV_Identifier(recipient.identifier)
* insert ApoTelematikID(sender.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Erledigt."

Instance: Example-Communication-Bundle
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for ERP-CHRG"
Description: "Example response for GET /Communication"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/Example-Communication-ChargChangeReq"
* entry[=].resource = Example-Communication-ChargChangeReq
* entry[=].search.mode = #match