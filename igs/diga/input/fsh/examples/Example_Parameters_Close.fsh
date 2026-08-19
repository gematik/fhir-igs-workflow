Instance: ExampleCloseInputParametersDiGA
InstanceOf: TIFlowDiGACloseOperationInput //Parameters //TODO: Eigenes Parameters Definition für die Schnittstelle $close
Usage: #example
Title: "Example Close Parameters"
Description: "Beispiel der Eingabeparameter für die $close-Operation im DiGA-Workflow"
* parameter[+]
  * name = "rxDispensation"
  * part[+] //TODO: Named Slices
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-DiGA-Name-And-PZN

Instance: ExampleCloseOutputParametersDiGA
InstanceOf: TIFlowDiGACloseOperationOutput //Parameters //TODO: Eigenes Parameters Definition für die Schnittstelle $close
Usage: #example
Title: "Example Close Parameters"
Description: "Beispiel der Ausgabeparameter der $close-Operation im DiGA-Workflow"
* parameter[+]
  * name = "return"
  * resource = ExampleOperationCloseOutput //Example-MedicationDispense-DiGA-Name-And-PZN  
    