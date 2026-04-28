CodeSystem: TIFLOWOperationOutcomeDetailsCS
Id: tiflow-operation-outcome-details-cs
Title: "TIFLOW Operation Outcome Details CS"
Description: "Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können"
* insert Meta-CS

* #TIFLOW_SECRET_MISMATCH "Task secret mismatch" "The provided task secret does not match the secret stored for the task"
  * ^designation.language = #de-DE
  * ^designation.value = "Task-Secret stimmt nicht überein"
* #TIFLOW_MEDICATION_DISPENSE_MISSING "MedicationDispense missing" "A required MedicationDispense resource is missing for this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "MedicationDispense fehlt"
* #TIFLOW_SIGNATURE_NO_OCSP_RESPONSE "No OCSP response for signature" "Certificate revocation status could not be determined because no OCSP response was available"
  * ^designation.language = #de-DE
  * ^designation.value = "Keine OCSP-Antwort zur Signatur"
* #TIFLOW_AUTH_ROLE_NOT_ALLOWED "Access role not allowed" "The authenticated actor role is not permitted to execute this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "Zugriffsrolle nicht zulässig"
* #TIFLOW_CONSENT_ALREADY_EXISTS "Consent already exists" "A consent for the same scope already exists and cannot be created again"
  * ^designation.language = #de-DE
  * ^designation.value = "Einwilligung existiert bereits"
* #TIFLOW_CONSENT_CATEGORY_REQUIRED "Consent category required" "The consent category is mandatory and was not provided"
  * ^designation.language = #de-DE
  * ^designation.value = "Einwilligungskategorie erforderlich"
* #TIFLOW_CONSENT_CATEGORY_INVALID "Consent category invalid" "The provided consent category is unknown or not allowed"
  * ^designation.language = #de-DE
  * ^designation.value = "Einwilligungskategorie ungültig"
* #TIFLOW_ACCESSCODE_MISMATCH "Access code mismatch" "The provided access code does not match the access code assigned to the task"
  * ^designation.language = #de-DE
  * ^designation.value = "AccessCode stimmt nicht überein"
* #TIFLOW_TASK_REQUIRED "Task required" "A task reference is required for this operation but was not provided"
  * ^designation.language = #de-DE
  * ^designation.value = "Task-Angabe erforderlich"
* #TIFLOW_TASK_NOT_FOUND "Task not found" "The referenced task does not exist"
  * ^designation.language = #de-DE
  * ^designation.value = "Task nicht gefunden"
* #TIFLOW_CONSENT_REQUIRED "Consent required" "A valid consent is required to execute this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "Einwilligung erforderlich"
* #TIFLOW_MESSAGE_TO_SELF "Message to self not allowed" "A communication message addressed to the sender itself is not permitted"
  * ^designation.language = #de-DE
  * ^designation.value = "Nachricht an sich selbst nicht zulässig"
* #TIFLOW_COMMUNICATION_PAYLOAD_INVALID "Communication payload invalid" "The communication payload is syntactically or semantically invalid"
  * ^designation.language = #de-DE
  * ^designation.value = "Kommunikationsinhalt ungültig"
* #TIFLOW_INSURANT_NOT_ELIGIBLE "Insurant not eligible" "The insurant does not meet the eligibility constraints for this communication flow"
  * ^designation.language = #de-DE
  * ^designation.value = "Versicherter nicht berechtigt"
* #TIFLOW_RECIPIENT_INVALID "Recipient invalid" "The specified recipient is invalid for the requested communication"
  * ^designation.language = #de-DE
  * ^designation.value = "Empfänger ungültig"
* #TIFLOW_TASK_STATUS_MISMATCH "Task status mismatch" "The task is in a status that does not allow execution of this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "Task-Status passt nicht"
* #TIFLOW_TASK_EXPIRED "Task expired" "The task cannot be processed because its redemption period has expired"
  * ^designation.language = #de-DE
  * ^designation.value = "Task ist abgelaufen"
* #TIFLOW_MVO_NOT_VALID_YET "MVO not valid yet" "The multi-prescription is not yet valid at the current point in time"
  * ^designation.language = #de-DE
  * ^designation.value = "MVO noch nicht gültig"
* #TIFLOW_AUTH_NOT_OWNER "Authenticated actor is not owner" "The authenticated actor is not the owner of the addressed task"
  * ^designation.language = #de-DE
  * ^designation.value = "Authentifizierter Akteur ist nicht Eigentümer"
