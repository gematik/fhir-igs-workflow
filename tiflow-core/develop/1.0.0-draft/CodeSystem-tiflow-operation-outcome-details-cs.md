# TIFLOW Operation Outcome Details CS - TIFlow - Kernfunktionalitäten v1.0.0-draft

TIFlow - Kernfunktionalitäten

Version 1.0.0-draft - ci-build 

* [**Table of Contents**](toc.md)
* [**FHIR-Artefakte**](artifacts.md)
* **TIFLOW Operation Outcome Details CS**

## CodeSystem: TIFLOW Operation Outcome Details CS 

| | |
| :--- | :--- |
| *Official URL*:https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs | *Version*:1.0.0-draft |
| Draft as of 2026-04-14 | *Computable Name*:TIFLOWOperationOutcomeDetailsCS |

 
Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TIFLOWOperationOutcomeDetailsVS](ValueSet-tiflow-operation-outcome-details-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "tiflow-operation-outcome-details-cs",
  "url" : "https://gematik.de/fhir/tiflow/core/CodeSystem/tiflow-operation-outcome-details-cs",
  "version" : "1.0.0-draft",
  "name" : "TIFLOWOperationOutcomeDetailsCS",
  "title" : "TIFLOW Operation Outcome Details CS",
  "status" : "draft",
  "date" : "2026-04-14T09:43:07+00:00",
  "publisher" : "gematik GmbH",
  "contact" : [{
    "name" : "gematik GmbH",
    "telecom" : [{
      "system" : "url",
      "value" : "https://gematik.de"
    },
    {
      "system" : "email",
      "value" : "erp-umsetzung@gematik.de"
    }]
  }],
  "description" : "Codes, die im Rahmen des TIFlow in den OperationOutcomes.details angegeben werden können",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "DE",
      "display" : "Germany"
    }]
  }],
  "content" : "complete",
  "count" : 40,
  "concept" : [{
    "code" : "TIFLOW_SECRET_MISMATCH",
    "display" : "Task secret mismatch",
    "definition" : "The provided task secret does not match the secret stored for the task",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task-Secret stimmt nicht überein"
    }]
  },
  {
    "code" : "TIFLOW_MEDICATION_DISPENSE_MISSING",
    "display" : "MedicationDispense missing",
    "definition" : "A required MedicationDispense resource is missing for this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MedicationDispense fehlt"
    }]
  },
  {
    "code" : "TIFLOW_SIGNATURE_NO_OCSP_RESPONSE",
    "display" : "No OCSP response for signature",
    "definition" : "Certificate revocation status could not be determined because no OCSP response was available",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Keine OCSP-Antwort zur Signatur"
    }]
  },
  {
    "code" : "TIFLOW_AUTH_ROLE_NOT_ALLOWED",
    "display" : "Access role not allowed",
    "definition" : "The authenticated actor role is not permitted to execute this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Zugriffsrolle nicht zulässig"
    }]
  },
  {
    "code" : "TIFLOW_CONSENT_ALREADY_EXISTS",
    "display" : "Consent already exists",
    "definition" : "A consent for the same scope already exists and cannot be created again",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Einwilligung existiert bereits"
    }]
  },
  {
    "code" : "TIFLOW_CONSENT_CATEGORY_REQUIRED",
    "display" : "Consent category required",
    "definition" : "The consent category is mandatory and was not provided",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Einwilligungskategorie erforderlich"
    }]
  },
  {
    "code" : "TIFLOW_CONSENT_CATEGORY_INVALID",
    "display" : "Consent category invalid",
    "definition" : "The provided consent category is unknown or not allowed",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Einwilligungskategorie ungültig"
    }]
  },
  {
    "code" : "TIFLOW_ACCESSCODE_MISMATCH",
    "display" : "Access code mismatch",
    "definition" : "The provided access code does not match the access code assigned to the task",
    "designation" : [{
      "language" : "de-DE",
      "value" : "AccessCode stimmt nicht überein"
    }]
  },
  {
    "code" : "TIFLOW_TASK_REQUIRED",
    "display" : "Task required",
    "definition" : "A task reference is required for this operation but was not provided",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task-Angabe erforderlich"
    }]
  },
  {
    "code" : "TIFLOW_TASK_NOT_FOUND",
    "display" : "Task not found",
    "definition" : "The referenced task does not exist",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task nicht gefunden"
    }]
  },
  {
    "code" : "TIFLOW_CONSENT_REQUIRED",
    "display" : "Consent required",
    "definition" : "A valid consent is required to execute this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Einwilligung erforderlich"
    }]
  },
  {
    "code" : "TIFLOW_MESSAGE_TO_SELF",
    "display" : "Message to self not allowed",
    "definition" : "A communication message addressed to the sender itself is not permitted",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Nachricht an sich selbst nicht zulässig"
    }]
  },
  {
    "code" : "TIFLOW_COMMUNICATION_PAYLOAD_INVALID",
    "display" : "Communication payload invalid",
    "definition" : "The communication payload is syntactically or semantically invalid",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Kommunikationsinhalt ungültig"
    }]
  },
  {
    "code" : "TIFLOW_INSURANT_NOT_ELIGIBLE",
    "display" : "Insurant not eligible",
    "definition" : "The insurant does not meet the eligibility constraints for this communication flow",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Versicherter nicht berechtigt"
    }]
  },
  {
    "code" : "TIFLOW_RECIPIENT_INVALID",
    "display" : "Recipient invalid",
    "definition" : "The specified recipient is invalid for the requested communication",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Empfänger ungültig"
    }]
  },
  {
    "code" : "TIFLOW_TASK_STATUS_MISMATCH",
    "display" : "Task status mismatch",
    "definition" : "The task is in a status that does not allow execution of this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task-Status passt nicht"
    }]
  },
  {
    "code" : "TIFLOW_TASK_EXPIRED",
    "display" : "Task expired",
    "definition" : "The task cannot be processed because its redemption period has expired",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task ist abgelaufen"
    }]
  },
  {
    "code" : "TIFLOW_MVO_NOT_VALID_YET",
    "display" : "MVO not valid yet",
    "definition" : "The multi-prescription is not yet valid at the current point in time",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MVO noch nicht gültig"
    }]
  },
  {
    "code" : "TIFLOW_AUTH_NOT_OWNER",
    "display" : "Authenticated actor is not owner",
    "definition" : "The authenticated actor is not the owner of the addressed task",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Authentifizierter Akteur ist nicht Eigentümer"
    }]
  },
  {
    "code" : "TIFLOW_TASK_ID_REQUIRED",
    "display" : "Task id required",
    "definition" : "The operation requires a task id in the request",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task-ID erforderlich"
    }]
  },
  {
    "code" : "TIFLOW_KVNR_MISMATCH",
    "display" : "KVNR mismatch",
    "definition" : "The KVNR in the request does not match the KVNR assigned to the task context",
    "designation" : [{
      "language" : "de-DE",
      "value" : "KVNR stimmt nicht überein"
    }]
  },
  {
    "code" : "TIFLOW_SIGNATURE_INVALID",
    "display" : "Signature invalid",
    "definition" : "The digital signature is invalid or cannot be verified",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Signatur ungültig"
    }]
  },
  {
    "code" : "TIFLOW_FLOWTYPE_MISMATCH",
    "display" : "Flow type mismatch",
    "definition" : "The task flow type does not match the expected flow for this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Flowtyp passt nicht"
    }]
  },
  {
    "code" : "TIFLOW_KVNR_INVALID",
    "display" : "KVNR invalid",
    "definition" : "The provided KVNR is invalid or does not conform to the expected format",
    "designation" : [{
      "language" : "de-DE",
      "value" : "KVNR ungültig"
    }]
  },
  {
    "code" : "TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH",
    "display" : "Signature authoredOn mismatch",
    "definition" : "The authoredOn timestamp does not match the signed content",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Signaturzeitpunkt passt nicht"
    }]
  },
  {
    "code" : "TIFLOW_IKNR_INVALID",
    "display" : "IKNR invalid",
    "definition" : "The provided IKNR is invalid or not accepted in this context",
    "designation" : [{
      "language" : "de-DE",
      "value" : "IKNR ungültig"
    }]
  },
  {
    "code" : "TIFLOW_LANR_ZANR_INVALID",
    "display" : "LANR or ZANR invalid",
    "definition" : "The provided LANR or ZANR is invalid or not accepted for this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "LANR oder ZANR ungültig"
    }]
  },
  {
    "code" : "TIFLOW_TASK_DELETED",
    "display" : "Task deleted",
    "definition" : "The task was already cancelled or deleted and can no longer be processed",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Task wurde gelöscht"
    }]
  },
  {
    "code" : "TIFLOW_RESOURCE_FULLURL_INVALID",
    "display" : "Bundle fullUrl invalid",
    "definition" : "A resource fullUrl in the bundle is invalid or does not match the bundle rules",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Bundle-fullUrl ungültig"
    }]
  },
  {
    "code" : "TIFLOW_BOM_DETECTED",
    "display" : "Byte order mark detected",
    "definition" : "A UTF byte order mark was detected where it is not permitted",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Byte-Order-Mark erkannt"
    }]
  },
  {
    "code" : "TIFLOW_MEDICATION_DISPENSE_INVALID",
    "display" : "MedicationDispense invalid",
    "definition" : "The provided MedicationDispense resource is invalid for this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "MedicationDispense ungültig"
    }]
  },
  {
    "code" : "TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE",
    "display" : "Signature issuing role invalid",
    "definition" : "The signature was created by an actor role that is not allowed for the signed artifact",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Signaturrolle ungültig"
    }]
  },
  {
    "code" : "TIFLOW_COVERAGE_TYPE_MISMATCH",
    "display" : "Coverage type mismatch",
    "definition" : "The coverage type does not match the expected coverage context",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Coverage-Typ passt nicht"
    }]
  },
  {
    "code" : "TIFLOW_ALTERNATIVE_IK_FORBIDDEN",
    "display" : "Alternative IK forbidden",
    "definition" : "Use of an alternative IK is not permitted in this context",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Alternatives IK nicht erlaubt"
    }]
  },
  {
    "code" : "TIFLOW_ACCESS_PERMISSION_INVALID",
    "display" : "Access permission invalid",
    "definition" : "The requested access permission is invalid or not sufficient",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Zugriffsberechtigung ungültig"
    }]
  },
  {
    "code" : "TIFLOW_CONSENT_MISSING",
    "display" : "Consent missing",
    "definition" : "No required consent was found for this operation",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Einwilligung fehlt"
    }]
  },
  {
    "code" : "TIFLOW_ACCESS_CODE_INVALID",
    "display" : "Access code invalid",
    "definition" : "The provided access code is syntactically invalid",
    "designation" : [{
      "language" : "de-DE",
      "value" : "AccessCode ungültig"
    }]
  },
  {
    "code" : "TIFLOW_CERTIFICATE_INVALID",
    "display" : "Certificate invalid",
    "definition" : "The certificate used for authentication or signature validation is invalid",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Zertifikat ungültig"
    }]
  },
  {
    "code" : "TIFLOW_META_PROFILE_INVALID",
    "display" : "Meta profile invalid",
    "definition" : "The resource meta.profile entry is missing, invalid, or not supported",
    "designation" : [{
      "language" : "de-DE",
      "value" : "Meta-Profil ungültig"
    }]
  },
  {
    "code" : "TIFLOW_OCSP_BACKEND_ERROR",
    "display" : "Invalid OCSP response",
    "definition" : "Failed to retrieve the OCSP response for the certificate of the signature",
    "designation" : [{
      "language" : "de-DE",
      "value" : "OCSP Abfrage fehlgeschlagen"
    }]
  }]
}

```
