Instance: TIFlow-DIGA-OP-Abort
InstanceOf: TIOperationDefinition
Usage: #definition
Title: "E-Rezept abbrechen"
Description: "Diese Operation bricht den Workflow einer DiGA-Verordnung ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen."
* insert OperationResource(Task, true, false, false, true)
* extension[method][+].valueCode = #POST
* code = #abort
* id = "tiflow-diga-abort-op"
* name = "TIFlow-DIGA-OP-Abort"

// in
* parameter[+]
  * extension[parameterLocation].valueCode = #query
  * name = #ac
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von Patienten und Anbietern (Ärzten/Zahnärzten) zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string

// alternative in
* parameter[+]
  * extension[parameterLocation].valueCode = #query
  * name = #secret
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen."
  * type = #string
