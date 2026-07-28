Profile: TIFlowCOREValidateOperationOutput
Parent: Parameters
Id: ti-flow-core-validate-operation-output
Title: "TIFlow CORE Validate Operation Output"
Description: "Dieses Profil definiert die Ausgabeparameter für die $validate-Operation des TI-Flow-Fachdienstes."
* insert Meta

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains
    return 0..1 and
    valid 0..1

// Full OperationOutcome result (returned when returnBoolean=false or absent)
* parameter[return]
  * name MS
  * name = "return"

  * value[x] 0..0
  * resource 1..1 MS
  * resource only OperationOutcome
  * part 0..0

// Boolean shortcut result (returned when returnBoolean=true)
* parameter[valid]
  * name MS
  * name = "valid"
  * value[x] only boolean
  * valueBoolean 1..1 MS
  * resource 0..0
  * part 0..0
