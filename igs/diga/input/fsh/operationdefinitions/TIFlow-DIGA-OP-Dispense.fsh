Instance: TIFlow-DIGA-OP-Dispense
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept vorläufig abgeben"
Description: "Die Operation $dispense ermöglicht es dem Kostenträger, eine Ausgabe für eine DiGA-Verordnung durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass eine DiGA ausgegeben wurde, bevor sie vom Kostenträger abgeschlossen wird."
* insert OperationResource(Task, true, false, false, true)
* code = #dispense
* id = "tiflow-diga-dispense-op"
* name = "TIFlow-DIGA-OP-Dispense"

* inputProfile = Canonical(TIFlowDiGADispenseOperationInput)
