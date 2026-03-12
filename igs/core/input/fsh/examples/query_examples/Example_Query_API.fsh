Instance: QueryTaskSearchResponseBundle
InstanceOf: Bundle
Usage: #example
Title: "Antwortbundle fuer GET /Task"
Description: "Beispiel fuer eine Task-Suchantwort mit zwei Treffern"
* id = "example-searchset-task"
* type = #searchset
* total = 2
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task?status=ready&_count=2"
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/607255ed-ce41-47fc-aad3-cfce1c39963f"
* entry[=].resource = TaskInReadyState
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/b12eb5f7-91ce-4887-93c7-800454601377"
* entry[=].resource = TaskInCreatedState

Instance: QueryCommunicationSearchResponseBundle
InstanceOf: Bundle
Usage: #example
Title: "Antwortbundle fuer GET /Communication"
Description: "Beispiel fuer eine Communication-Suchantwort"
* id = "example-searchset-communication"
* type = #searchset
* total = 2
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Communication?received=NULL"
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Communication/Communication_DispenseRequest"
* entry[=].resource = Communication_DispenseRequest
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Communication/Communication_Reply_Pharmacy"
* entry[=].resource = Communication_Reply_Pharmacy

Instance: QueryAuditEventSearchResponseBundle
InstanceOf: Bundle
Usage: #example
Title: "Antwortbundle fuer GET /AuditEvent"
Description: "Beispiel fuer eine AuditEvent-Suchantwort"
* id = "example-searchset-auditevent"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/AuditEvent?date=ge2025-01-01"
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/AuditEvent/9361863d-fec0-4ba9-8776-7905cf1b0cfa"
* entry[=].resource = AuditEventSample

Instance: QueryMedicationDispenseSearchResponseBundle
InstanceOf: Bundle
Usage: #example
Title: "Antwortbundle fuer GET /MedicationDispense"
Description: "Beispiel fuer eine MedicationDispense-Suchantwort"
* id = "example-searchset-medicationdispense"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/MedicationDispense?whenhandedover=ge2025-01-01"
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/MedicationDispense/Example-MedicationDispense"
* entry[=].resource = Example-MedicationDispense

Instance: QueryConsentCHARGCONS
InstanceOf: Consent
Usage: #example
Title: "Einwilligung fuer den Use Case CHARGCONS"
Description: "Beispiel einer Consent-Ressource fuer die Consent-Query"
* id = "QueryConsentCHARGCONS"
* status = #active
* scope = http://terminology.hl7.org/CodeSystem/consentscope#patient-privacy "Privacy Consent"
* category[+] = http://loinc.org#59284-0 "Consent Document"
* patient.identifier.system = "http://fhir.de/sid/gkv/kvid-10"
* patient.identifier.value = "X123456789"
* dateTime = "2025-01-15T10:15:00+01:00"
* policyRule = http://terminology.hl7.org/CodeSystem/v3-ActCode#OPTIN

Instance: QueryConsentSearchResponseBundle
InstanceOf: Bundle
Usage: #example
Title: "Antwortbundle fuer GET /Consent"
Description: "Beispiel fuer eine Consent-Suchantwort"
* id = "example-searchset-consent"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Consent?category=CHARGCONS"
* entry[+].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Consent/QueryConsentCHARGCONS"
* entry[=].resource = QueryConsentCHARGCONS

Instance: QuerySubscriptionCreateRequest
InstanceOf: Subscription
Usage: #example
Title: "Anfrage fuer POST /Subscription"
Description: "Beispiel fuer eine Subscription-Anlage"
* id = "example-create-subscription-request"
* status = #requested
* reason = "Benachrichtigung ueber neue Communication-Ressourcen"
* criteria = "Communication?received=NULL&recipient=1-2-3-4-5"
* channel.type = #rest-hook
* channel.endpoint = "https://apotheke.example.org/erp/notification"
* channel.payload = #application/fhir+json

Instance: QuerySubscriptionCreateResponse
InstanceOf: Subscription
Usage: #example
Title: "Antwort fuer POST /Subscription"
Description: "Beispiel fuer eine erfolgreiche Subscription-Anlage"
* id = "example-create-subscription-response"
* status = #active
* reason = "Subscription erfolgreich registriert"
* criteria = "Communication?received=NULL&recipient=1-2-3-4-5"
* channel.type = #rest-hook
* channel.endpoint = "https://apotheke.example.org/erp/notification"
* channel.payload = #application/fhir+json
