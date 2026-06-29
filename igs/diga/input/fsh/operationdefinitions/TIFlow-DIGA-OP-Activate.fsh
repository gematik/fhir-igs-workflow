Instance: TIFlow-DIGA-OP-Activate
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept aktivieren"
Description: "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow."
* insert OperationResource(Task, true, false, false, true)
* code = #activate
* id = "tiflow-diga-activate-op"
* name = "TIFlow-DIGA-OP-Activate"

* inputProfile = Canonical(TIFlowDiGAActivateOperationInput)
* outputProfile = Canonical(TIFlowDiGAActivateOperationOutput)

// in
* parameter[+]
  * name = #ePrescription
  * use = #in
  * min = 1
  * max = "1"
  * type = #Binary

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Task