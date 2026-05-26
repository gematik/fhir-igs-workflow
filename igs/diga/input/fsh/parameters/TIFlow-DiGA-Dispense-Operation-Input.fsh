Profile: TIFlowDiGADispenseOperationInput
Parent: Parameters
Id: ti-flow-di-ga-dispense-operation-input
Title: "TIFlow DiGA Dispense Operation Input"
Description: "Dieses Profil definiert die Parameter für die Abgabe einer DiGA Verordnung vom Kostenträger an den TI-Flow-Fachdienst. Dies kann für die $dispense-Operation verwendet werden."
* insert Meta

* parameter 1..*

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains rxDispensation 1..*

* parameter[rxDispensation]
  * name MS
  * name = "rxDispensation"
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains medicationDispense 1..1
  * part[medicationDispense]
    * name MS
    * name = "medicationDispense"
    * value[x] 0..0
    * resource 1..1
    * resource only GEM_ERP_PR_MedicationDispense_DiGA
    * part 0..0
