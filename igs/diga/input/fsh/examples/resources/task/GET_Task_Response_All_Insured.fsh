Instance: Example-GET-Task-Response-All-Insured
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