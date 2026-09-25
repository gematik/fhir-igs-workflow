// GEM_ERP_PR_Communication_DispReq is part of rx IG

// Instance: Example-Communication-DispReq-DiGA-POST-Request
// InstanceOf: GEM_ERP_PR_Communication_DispReq
// Title: "DiGA-Verordnung dem Kostenträger zuweisen"
// Description: "Versicherter sendet eine Communication mit AccessCode zur Anforderung der DiGA-Abgabe an den Kostenträger (WorkflowType '162'), ohne JSON-Payload, nur mit E-Rezept-Token"
// Usage: #example
// * status = #unknown
// * basedOn.reference = "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
// * insert TaskExtension(162)
// * insert KTRTelematik_Identifier(recipient.identifier)
// * insert GKV_Identifier(sender.identifier)
// * insert DateTimeStamp(sent)