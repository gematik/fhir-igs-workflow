Instance: TIFLOW-CM-TelemetryDataStatusCodes
InstanceOf: ConceptMap
Title: "Telemetry Data Status Codes Concept Map"
Description: "Maps operation outcome codes to the telemetry data status codes"

Usage: #definition

* status = #draft
* experimental = false
* version = "1.0.0"
* date = "2026-05-04"

// core
* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[0].code = #TIFLOW_OCSP_BACKEND_ERROR
* group[=].element[0].target[0].code = #79001
* group[=].element[0].target[0].equivalence = #equivalent

* group[=].element[1].code = #TIFLOW_ACCESSCODE_MISMATCH
* group[=].element[1].target[0].code = #79200
* group[=].element[1].target[0].equivalence = #equivalent
* group[=].element[2].code = #TIFLOW_ACCESS_CODE_INVALID
* group[=].element[2].target[0].code = #79201
* group[=].element[2].target[0].equivalence = #equivalent
* group[=].element[3].code = #TIFLOW_ACCESS_PERMISSION_INVALID
* group[=].element[3].target[0].code = #79202
* group[=].element[3].target[0].equivalence = #equivalent
* group[=].element[4].code = #TIFLOW_ALTERNATIVE_IK_FORBIDDEN
* group[=].element[4].target[0].code = #79203
* group[=].element[4].target[0].equivalence = #equivalent
* group[=].element[5].code = #TIFLOW_AUTH_NOT_OWNER
* group[=].element[5].target[0].code = #79204
* group[=].element[5].target[0].equivalence = #equivalent
* group[=].element[6].code = #TIFLOW_AUTH_ROLE_NOT_ALLOWED
* group[=].element[6].target[0].code = #79205
* group[=].element[6].target[0].equivalence = #equivalent
* group[=].element[7].code = #TIFLOW_BOM_DETECTED
* group[=].element[7].target[0].code = #79206
* group[=].element[7].target[0].equivalence = #equivalent
* group[=].element[8].code = #TIFLOW_CERTIFICATE_INVALID
* group[=].element[8].target[0].code = #79207
* group[=].element[8].target[0].equivalence = #equivalent
* group[=].element[9].code = #TIFLOW_COMMUNICATION_PAYLOAD_INVALID
* group[=].element[9].target[0].code = #79208
* group[=].element[9].target[0].equivalence = #equivalent
* group[=].element[10].code = #TIFLOW_CONSENT_ALREADY_EXISTS
* group[=].element[10].target[0].code = #79209
* group[=].element[10].target[0].equivalence = #equivalent
* group[=].element[11].code = #TIFLOW_CONSENT_CATEGORY_INVALID
* group[=].element[11].target[0].code = #79210
* group[=].element[11].target[0].equivalence = #equivalent
* group[=].element[12].code = #TIFLOW_CONSENT_CATEGORY_REQUIRED
* group[=].element[12].target[0].code = #79211
* group[=].element[12].target[0].equivalence = #equivalent
* group[=].element[13].code = #TIFLOW_CONSENT_MISSING
* group[=].element[13].target[0].code = #79212
* group[=].element[13].target[0].equivalence = #equivalent
* group[=].element[14].code = #TIFLOW_CONSENT_REQUIRED
* group[=].element[14].target[0].code = #79213
* group[=].element[14].target[0].equivalence = #equivalent
* group[=].element[15].code = #TIFLOW_COVERAGE_TYPE_MISMATCH
* group[=].element[15].target[0].code = #79214
* group[=].element[15].target[0].equivalence = #equivalent
* group[=].element[16].code = #TIFLOW_FLOWTYPE_MISMATCH
* group[=].element[16].target[0].code = #79215
* group[=].element[16].target[0].equivalence = #equivalent
* group[=].element[17].code = #TIFLOW_IKNR_INVALID
* group[=].element[17].target[0].code = #79216
* group[=].element[17].target[0].equivalence = #equivalent
* group[=].element[18].code = #TIFLOW_INSURANT_NOT_ELIGIBLE
* group[=].element[18].target[0].code = #79217
* group[=].element[18].target[0].equivalence = #equivalent
* group[=].element[19].code = #TIFLOW_KVNR_INVALID
* group[=].element[19].target[0].code = #79218
* group[=].element[19].target[0].equivalence = #equivalent
* group[=].element[20].code = #TIFLOW_KVNR_MISMATCH
* group[=].element[20].target[0].code = #79219
* group[=].element[20].target[0].equivalence = #equivalent
* group[=].element[21].code = #TIFLOW_LANR_ZANR_INVALID
* group[=].element[21].target[0].code = #79220
* group[=].element[21].target[0].equivalence = #equivalent
* group[=].element[22].code = #TIFLOW_MEDICATION_DISPENSE_INVALID
* group[=].element[22].target[0].code = #79221
* group[=].element[22].target[0].equivalence = #equivalent
* group[=].element[23].code = #TIFLOW_MEDICATION_DISPENSE_MISSING
* group[=].element[23].target[0].code = #79222
* group[=].element[23].target[0].equivalence = #equivalent
* group[=].element[24].code = #TIFLOW_MESSAGE_TO_SELF
* group[=].element[24].target[0].code = #79223
* group[=].element[24].target[0].equivalence = #equivalent
* group[=].element[25].code = #TIFLOW_META_PROFILE_INVALID
* group[=].element[25].target[0].code = #79224
* group[=].element[25].target[0].equivalence = #equivalent
* group[=].element[26].code = #TIFLOW_MVO_NOT_VALID_YET
* group[=].element[26].target[0].code = #79225
* group[=].element[26].target[0].equivalence = #equivalent
* group[=].element[27].code = #TIFLOW_RECIPIENT_INVALID
* group[=].element[27].target[0].code = #79226
* group[=].element[27].target[0].equivalence = #equivalent
* group[=].element[28].code = #TIFLOW_RESOURCE_FULLURL_INVALID
* group[=].element[28].target[0].code = #79227
* group[=].element[28].target[0].equivalence = #equivalent
* group[=].element[29].code = #TIFLOW_SECRET_MISMATCH
* group[=].element[29].target[0].code = #79228
* group[=].element[29].target[0].equivalence = #equivalent
* group[=].element[30].code = #TIFLOW_SIGNATURE_AUTHOREDON_MISMATCH
* group[=].element[30].target[0].code = #79229
* group[=].element[30].target[0].equivalence = #equivalent
* group[=].element[31].code = #TIFLOW_SIGNATURE_INVALID
* group[=].element[31].target[0].code = #79230
* group[=].element[31].target[0].equivalence = #equivalent
* group[=].element[32].code = #TIFLOW_SIGNATURE_INVALID_ISSUING_ROLE
* group[=].element[32].target[0].code = #79231
* group[=].element[32].target[0].equivalence = #equivalent
* group[=].element[33].code = #TIFLOW_SIGNATURE_NO_OCSP_RESPONSE
* group[=].element[33].target[0].code = #79232
* group[=].element[33].target[0].equivalence = #equivalent
* group[=].element[34].code = #TIFLOW_TASK_DELETED
* group[=].element[34].target[0].code = #79233
* group[=].element[34].target[0].equivalence = #equivalent
* group[=].element[35].code = #TIFLOW_TASK_EXPIRED
* group[=].element[35].target[0].code = #79234
* group[=].element[35].target[0].equivalence = #equivalent
* group[=].element[36].code = #TIFLOW_TASK_ID_REQUIRED
* group[=].element[36].target[0].code = #79235
* group[=].element[36].target[0].equivalence = #equivalent
* group[=].element[37].code = #TIFLOW_TASK_NOT_FOUND
* group[=].element[37].target[0].code = #79236
* group[=].element[37].target[0].equivalence = #equivalent
* group[=].element[38].code = #TIFLOW_TASK_REQUIRED
* group[=].element[38].target[0].code = #79237
* group[=].element[38].target[0].equivalence = #equivalent
* group[=].element[39].code = #TIFLOW_TASK_STATUS_MISMATCH
* group[=].element[39].target[0].code = #79238
* group[=].element[39].target[0].equivalence = #equivalent
* group[=].element[40].code = #MSG_RESOURCE_ID_FAIL
* group[=].element[40].target[0].code = #79255
* group[=].element[40].target[0].equivalence = #equivalent
* group[=].element[41].code = #MSG_RESOURCE_ID_MISMATCH
* group[=].element[41].target[0].code = #79256
* group[=].element[41].target[0].equivalence = #equivalent
* group[=].element[42].code = #MSG_RESOURCE_ID_MISSING
* group[=].element[42].target[0].code = #79257
* group[=].element[42].target[0].equivalence = #equivalent
* group[=].element[43].code = #SVC_IDENTITY_MISMATCH
* group[=].element[43].target[0].code = #79258
* group[=].element[43].target[0].equivalence = #equivalent
* group[=].element[44].code = #SVC_INVALID_ACCESS_TOKEN
* group[=].element[44].target[0].code = #79259
* group[=].element[44].target[0].equivalence = #equivalent
* group[=].element[45].code = #SVC_TELEMATIKID_TEMPORARILY_BLOCKED
* group[=].element[45].target[0].code = #79260
* group[=].element[45].target[0].equivalence = #equivalent
* group[=].element[46].code = #SVC_VALIDATION_FAILED
* group[=].element[46].target[0].code = #79261
* group[=].element[46].target[0].equivalence = #equivalent


