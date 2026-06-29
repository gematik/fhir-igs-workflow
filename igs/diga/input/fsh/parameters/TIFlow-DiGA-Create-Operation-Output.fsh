Profile: TIFlowDiGACreateOperationOutput
Parent: Parameters
Id: ti-flow-di-ga-create-operation-output
Title: "TIFlow DiGA Create Operation Output"
Description: "Dieses Profil definiert die Parameter für die Erstellung einer DiGA Aufgabe vom TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden."
* insert Meta

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains return 1..1

* parameter[return]
  * name MS
  * name = "return"
  * value[x] 0..0
  * resource 1..1
  * resource only TIFlowDiGATask
  * part 0..0
