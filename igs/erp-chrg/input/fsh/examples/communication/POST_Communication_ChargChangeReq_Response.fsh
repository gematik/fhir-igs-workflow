Instance: Example-Communication-ChargChangeReq-POST-Assign-Response
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Bestätigung der übermittelten Nachricht"
Description: "Communication-Ressource des TiFlow-Fachdienstes nach Annahme der Nachricht mit AccessCode, ergänzt um Sendezeitpunkt und Absenderangaben aus dem ACCESS_TOKEN"
Usage: #example
* insert Communication_ChargChangeReq
* insert PKV_Identifier(sender.identifier)
* insert DateTimeStamp(sent)