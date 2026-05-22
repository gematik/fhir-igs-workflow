Instance: TIFlow-RX-OP-Create
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept erstellen"
Description: "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes."
* insert OperationResource(Task, true, false, true, false)
* code = #create
* id = "tiflow-rx-create-op"
* name = "TIFlow-RX-OP-Create"

* inputProfile = Canonical(GEM_ERP_PR_PAR_CreateOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_CreateOperation_Output)
