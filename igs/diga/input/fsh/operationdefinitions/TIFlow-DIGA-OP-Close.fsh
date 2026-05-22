Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept Abgabe vollziehen"
Description: "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed."
* insert OperationResource(Task, true, false, false, true)
* code = #close
* id = "tiflow-diga-close-op"
* name = "TIFlow-DIGA-OP-Close"

* inputProfile = Canonical(TIFlow-DiGA-Close-Operation-Input)
* outputProfile = Canonical(TIFlow-DiGA-Close-Operation-Output)
