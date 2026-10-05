Instance: Example-GET-Task-Response-Single-Insured
InstanceOf: Bundle
Usage: #example
Title: "Der Zugriff auf ein einzelnes E-Rezept durch den Versicherten"
Description: "Der Zugriff auf ein einzelnes E-Rezept ist durch den Versicherten mit Nachweis seiner Identität immer zulässig."
* type = #collection
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Task/160.000.000.000.000.01"
* entry[+].fullUrl = "https://erp-ref.example.org/Task/Example-DiGA-Task-Single-Insured"
* entry[=].resource = Example-DiGA-Task-Single-Insured
// Bug im E-Rezept-Fachdienst
* entry[+].fullUrl = $URN-KBV-EVDGA-Bundle-Placeholder
* entry[=].resource = Example-KBV-EVDGA-Bundle-Placeholder

Instance: Example-DiGA-Task-Single-Insured
InstanceOf: TIFlowDiGATask
Usage: #example
Title: "DiGA Task in ready state mit signierten E-Rezept-Datensatz"
Description: "Beispiel eines DiGA-Task im Status ready, der vom Kostenträger eingelöst werden kann"
* insert DiGA_Task_Ready
* insert TaskInputReceipt($URN-KBV-EVDGA-Bundle-Placeholder)