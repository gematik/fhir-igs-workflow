Instance: OperationCreateParametersInputExample
InstanceOf: Parameters
Title: "Beispiel für $create Operation Parameter"
Description: "Beispiel für Eingabeparameter der $create Operation zur Erstellung einer neuen Aufgabe"
Usage: #example
* parameter[+].name = "workflowType"
* parameter[=].valueCoding = GEM_ERP_CS_FlowType#160

// TODO / Question: ungenutztes Parameter Profil statt Operation Outcome?
Instance: ExampleCreateOperationOutputError
InstanceOf: TIFlowDiGACreateOperationOutput
Title: "Beispiel für Create-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Create-Operation mit FHIR-Validierungsfehlern"
Usage: #example
* parameter[+].name = "return"
* parameter[=].resource = ExampleAcceptResponseBundle

Instance: ExampleOperationCreateError
InstanceOf: OperationOutcome
Title: "Beispiel für Create-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Create-Operation mit FHIR-Validierungsfehlern"
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.text = "FHIR-Validation error"
  * diagnostics = """
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); 
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Coding|4.0.1);
    """