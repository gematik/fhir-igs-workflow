Instance: Example-Communication-ChargChangeReq-POST-Assign-Response
InstanceOf: GEM_ERPCHRG_PR_Communication_ChargChangeReq
Title: "Bestätigung der Zuweisung durch den Fachdienst"
Description: "TiFlow-Fachdienst prüft die Nachricht auf Zulässigkeit und ergänzt Metainformationen wie Sendezeitpunkt und Absenderangaben aus dem ACCESS_TOKEN"
Usage: #example
* insert Communication_ChargChangeReq
* insert PKV_Identifier(sender.identifier)
* insert DateTimeStamp(sent)