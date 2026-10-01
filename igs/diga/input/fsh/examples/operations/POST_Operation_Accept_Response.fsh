Instance: Example-POST-Accept-Response
InstanceOf: Bundle
Usage: #example
Title: "Empfangen von Zuweisungen und Abruf des E-Rezepts der DiGA-Verordnung"
Description: "Beschreibt, wie ein Kostenträger Zuweisungen vom TIFlow-Fachdienst empfängt – entweder über einen Subscription Service oder durch manuelles Abfragen der Communications – und wie der darin enthaltene E-Rezept-Token (Task-ID und AccessCode) genutzt wird, um das qualifiziert signierte E-Rezept einer DiGA-Verordnung per $accept-Operation abzurufen."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/162.000.000.000.000.01/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-Accept"
* entry[=].resource = Example-DiGA-Task-Accept
* entry[+].fullUrl = $URN-binary-DiGA
* entry[=].resource = Example-Binary-DiGA

Instance: Example-DiGA-Task-Accept
InstanceOf: TIFlowDiGATask
Usage: #example
Title: "DiGA Task in ready state mit QES-Verordnungsbundle"
Description: "Beispiel eines DiGA-Task im Status ready, der vom Kostenträger eingelöst werden kann"
* insert DiGA_Task_Ready
* insert TaskIdentifierAccessCode
* insert TaskSecret
* insert TaskInputQES($URN-binary-DiGA)