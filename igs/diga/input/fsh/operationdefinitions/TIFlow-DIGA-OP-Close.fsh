Instance: CloseOperation
InstanceOf: OperationDefinition
Usage: #definition
Title: "E-Rezept Abgabe vollziehen"
Description: "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed."
* insert OperationResource(Task, true, false, false, true)
* code = #close
* id = "tiflow-diga-close-op"
* name = "TIFlow-DIGA-OP-Close"

* inputProfile = Canonical(TIFlowDiGACloseOperationInput)
* outputProfile = Canonical(TIFlowDiGACloseOperationOutput)

// in
* parameter[+]
  * name = #rxDispensation
  * use = #in
  * min = 1
  * max = "1"
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #in
    * min = 1
    * max = "1"

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Bundle