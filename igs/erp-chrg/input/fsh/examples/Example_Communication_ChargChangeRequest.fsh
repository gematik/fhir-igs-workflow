Instance: Communication_ChargChangeRequest
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
Usage: #example
* id = "b4cf7f71-3ade-40ab-97a9-929f95af29f2"
* meta.tag.display = "Communication message sent by patient to pharmacy to request the change of an existing ChargeItem by providing the AccessCode"
//TODO: Review - query part '?ac=...' is omitted in the reference so the example resolves locally in QA.
* basedOn.reference = "ChargeItem/a51520ec-0899-404f-bb97-fe7d461f90a8"
* status = #unknown
* insert PKV_Identifier(sender.identifier)
* insert ApoTelematikID(recipient.identifier)
* insert DateTimeStamp(sent)
* payload.contentString = "Bitte meinen Namen in Günther ändern, Waltraud ist falsch."