Instance: AbortOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Abort)
* description = "Diese Operation bricht den Workflow eines E-Rezepts ab und löscht alle Daten, die mit dieser Aufgabe zusammenhängen."
* code = #abort

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."

// in
* parameter[+]
  * name = #ac
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von Patienten und Ärzten/Zahnärzten zu verwenden] Der secret Parameter, der es Benutzern ermöglicht, über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string

// alternative in
* parameter[+]
  * name = #secret
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von der abgebenden Institution zu verwenden] Der secret Parameter, der es einer abgebenden Institution ermöglicht, über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen."
  * type = #string
