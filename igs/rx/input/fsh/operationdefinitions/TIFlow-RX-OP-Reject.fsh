Instance: RejectOperation
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept zurückgeben"
Description: "Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden."
* insert OperationResource(Task, true, false, false, true)
* code = #reject
* id = "tiflow-rx-reject-op"
* name = "TIFlow-RX-OP-Reject"

// in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der secret Parameter, der einer Apotheke den exklusiven Zugriff auf den Task als URL-Parameter ?secret ermöglicht."
  * type = #string
