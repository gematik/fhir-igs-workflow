RuleSet: Communication_ChargChangeReply
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem-Complete"
* status = #unknown
* insert PKV_Identifier(recipient.identifier)
* insert ApoTelematikID(sender.identifier)
* payload.contentString = "Erledigt."

RuleSet: Communication_ChargChangeReq
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem-Complete"
* status = #unknown
* insert ApoTelematikID(recipient.identifier)
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."