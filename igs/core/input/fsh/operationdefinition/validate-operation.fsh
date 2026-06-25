Instance: TIFlow-CORE-OP-Validate
InstanceOf: OperationDefinition
Usage: #definition
Title: "Validieren einer FHIR-Ressource"
Description: "Diese Operation validiert einen Datensatz basierend auf einer FHIR Konfiguration."

* insert Meta-Instance
* kind = #operation
* affectsState = false
* system = true
* type = false
* instance = false

* base = $fhir-validate-op

* code = #validate
* id = "tiflow-core-validate-op"
* name = "TIFlow-CORE-OP-Validate"

// in
* parameter[+]
  * name = #fhir_config
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Angabe der FHIR-Konfiguration gegen welche die Validierungskomponente validieren soll."
  * type = #code
