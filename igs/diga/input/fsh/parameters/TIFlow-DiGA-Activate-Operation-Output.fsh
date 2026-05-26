Profile: TIFlow-DiGA-Activate-Operation-Output
Parent: Parameters
Id: ti-flow-di-ga-activate-operation-output
Title: "TIFlow DiGA Activate Operation Output"
Description: "Dieses Profil definiert die Parameter für die Aktivierung einer DiGA Aufgabe vom TI-Flow-Fachdienst. Dies kann für die $activate-Operation verwendet werden."
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
