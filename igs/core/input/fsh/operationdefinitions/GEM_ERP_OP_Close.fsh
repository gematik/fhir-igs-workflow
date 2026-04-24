Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Close)
* description = "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed."
* code = #close
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(Parameters)
* outputProfile = Canonical(Parameters)

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."