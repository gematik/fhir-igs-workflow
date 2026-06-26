Instance: TIFlowRXOPCreate
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept erstellen"
Description: "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes."
* insert OperationResource(Task, true, false, true, false)
* code = #create
* id = "tiflow-rx-create-op"
* name = "TIFlowRXOPCreate"

* inputProfile = Canonical(GEM_ERP_PR_PAR_CreateOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_CreateOperation_Output)


// in
* parameter[+]
  * name = #workflowType
  * use = #in
  * min = 1
  * max = "1"
  * type = #Coding

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Task