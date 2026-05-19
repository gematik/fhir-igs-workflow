Instance: TIFlow-RX-OP-Accept
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept abrufen"
Description: "Mit der $accept-Operation beansprucht eine Apotheke ein E-Rezept. Der Status der referenzierten Aufgabe ändert sich in 'in-progress'."
* insert OperationResource(Task, true, false, false, true)
* code = #accept
* id = "tiflow-rx-accept-op"
* name = "TIFlow-RX-OP-Accept"

* outputProfile = Canonical(GEM_ERP_PR_PAR_AcceptOperation_Output)

// in
* parameter[+]
  * name = #ac
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Der Secret-Parameter, der es Benutzern ermöglicht, exklusiv über die URL und den Parameter ?ac auf die Aufgabe zuzugreifen."
  * type = #string