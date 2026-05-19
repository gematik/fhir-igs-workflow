Instance: TIFlow-RX-OP-Activate
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept aktivieren"
Description: "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow."
* insert OperationResource(Task, true, false, false, true)
* code = #activate
* id = "tiflow-rx-activate-op"
* name = "TIFlow-RX-OP-Activate"

* inputProfile = Canonical(GEM_ERP_PR_PAR_ActivateOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_ActivateOperation_Output)
