Instance: RejectOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Reject)
* description = "Lehnt die Ausgabe eines E-Rezepts ab. Die Aufgabe wird in einen aktiven Zustand zurückgesetzt, das secret wird gelöscht, und der Task wird für jeden anderen Apotheker zugänglich oder kann vom Patienten gelöscht werden."
* code = #reject

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."

// in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der secret Parameter, der einer Apotheke den Zugriff auf den Task als URL-Parameter ?secret ermöglicht."
  * type = #string
