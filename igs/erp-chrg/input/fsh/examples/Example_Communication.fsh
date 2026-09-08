Instance: Example-Communication-ChargChangeReq
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem"
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem"
* status = #unknown
* insert PKV_Identifier(sender.identifier)
* insert ApoTelematikID(recipient.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."

Instance: Example-Communication-ChargChangeReply
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReply
Title: "Communication message sent by pharmacy to patient in response to a previous ChargeItem-related message"
Usage: #example
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem"
* status = #unknown
* insert PKV_Identifier(recipient.identifier)
* insert ApoTelematikID(sender.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Erledigt."