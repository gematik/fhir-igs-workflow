Instance: TIFlow-DIGA-OP-Accept
InstanceOf: TIOperationDefinition
Usage: #definition
Title: "Task abrufen"
Description: "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'."
* insert OperationResource(Task, true, false, false, true)
* extension[method][+].valueCode = #POST
* code = #accept
* id = "tiflow-diga-accept-op"
* name = "TIFlow-DIGA-OP-Accept"

* outputProfile = Canonical(TIFlowDiGAAcceptOperationOutput)

// in
* parameter[+]
  * extension[parameterLocation].valueCode = #query
  * name = #ac
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Bundle