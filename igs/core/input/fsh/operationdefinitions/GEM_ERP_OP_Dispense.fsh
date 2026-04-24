Instance: DispenseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Dispense)
* description = "Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird."
* code = #dispense
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(Parameters)

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."