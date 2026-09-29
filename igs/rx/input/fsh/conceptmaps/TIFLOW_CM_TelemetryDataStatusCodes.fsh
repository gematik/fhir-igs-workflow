Instance: TIFLOW-RX-CM-TelemetryDataStatusCodes
InstanceOf: ConceptMap
Title: "Rx Telemetry Data Status Codes Concept Map"
Description: "Maps Rx operation outcome codes to the telemetry data status codes"
Usage: #definition

* status = #active
* experimental = false
* version = "2.0.0"
* date = "2026-05-04"

* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-erezept-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[+]
  * code = #TIFLOW_EREZEPT_DRUG_CATEGORY_FORBIDDEN
  * target[+]
    * code = #79247
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_MVO_ENDDATE_INVALID
  * target[+]
    * code = #79248
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_MVO_FLOWTYPE_INVALID
  * target[+]
    * code = #79249
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_MVO_ID_INVALID
  * target[+]
    * code = #79250
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_MVO_INVALID
  * target[+]
    * code = #79251
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_MVO_NOT_VALID
  * target[+]
    * code = #79252
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_MVO_STARTDATE_INVALID
  * target[+]
    * code = #79253
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_PZN_INVALID
  * target[+]
    * code = #79254
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_COUNTRY_CODE_INVALID
  * target[+]
    * code = #79244
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_NOT_ACTIVATED
  * target[+]
    * code = #79245
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_EREZEPT_NO_PRESCRIPTIONS_FOUND
  * target[+]
    * code = #79246
    * equivalence = #equivalent