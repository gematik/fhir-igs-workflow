Instance: TIFlowRXOPClose
InstanceOf: TIOperationDefinition
Usage: #definition
Title: "E-Rezept Abgabe vollziehen"
Description: "Die $close-Operation beendet den E-Rezept-Workflow und erstellt eine Quittung. Das Ergebnis dieses Vorgangs ist ein signiertes Bundle, das für weitere finanzielle Verarbeitung verwendet wird. Der Status der Aufgabe ändert sich anschließend in #completed."
* insert OperationResource(Task, true, false, false, true)
* extension[method][+].valueCode = #POST
* code = #close
* id = "tiflow-rx-close-op"
* name = "TIFlowRXOPClose"

* inputProfile = Canonical(GEM_ERP_PR_PAR_CloseOperation_Input)
* outputProfile = Canonical(GEM_ERP_PR_PAR_CloseOperation_Output)


* parameter[+]
  * extension[parameterLocation].valueCode = #query
  * name = #secret
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "[Nur von der Apotheke zu verwenden] Der secret Parameter, der es einer Apotheke ermöglicht, exklusiv über die URL und den Parameter ?secret auf die Aufgabe zuzugreifen."
  * type = #string

// in
// * parameter[+]
//   * name = #rxDispensation
//   * use = #in
//   * min = 0
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

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * type = #Bundle
