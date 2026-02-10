Instance: CreateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Create)
* description = "Diese Operation erstellt eine Aufgabe für die Verschreibung eines bestimmten Flowtypes."
* code = #create
* type = true
* instance = false
* inputProfile = Canonical(Parameters)
* outputProfile = Canonical(EFlowRxCreateOperationOutputParameters)

// in
* parameter[+]
  * name = #workflowType
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Dieser Parameter fordert die Erstellung eines Tasks mit bestimmten Flowtype an."
  * type = #Coding
  * binding.strength = #required
  * binding.valueSet = Canonical(EFlowRxFlowTypeVS)
// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Der erstellte Task mit einer flowType-spezifischen Rezept-ID"
  * type = #Task