* #TIFLOW_TASK_ID_REQUIRED "Task id required" "The operation requires a task id in the request"
  * ^designation.language = #de-DE
  * ^designation.value = "Task-ID erforderlich"
* #TIFLOW_KVNR_MISMATCH "KVNR mismatch" "The KVNR in the request does not match the KVNR assigned to the task context"
  * ^designation.language = #de-DE
  * ^designation.value = "KVNR stimmt nicht überein"
* #TIFLOW_SIGNATURE_INVALID "Signature invalid" "The digital signature is invalid or cannot be verified"
  * ^designation.language = #de-DE
  * ^designation.value = "Signatur ungültig"
* #TIFLOW_FLOWTYPE_MISMATCH "Flow type mismatch" "The task flow type does not match the expected flow for this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "Flowtyp passt nicht"
* #TIFLOW_KVNR_INVALID "KVNR invalid" "The provided KVNR is invalid or does not conform to the expected format"
  * ^designation.language = #de-DE
  * ^designation.value = "KVNR ungültig"
* #TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH "Signature authoredOn mismatch" "The authoredOn timestamp does not match the signed content"
  * ^designation.language = #de-DE
  * ^designation.value = "Signaturzeitpunkt passt nicht"
* #TIFLOW_IKNR_INVALID "IKNR invalid" "The provided IKNR is invalid or not accepted in this context"
  * ^designation.language = #de-DE
  * ^designation.value = "IKNR ungültig"
* #TIFLOW_LANR_ZANR_INVALID "LANR or ZANR invalid" "The provided LANR or ZANR is invalid or not accepted for this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "LANR oder ZANR ungültig"
* #TIFLOW_TASK_DELETED "Task deleted" "The task was already cancelled or deleted and can no longer be processed"
  * ^designation.language = #de-DE
  * ^designation.value = "Task wurde gelöscht"
* #TIFLOW_RESOURCE_FULLURL_INVALID "Bundle fullUrl invalid" "A resource fullUrl in the bundle is invalid or does not match the bundle rules"
  * ^designation.language = #de-DE
  * ^designation.value = "Bundle-fullUrl ungültig"
* #TIFLOW_BOM_DETECTED "Byte order mark detected" "A UTF byte order mark was detected where it is not permitted"
  * ^designation.language = #de-DE
  * ^designation.value = "Byte-Order-Mark erkannt"
* #TIFLOW_MEDICATION_DISPENSE_INVALID "MedicationDispense invalid" "The provided MedicationDispense resource is invalid for this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "MedicationDispense ungültig"
* #TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE "Signature issuing role invalid" "The signature was created by an actor role that is not allowed for the signed artifact"
  * ^designation.language = #de-DE
  * ^designation.value = "Signaturrolle ungültig"
* #TIFLOW_COVERAGE_TYPE_MISMATCH "Coverage type mismatch" "The coverage type does not match the expected coverage context"
  * ^designation.language = #de-DE
  * ^designation.value = "Coverage-Typ passt nicht"
* #TIFLOW_ALTERNATIVE_IK_FORBIDDEN "Alternative IK forbidden" "Use of an alternative IK is not permitted in this context"
  * ^designation.language = #de-DE
  * ^designation.value = "Alternatives IK nicht erlaubt"
* #TIFLOW_ACCESS_PERMISSION_INVALID "Access permission invalid" "The requested access permission is invalid or not sufficient"
  * ^designation.language = #de-DE
  * ^designation.value = "Zugriffsberechtigung ungültig"
* #TIFLOW_CONSENT_MISSING "Consent missing" "No required consent was found for this operation"
  * ^designation.language = #de-DE
  * ^designation.value = "Einwilligung fehlt"
* #TIFLOW_ACCESS_CODE_INVALID "Access code invalid" "The provided access code is syntactically invalid"
  * ^designation.language = #de-DE
  * ^designation.value = "AccessCode ungültig"
* #TIFLOW_CERTIFICATE_INVALID "Certificate invalid" "The certificate used for authentication or signature validation is invalid"
  * ^designation.language = #de-DE
  * ^designation.value = "Zertifikat ungültig"
* #TIFLOW_META_PROFILE_INVALID "Meta profile invalid" "The resource meta.profile entry is missing, invalid, or not supported"
  * ^designation.language = #de-DE
  * ^designation.value = "Meta-Profil ungültig"
* #TIFLOW_OCSP_BACKEND_ERROR "Invalid OCSP response" "Failed to retrieve the OCSP response for the certificate of the signature"
  * ^designation.language = #de-DE
  * ^designation.value = "OCSP Abfrage fehlgeschlagen"
