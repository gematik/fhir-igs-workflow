Instance: TIFLOW-CM-TelemetryDataStatusCodes
InstanceOf: ConceptMap
Title: "Telemetry Data Status Codes Concept Map"
Description: "Maps operation outcome codes to the telemetry data status codes"

Usage: #definition

* status = #active
* experimental = false
* version = "2.0.0"
* date = "2026-05-04"

// core
* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[+]
  * code = #TIFLOW_OCSP_BACKEND_ERROR
  * target[+]
    * code = #79001
    * equivalence = #equivalent

* group[=].element[+]
  * code = #TIFLOW_ACCESSCODE_MISMATCH
  * target[+]
    * code = #79200
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_ACCESS_CODE_INVALID
  * target[+]
    * code = #79201
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_ACCESS_PERMISSION_INVALID
  * target[+]
    * code = #79202
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_ALTERNATIVE_IK_FORBIDDEN
  * target[+]
    * code = #79203
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_AUTH_NOT_OWNER
  * target[+]
    * code = #79204
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
  * target[+]
    * code = #79205
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_BOM_DETECTED
  * target[+]
    * code = #79206
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CERTIFICATE_INVALID
  * target[+]
    * code = #79207
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_COMMUNICATION_PAYLOAD_INVALID
  * target[+]
    * code = #79208
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CONSENT_ALREADY_EXISTS
  * target[+]
    * code = #79209
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CONSENT_CATEGORY_INVALID
  * target[+]
    * code = #79210
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CONSENT_CATEGORY_REQUIRED
  * target[+]
    * code = #79211
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CONSENT_MISSING
  * target[+]
    * code = #79212
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CONSENT_REQUIRED
  * target[+]
    * code = #79213
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_COVERAGE_TYPE_MISMATCH
  * target[+]
    * code = #79214
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_FLOWTYPE_MISMATCH
  * target[+]
    * code = #79215
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_IKNR_INVALID
  * target[+]
    * code = #79216
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_INSURANT_NOT_ELIGIBLE
  * target[+]
    * code = #79217
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_KVNR_INVALID
  * target[+]
    * code = #79218
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_KVNR_MISMATCH
  * target[+]
    * code = #79219
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_LANR_ZANR_INVALID
  * target[+]
    * code = #79220
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_MEDICATION_DISPENSE_INVALID
  * target[+]
    * code = #79221
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_MEDICATION_DISPENSE_MISSING
  * target[+]
    * code = #79222
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_MESSAGE_TO_SELF
  * target[+]
    * code = #79223
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_META_PROFILE_INVALID
  * target[+]
    * code = #79224
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_MVO_NOT_VALID_YET
  * target[+]
    * code = #79225
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_RECIPIENT_INVALID
  * target[+]
    * code = #79226
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_SECRET_MISMATCH
  * target[+]
    * code = #79228
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH
  * target[+]
    * code = #79229
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_SIGNATURE_INVALID
  * target[+]
    * code = #79230
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE
  * target[+]
    * code = #79231
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_SIGNATURE_NO_OCSP_RESPONSE
  * target[+]
    * code = #79232
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TASK_DELETED
  * target[+]
    * code = #79233
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TASK_EXPIRED
  * target[+]
    * code = #79234
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TASK_ID_REQUIRED
  * target[+]
    * code = #79235
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TASK_NOT_FOUND
  * target[+]
    * code = #79236
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TASK_REQUIRED
  * target[+]
    * code = #79237
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TASK_STATUS_MISMATCH
  * target[+]
    * code = #79238
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_POPP_TOKEN_INVALID
  * target[+]
    * code = #79273
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_INTERNAL_ERROR
  * target[+]
    * code = #79274
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_TIMEOUT
  * target[+]
    * code = #79275
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_BLOCKED_FEATURE
  * target[+]
    * code = #79268
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_BLOCKED_FLOWTYPE
  * target[+]
    * code = #79270
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_NOT_SUPPORTED
  * target[+]
    * code = #79276
    * equivalence = #equivalent

* group[=].element[+]
  * code = #TIFLOW_RESOURCE_FULLURL_INVALID
  * target[+]
    * code = #79227
    * equivalence = #equivalent






// Non OperationOutcome JSON Fehlercodes
* group[+].source = "json-fehlercodes"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"
* group[=].element[+]
  * code = #invalidOid
  * target[+]
    * code = #79262
    * equivalence = #equivalent
* group[=].element[+]
  * code = #methodNotAllowed
  * target[+]
    * code = #79263
    * equivalence = #equivalent
* group[=].element[+]
  * code = #malformedRequest
  * target[+]
    * code = #79264
    * equivalence = #equivalent

// https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes
* group[+].source = "https://gematik.de/fhir/ti/CodeSystem/operation-outcome-details-codes"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[+]
  * code = #SVC_IDENTITY_MISMATCH
  * target[+]
    * code = #79255
    * equivalence = #equivalent
* group[=].element[+]
  * code = #SVC_INVALID_ACCESS_TOKEN
  * target[+]
    * code = #79256
    * equivalence = #equivalent
* group[=].element[+]
  * code = #SVC_TELEMATIKID_TEMPORARILY_BLOCKED
  * target[+]
    * code = #79257
    * equivalence = #equivalent
* group[=].element[+]
  * code = #SVC_VALIDATION_FAILED
  * target[+]
    * code = #79258
    * equivalence = #equivalent

// http://terminology.hl7.org/CodeSystem/operation-outcome
* group[+].source = "http://terminology.hl7.org/CodeSystem/operation-outcome"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[+]
  * code = #MSG_RESOURCE_ID_FAIL
  * target[+]
    * code = #79259
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_RESOURCE_ID_MISMATCH
  * target[+]
    * code = #79260
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_RESOURCE_ID_MISSING
  * target[+]
    * code = #79261
    * equivalence = #equivalent

* group[=].element[+]
  * code = #MSG_BAD_FORMAT
  * target[+]
    * code = #79265
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_BAD_SYNTAX
  * target[+]
    * code = #79266
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_DELETED
  * target[+]
    * code = #79267
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_PARAM_UNKNOWN
  * target[+]
    * code = #79269
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_UNKNOWN_OPERATION
  * target[+]
    * code = #79271
    * equivalence = #equivalent
* group[=].element[+]
  * code = #MSG_UNKNOWN_TYPE
  * target[+]
    * code = #79272
    * equivalence = #equivalent
