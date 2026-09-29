Instance: TIFLOW-ERPCHRG-CM-TelemetryDataStatusCodes
InstanceOf: ConceptMap
Title: "ChargeItem Telemetry Data Status Codes Concept Map"
Description: "Maps ChargeItem operation outcome codes to the telemetry data status codes"
Usage: #definition

* status = #active
* experimental = false
* version = "2.0.0"
* date = "2026-05-04"

* group[+].source = "https://gematik.de/fhir/erp/CodeSystem/tiflow-chargeitem-operation-outcome-details-cs"
* group[=].target = "ti-flow-telemetriedaten-statuscodes"

* group[=].element[+]
  * code = #TIFLOW_CHARGEITEM_COVERAGE_NOT_PKV
  * target[+]
    * code = #79239
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CHARGEITEM_DISPENSE_CERTIFICATE_INVALID
  * target[+]
    * code = #79240
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CHARGEITEM_DISPENSE_SIGNATURE_INVALID
  * target[+]
    * code = #79241
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CHARGEITEM_ID_REQUIRED
  * target[+]
    * code = #79242
    * equivalence = #equivalent
* group[=].element[+]
  * code = #TIFLOW_CHARGEITEM_NOT_FOUND
  * target[+]
    * code = #79243
    * equivalence = #equivalent