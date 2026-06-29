Instance: TIFlow-DIGA-OP-Accept
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept abrufen"
Description: "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'."
* insert OperationResource(Task, true, false, false, true)
* code = #accept
* id = "tiflow-diga-accept-op"
* name = "TIFlow-DIGA-OP-Accept"

* outputProfile = Canonical(TIFlowDiGAAcceptOperationOutput)

// in
* parameter[+]
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