// TIFLOW_CHARGEITEM_CS_OperationOutcomeDetails.fsh
* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[0].code = #TIFLOW_CHARGEITEM_COVERAGE_NOT_PKV
* group[=].element[0].target[0].code = #79239
* group[=].element[0].target[0].equivalence = #equivalent
* group[=].element[1].code = #TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID
* group[=].element[1].target[0].code = #79240
* group[=].element[1].target[0].equivalence = #equivalent
* group[=].element[2].code = #TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID
* group[=].element[2].target[0].code = #79241
* group[=].element[2].target[0].equivalence = #equivalent
* group[=].element[3].code = #TIFLOW_CHARGEITEM_ID_REQUIRED
* group[=].element[3].target[0].code = #79242
* group[=].element[3].target[0].equivalence = #equivalent
* group[=].element[4].code = #TIFLOW_CHARGEITEM_NOT_FOUND
* group[=].element[4].target[0].code = #79243
* group[=].element[4].target[0].equivalence = #equivalent

// TIFLOW_XBORDER_CS_OperationOutcomeDetails.fsh
* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-xborder-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[0].code = #TIFLOW_XBORDER_COUNTRY_CODE_INVALID
* group[=].element[0].target[0].code = #79244
* group[=].element[0].target[0].equivalence = #equivalent
* group[=].element[1].code = #TIFLOW_XBORDER_NOT_ACTIVATED
* group[=].element[1].target[0].code = #79245
* group[=].element[1].target[0].equivalence = #equivalent
* group[=].element[2].code = #TIFLOW_XBORDER_NO_PRESCRIPTIONS_FOUND
* group[=].element[2].target[0].code = #79246
* group[=].element[2].target[0].equivalence = #equivalent

