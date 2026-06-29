Instance: TIFlowRXOPDispense
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept vorläufig abgeben"
Description: "Die Operation $dispense ermöglicht es der Apotheke, eine Ausgabe für ein Medikament durchzuführen, ohne den Status der Aufgabe zu ändern. Diese Aktion erlaubt es einem Frontend anzuzeigen, dass ein Medikament ausgegeben wurde, bevor es von der Apotheke abgeschlossen wird."
* insert OperationResource(Task, true, false, false, true)
* code = #dispense
* id = "tiflow-rx-dispense-op"
* name = "TIFlowRXOPDispense"

* inputProfile = Canonical(GEM_ERP_PR_PAR_DispenseOperation_Input)


// in
// * parameter[+]
//   * name = #rxDispensation
//   * use = #in
//   * min = 1
//   * max = "*"
//   * part[+]
//     * name = #medicationDispense
//     * type = #MedicationDispense
//     * use = #in
//     * min = 1
//     * max = "1"
//   * part[+]
//     * name = #medication
//     * type = #Medication
//     * use = #in
//     * min = 1
//     * max = "1"


