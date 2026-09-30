Instance: Example-GET-Task-Response-Single
InstanceOf: Bundle
Usage: #example
Title: "Der Zugriff auf ein einzelnes E-Rezept durch den Versicherten"
Description: "Der Zugriff auf ein einzelnes E-Rezept ist durch den Versicherten mit Nachweis seiner Identität immer zulässig."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/160.000.000.000.000.01"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-Ready"
* entry[=].resource = Example-DiGA-Task-Ready
// Bug im E-Rezept-Fachdienst
* entry[+].fullUrl = $URN-KBV-EVDGA-Bundle-Placeholder
* entry[=].resource = Example-KBV-EVDGA-Bundle-Placeholder

Instance: Example-GET-Task-Response-All
InstanceOf: Bundle
Usage: #example
Title: "Der Versicherter kann alle E-Rezepte einsehen"
Description: "Der Versicherter kann alle E-Rezepte einsehen, für die er berechtigt ist."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-1"
* entry[=].resource = Example-DiGA-Task-1
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-2"
* entry[=].resource = Example-DiGA-Task-2
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-3"
* entry[=].resource = Example-DiGA-Task-3

Instance: Example-DiGA-Task-1
InstanceOf: TIFlowDiGATask
Usage: #inline
* insert DiGA_Task_Ready
* insert TaskIdentifierAccessCode

Instance: Example-DiGA-Task-2
InstanceOf: TIFlowDiGATask
Usage: #inline
* insert DiGA_Task_Ready
* insert TaskIdentifierAccessCode

Instance: Example-DiGA-Task-3
InstanceOf: TIFlowDiGATask
Usage: #inline
* insert DiGA_Task_Ready
* insert TaskIdentifierAccessCode