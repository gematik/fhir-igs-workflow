Instance: Example-POST-Create-Request
InstanceOf: Parameters
Title: "E-Rezept einer DiGA erstellen"
Description: "Das Primärsystem muss der verordnenden LEI die Rezept-ID für eine DiGA-Verordnung vom TI-Flow-Fachdienst abfragen"
Usage: #example
* parameter[+].name = "workflowType"
* parameter[=].valueCoding = $cs-flowtype#162