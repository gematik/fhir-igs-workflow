Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept Abgabe vollziehen"
Description: "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed."
* insert OperationResource(Task, true, false, false, true)
* code = #close
* id = "tiflow-rx-close-op"
* name = "TIFlow-RX-OP-Close"

* inputProfile = Canonical(GEM_ERP_PR_PAR_CloseOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_CloseOperation_Output)