// TIFLOW_EREZEPT_CS_OperationOutcomeDetails.fsh
* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[0].code = #TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN
* group[=].element[0].target[0].code = #79247
* group[=].element[0].target[0].equivalence = #equivalent
* group[=].element[1].code = #TIFLOW_EREZEPT_MVO_ENDDATE_INVALID
* group[=].element[1].target[0].code = #79248
* group[=].element[1].target[0].equivalence = #equivalent
* group[=].element[2].code = #TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID
* group[=].element[2].target[0].code = #79249
* group[=].element[2].target[0].equivalence = #equivalent
* group[=].element[3].code = #TIFLOW_EREZEPT_MVO_ID_INVALID
* group[=].element[3].target[0].code = #79250
* group[=].element[3].target[0].equivalence = #equivalent
* group[=].element[4].code = #TIFLOW_EREZEPT_MVO_INVALID
* group[=].element[4].target[0].code = #79251
* group[=].element[4].target[0].equivalence = #equivalent
* group[=].element[5].code = #TIFLOW_EREZEPT_MVO_NOT_VALID
* group[=].element[5].target[0].code = #79252
* group[=].element[5].target[0].equivalence = #equivalent
* group[=].element[6].code = #TIFLOW_EREZEPT_MVO_STARTDATE_INVALID
* group[=].element[6].target[0].code = #79253
* group[=].element[6].target[0].equivalence = #equivalent
* group[=].element[7].code = #TIFLOW_EREZEPT_PZN_INVALID
* group[=].element[7].target[0].code = #79254
* group[=].element[7].target[0].equivalence = #equivalent

// Non OperationOutcome JSON Fehlercodes
* group[+].source = "json-fehlercodes"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"
* group[=].element[0].code = #invalidOid
* group[=].element[0].target[0].code = #79262
* group[=].element[0].target[0].equivalence = #equivalent
* group[=].element[1].code = #methodNotAllowed
* group[=].element[1].target[0].code = #79263
* group[=].element[1].target[0].equivalence = #equivalent
