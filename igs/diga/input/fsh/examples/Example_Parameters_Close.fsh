Instance: ExampleCloseInputParametersDiGA
InstanceOf: Parameters //TODO: Eigenes Parameters Definition für die Schnittstelle $close
Usage: #example
Title: "Example Close Parameters"
* parameter[+]
  * name = "rxDispensation"
  * part[+] //TODO: Named Slices
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-DiGA-Name-And-PZN