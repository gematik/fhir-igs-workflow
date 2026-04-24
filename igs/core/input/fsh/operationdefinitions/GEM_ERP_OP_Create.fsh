Instance: CreateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Create)
* description = "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes."
* code = #create
* type = true
* instance = false
* inputProfile = Canonical(Parameters)
* outputProfile = Canonical(Parameters)

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."