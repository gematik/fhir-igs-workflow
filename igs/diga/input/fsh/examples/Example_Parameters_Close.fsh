Instance: ExampleCloseInputParametersDiGA
InstanceOf: TIFlowDiGACloseOperationInput //Parameters //TODO: Eigenes Parameters Definition für die Schnittstelle $close
Usage: #example
Title: "Example Close Parameters"
* parameter[+]
  * name = "rxDispensation"
  * part[+] //TODO: Named Slices
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-DiGA-Name-And-PZN

Instance: ExampleCloseOutputParametersDiGA
InstanceOf: TIFlowDiGACloseOperationOutput //Parameters //TODO: Eigenes Parameters Definition für die Schnittstelle $close
Usage: #example
Title: "Example Close Parameters"
* parameter[+]
  * name = "return"
  * resource = Example-MedicationDispense-DiGA-Name-And-PZN  
    