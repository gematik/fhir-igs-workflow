Instance: OperationCreateParametersInputExample
InstanceOf: Parameters
Title: "Beispiel für $create Operation Parameter"
Description: "Beispiel für Eingabeparameter der $create Operation zur Erstellung einer neuen Aufgabe"
Usage: #example
* parameter[+].name = "workflowType"
* parameter[=].valueCoding = GEM_ERP_CS_FlowType#162


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

Instance: ExampleCreateOperationOutputError
InstanceOf: OperationOutcome
Title: "Fehler 403 - Beispiel für Create-Operation Fehlerantwort"
Description: "Beispiel für eine Fehlerantwort bei der Create-Operation mit FHIR-Validierungsfehlern"
Usage: #example
* issue[+]
  * severity = #error
  * code = #forbidden
  * details.coding.code = #BLOCKED_FLOWTYPE
  * details.text = "The Flowtype may not be used in the TI-Flow-Fachdienst"

// taken from https://github.com/gematik/eRezept-Examples/blob/2f3598589e4f95887fcb0bef285c696752f6b0c2/api-examples/fsh/input/fsh/examples/erp_diga/01_task_162_create.fsh
// example and following rulesets
Instance: erp-diga-01-task-162-create
InstanceOf: GEM_ERP_PR_Task
Usage: #example
* id = "162.000.000.000.000.01"
* meta.id = "Task-erp-diga-01-task-162-create"
* insert DiGA_Task(draft)



RuleSet: DiGA_Task(status)
* status = #{status}
* insert Task162Exension
* extension[flowType].valueCoding.display = "Muster 16 (Digitale Gesundheitsanwendungen)"
* insert TaskIdentifier(162)
* insert GKV_Identifier(for.identifier)
* insert TaskMiscInfo
* performerType = $GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.59 "Kostenträger"
* performerType.text = "Kostenträger"

RuleSet: Task162Exension
* extension[flowType].valueCoding = $GEM_ERP_CS_FlowType#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* insert DiGAExpiryDate(extension[acceptDate].valueDate) // Expiry, weil so festgelegt beide Daten 3 Monate
* insert DiGAExpiryDate(extension[expiryDate].valueDate)

RuleSet: TaskIdentifier(flowType)
* identifier[PrescriptionID].use = #official
* identifier[PrescriptionID].value = "{flowType}.000.000.000.000.01"

RuleSet: GKV_Identifier(field)
* insert KVNR({field}.value)
* {field}.system = "http://fhir.de/sid/gkv/kvid-10"

RuleSet: TaskMiscInfo
* insert DateTime(authoredOn)
* insert DateTimeStamp(lastModified)