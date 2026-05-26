Profile: TIFlowDiGAActivateOperationInput
Parent: Parameters
Id: ti-flow-di-ga-activate-operation-input
Title: "TIFlow DiGA Activate Operation Input"
Description: "Dieses Profil definiert die Parameter für die Aktivierung einer DiGA Verordnung vom Kostenträger zum TI-Flow-Fachdienst. Dies kann für die $activate-Operation verwendet werden."
* insert Meta

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains ePrescription 1..1

* parameter[ePrescription]
  * name MS
  * name = "ePrescription"
  * part 0..0
  * value[x] 0..0
  * resource 1..1 MS
  * resource only TIFlowDiGABinary
