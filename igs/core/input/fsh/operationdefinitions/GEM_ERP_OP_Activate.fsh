Instance: ActivateOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(Activate)
* description = "Diese Operation aktiviert die erstellte Aufgabe für das Rezept. Der Eingabeparameter muss das qualifizierte signierte Bundle des Rezepts enthalten. Der TI-Flow-Fachdienst validiert das Rezept, aktualisiert die Task-ressource und startet den Workflow."
* code = #activate
* inputProfile = Canonical(Parameters)
* outputProfile = Canonical(Parameters)

* purpose = "Diese Operation ist eine abstrakte Beschreibung für die Verwendung in Modulen des TI-Flow-Fachdienstes."