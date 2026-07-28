Profile: TIFlowCOREValidateOperationInput
Parent: Parameters
Id: ti-flow-core-validate-operation-input
Title: "TIFlow CORE Validate Operation Input"
Description: "Dieses Profil definiert die Eingabeparameter für die $validate-Operation des TI-Flow-Fachdienstes."
* insert Meta

* parameter 1..*

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains
    resource 0..1 and
    fhir_config 1..1 and
    profile 0..1 and
    returnBoolean 0..1

// The FHIR resource to be validated
* parameter[resource]
  * name MS
  * name = "resource"
  * value[x] 0..0
  * resource 1..1 MS
  * part 0..0

// Gematik-specific: the FHIR configuration to validate against
* parameter[fhir_config]
  * name MS
  * name = "fhir_config"
  * value[x] only code
  * valueCode 1..1 MS
  * resource 0..0
  * part 0..0

// Optional profile to validate against
* parameter[profile]
  * name MS
  * name = "profile"
  * value[x] only canonical
  * valueCanonical 1..1 MS
  * resource 0..0
  * part 0..0

// Quick-check flag: return only boolean instead of full OperationOutcome
* parameter[returnBoolean]
  * name MS
  * name = "returnBoolean"
  * value[x] only boolean
  * valueBoolean 1..1 MS
  * resource 0..0
  * part 0..0
