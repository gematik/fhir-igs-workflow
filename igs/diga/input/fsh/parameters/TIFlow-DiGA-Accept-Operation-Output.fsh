Profile: TIFlowDiGAAcceptOperationOutput
Parent: Parameters
Id: ti-flow-di-ga-accept-operation-output
Title: "TIFlow DiGA Accept Operation Output"
Description: "Dieses Profil definiert die Parameter für die Annahme einer DiGA Verordnung vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $accept-Operation verwendet werden."
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
  * resource only Bundle
  * part 0..0
