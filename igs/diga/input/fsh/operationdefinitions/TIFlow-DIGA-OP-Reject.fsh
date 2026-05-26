Instance: RejectOperation
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept zurückgeben"
Description: "Lehnt die Ausgabe einer DiGA-Verordnung ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Kostenträger zugänglich oder kann vom Patienten gelöscht werden."
* insert OperationResource(Task, true, false, false, true)
* code = #reject
* id = "tiflow-diga-reject-op"
* name = "TIFlow-DIGA-OP-Reject"

// in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der secret Parameter, der einem Kostenträger den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht."
  * type = #string
