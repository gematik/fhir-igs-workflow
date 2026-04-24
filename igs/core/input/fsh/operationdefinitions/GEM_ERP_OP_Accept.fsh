Instance: AcceptOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Accept)
* description = "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'."
* code = #accept
* outputProfile = Canonical(Parameters)

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."

// in
* parameter[+]
  * name = #ac
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der Secret-Parameter, der es Benutzern ermöglicht, über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string
