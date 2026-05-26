Instance: TIFlow-DIGA-OP-Create
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept erstellen"
Description: "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes."
* insert OperationResource(Task, true, false, true, false)
* code = #create
* id = "tiflow-diga-create-op"
* name = "TIFlow-DIGA-OP-Create"

* inputProfile = Canonical(TIFlowDiGACreateOperationInput)
* outputProfile = Canonical(TIFlowDiGACreateOperationOutput)
