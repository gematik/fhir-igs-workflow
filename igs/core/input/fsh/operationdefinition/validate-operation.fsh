Instance: TIFlow-CORE-OP-Validate
InstanceOf: OperationDefinition
Usage: #definition
Title: "Validieren einer FHIR-Ressource"
Description: """Diese Operation validiert eine FHIR-Ressource gegen eine konfigurierbare FHIR-Konfiguration.

Sie erweitert die standardisierte FHIR $validate-Operation (http://hl7.org/fhir/OperationDefinition/Resource-validate) um einen gematik-spezifischen `fhir_config` Parameter zur Auswahl der Validierungskonfiguration.

Mit dem Parameter `returnBoolean` kann wahlweise ein kompaktes boolesches Ergebnis (`true`/`false`) angefordert werden, anstelle eines vollständigen OperationOutcome."""
// TI-Flow-26_2 DAV_03
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

* inputProfile = Canonical(TIFlowCOREValidateOperationInput)
* outputProfile = Canonical(TIFlowCOREValidateOperationOutput)

// ---- IN parameters ----

// The resource to validate (aligned with HL7 base op)
* parameter[+]
  * name = #resource
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Die zu validierende FHIR-Ressource."
  * type = #Resource

// Gematik-specific: selects the FHIR configuration to validate against
* parameter[+]
  * name = #fhir_config
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Angabe der FHIR-Konfiguration, gegen welche die Validierungskomponente validieren soll."
  * type = #code

// Optional profile to validate against (aligned with HL7 base op)
* parameter[+]
  * name = #profile
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Wenn angegeben, wird die Ressource gegen dieses spezifische Profil validiert. Falls der Server das Profil nicht kennt, wird ein Fehler zurückgegeben."
  * type = #canonical

// Quick-check flag: return boolean instead of full OperationOutcome
* parameter[+]
  * name = #returnBoolean
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Wenn 'true', gibt die Operation nur den Parameter 'valid' (boolean) zurück, ohne ein vollständiges OperationOutcome. Nützlich für schnelle Prüfungen, ob Daten valide sind."
  * type = #boolean

// ---- OUT parameters ----

// Full OperationOutcome (default output, omitted when returnBoolean=true)
* parameter[+]
  * name = #return
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Das Ergebnis der Validierung als OperationOutcome. Wird zurückgegeben, wenn 'returnBoolean' nicht gesetzt oder 'false' ist. Enthält keine Fehler, wenn die Validierung erfolgreich war."
  * type = #OperationOutcome

// Boolean result (only when returnBoolean=true)
* parameter[+]
  * name = #valid
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Boolesches Validierungsergebnis. Wird nur zurückgegeben, wenn 'returnBoolean=true' gesetzt wurde. 'true' bedeutet valide, 'false' bedeutet nicht valide."
  * type = #boolean
