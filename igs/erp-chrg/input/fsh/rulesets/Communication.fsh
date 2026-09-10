RuleSet: Communication_ChargChangeReply
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem-Complete"
* status = #unknown
* insert PKV_Identifier(recipient.identifier)
* insert ApoTelematikID(sender.identifier)
* payload.contentString = "{\"version\": 3, \"communicationType\": \"pickupCodeHR\", \"text\": \"Wir möchten Sie informieren, dass Ihre bestellten Medikamente zur Abholung bereitstehen. Den Abholcode finden Sie anbei.\", \"pickupCodeHR\": \"12341234\", \"transactionID\": \"ABCD-EFGH-IJKL-MNOP\"}"

RuleSet: Communication_ChargChangeReq
* basedOn.reference = "ChargeItem/Example-GEM-ERPCHRG-ChargeItem-Complete"
* status = #unknown
* insert ApoTelematikID(recipient.identifier)
* payload.contentString = "{ \"transactionID\": \"ABCD-EFGH-IJKL-MNOP\", \"version\": 3, \"communicationType\": \"text\", \"text\": \"Gibt es noch Traubenzucker?\", \"phone\": \"004916094858168\" }"