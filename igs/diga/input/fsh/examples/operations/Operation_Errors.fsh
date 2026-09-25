Instance: Example-Operation-Error-400-InvalidSignature
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 400 - Signatur ungültig"
Description: "Die digitale Signatur ist ungültig oder kann nicht verifiziert werden."
Usage: #example
* issue[+]
  * insert OperationOutcomeInvalid($cs-tiflow-oo-details, #TIFLOW_SIGNATURE_INVALID)
  * details.text = "Die digitale Signatur ist ungültig oder kann nicht verifiziert werden."

Instance: Example-Operation-Error-400-Validation-Failed
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 400 - FHIR-Profilvalidierung fehlgeschlagen"
Description: "Die FHIR-Profilvalidierung ist fehlgeschlagen."
Usage: #example
* issue[+]
  * insert OperationOutcomeInvalid($cs-ti-oo-details, #SVC_VALIDATION_FAILED)
  * details.text = "Die FHIR-Profilvalidierung ist fehlgeschlagen."
  * diagnostics = """
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Parameters|4.0.1); 
    Parameters.parameter[0].valueCoding: error: Code 140 is not part of CodeSystem 
    https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType (from profile: 
    http://hl7.org/fhir/StructureDefinition/Coding|4.0.1);
    """

Instance: Example-Operation-Error-400-MedicationDispense
InstanceOf: TIFlowOperationOutcome
Title: "Error 400 - MedicationDispense ungültig"
Description: "Die übermittelte MedicationDispense-Ressource ist für diese Operation ungültig."
Usage: #example
* issue[+]
  * severity = #error
  * code = #invalid
  * details.coding.system = $cs-tiflow-oo-details
  * details.coding.code = #TIFLOW_MEDICATION_DISPENSE_INVALID
  * details.text = "Unzulässige Abgabeinformationen: Für diesen Workflow sind nur Abgabeinformationen für digitale Gesundheitsanwendungen zulässig."

Instance: Example-Operation-Error-403-Role
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 403 - Zugriffsrolle nicht zulässig"
Description: "Der angemeldete Nutzer verfügt nicht über die erforderliche Berechtigung für diese Operation."
Usage: #example
* issue[+]
  * insert OperationOutcomeForbidden($cs-tiflow-oo-details, #TIFLOW_AUTH_ROLE_NOT_ALLOWED)
  * details.text = "Der Nutzer ist nicht berechtigt, die aufgerufene Operation anzufordern."

Instance: Example-Operation-Error-403-Identity-Mismatch
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 403 - Identitätsabgleich fehlgeschlagen"
Description: "Identitätsabgleich fehlgeschlagen: Der Access Token oder der x-insurantid-Header stimmt nicht mit den FHIR-Daten überein (Telematik-ID / KVNR)"
Usage: #example
* issue[+]
  * insert OperationOutcomeForbidden($cs-ti-oo-details, #SVC_IDENTITY_MISMATCH)
  * details.text = "Identity mismatch: Access token or x-insurantid header does not match FHIR data (Telematik-ID / KVNR)"

Instance: Example-Operation-Error-412-Task-Status
InstanceOf: TIFlowOperationOutcome
Title: "Fehler 412 - Task-Status passt nicht"
Description: "Der Task befindet sich in einem Status, der die Ausführung dieser Operation nicht zulässt."
Usage: #example
* issue[+]
  * insert OperationOutcomeConflict($cs-tiflow-oo-details, #TIFLOW_TASK_STATUS_MISMATCH)
  * details.text = "Task has invalid status."
