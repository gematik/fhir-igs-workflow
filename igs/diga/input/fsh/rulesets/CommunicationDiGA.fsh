RuleSet: CommunicationDiGA
* basedOn.reference = "Task/Example-DiGA-Task-Ready"
* status = #unknown
* insert GKV_Identifier(recipient.identifier)
* payload.contentString = "Nachrichteninhalt für den Versicherten"
