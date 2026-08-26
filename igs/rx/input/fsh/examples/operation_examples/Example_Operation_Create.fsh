Instance: OperationCreateParametersInputExample
InstanceOf: Parameters
Title: "Beispiel für $create Operation Parameter"
Description: "Beispiel für Eingabeparameter der $create Operation zur Erstellung einer neuen Aufgabe"
Usage: #example
* parameter[+].name = "workflowType"
* parameter[=].valueCoding = GEM_ERP_CS_FlowType#162

Instance: ExampleCreateOperationOutputError
InstanceOf: TIFlowOperationOutcome
Title: "Error 403 - Beispiel für Create-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Create-Operation mit FHIR-Validierungsfehlern"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.coding.system = $tiflow-core-oo-cs
  * details.coding.code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern"

Instance: ExampleOperationCreateError
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - Beispiel für Create-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Create-Operation mit FHIR-Validierungsfehlern"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $ti-oo
  * details.coding.code = #SVC_VALIDATION_FAILED
  * details.text = "FHIR Profile Validation Failed"
  * diagnostics = """
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); 
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Coding|4.0.1);
    """