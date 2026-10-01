Instance: Example-GET-Task-Response-Single-Performer
InstanceOf: Bundle
Usage: #example
Title: "Der Zugriff auf ein einzelnes E-Rezept durch den Kostenträger"
Description: "Der Kostenträger kann der Task mit den Informationen aus dem E-Rezept-Token erneut abrufen und erhält vom TIFLow-Fachdienst den Task samt Secret sowie das QES-Verordnungsbundle"
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/160.000.000.000.000.01"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-Single-Performer"
* entry[=].resource = Example-DiGA-Task-Single-Performer
* entry[+].fullUrl = $URN-binary-DiGA
* entry[=].resource = Example-Binary-DiGA

Instance: Example-DiGA-Task-Single-Performer
InstanceOf: TIFlowDiGATask
Usage: #example
Title: "DiGA Task in ready state mit QES-Verordnungsbundle"
Description: "Beispiel eines DiGA-Task im Status ready, der vom Kostenträger eingelöst werden kann"
* insert DiGA_Task_Ready
* insert TaskInputQES($URN-binary-DiGA)