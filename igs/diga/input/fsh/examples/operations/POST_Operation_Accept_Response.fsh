Instance: Example-POST-Accept-Response
InstanceOf: Bundle
Usage: #example
Title: "Empfangen von Zuweisungen und Abruf des E-Rezepts der DiGA-Verordnung"
Description: "Beschreibt, wie ein Kostenträger Zuweisungen vom E-Rezept-Fachdienst empfängt – entweder über einen Subscription Service oder durch manuelles Abfragen der Communications – und wie der darin enthaltene E-Rezept-Token (Task-ID und AccessCode) genutzt wird, um das qualifiziert signierte E-Rezept einer DiGA-Verordnung per $accept-Operation abzurufen."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/162.000.000.000.000.01/$accept"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-Ready"
* entry[=].resource = Example-DiGA-Task-Ready
* entry[+].fullUrl = $URN-binary-DiGA
* entry[=].resource = Example-Binary-DiGA