Instance: TIFlow-RX-OP-Dispense
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept vorläufig abgeben"
Description: "Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird."
* insert OperationResource(Task, true, false, false, true)
* code = #dispense
* id = "tiflow-rx-dispense-op"
* name = "TIFlow-RX-OP-Dispense"

* inputProfile = Canonical(GEM_ERP_PR_PAR_DispenseOperation_Input)
