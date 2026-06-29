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

// // in
// * parameter[+]
//   * name = #workflowType
//   * use = #in
//   * min = 1
//   * max = "1"
//   * type = #Coding

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Task