Instance: ExampleCommunicationDispReq
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Zuweisung des Patienten an die Apotheke"
Description: "Beispiel für eine Nachricht des Patienten an die Apotheke zur Anfrage der Medikamentenabgabe mit AccessCode"
Usage: #inline
* basedOn.reference = "Task/160.000.033.491.280.78"
* insert TaskExension(160)
* insert ApoTelematikID(recipient.identifier)
* insert GKV_Identifier(sender.identifier)
* insert DateTimeStamp(sent)
* status = #unknown
* payload.contentString = "{ \"version\": 1, \"supplyOptionsType\": \"onPremise\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"phone\": \"004916094858168\" }"

Instance: ExampleCommunicationGetDispReq
InstanceOf: Bundle
Usage: #example
Title: "Communication searchset response for Rx"
Description: "Example response for GET /Communication"
* type = #searchset
* total = 1
* link[+].relation = "self"
* link[=].url = "https://erp-ref.example.org/Communication?_sort=sent&_count=50&sent=gt2025-01-14"
* entry[+].fullUrl = "https://erp-ref.example.org/Communication/ExampleCommunicationDispReq"
* entry[=].resource = ExampleCommunicationDispReq
* entry[=].search.mode = #match

/*
Instance: INVALID-Communication-DispenseRequest-DiGA
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "Communication message sent by patient to insurance company to request the dispensation of a DiGA by providing the AccessCode"
Usage: #example
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#162 "Flowtype für Digitale Gesundheitsanwendungen"
* basedOn.reference = "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "8-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.contentString = "U.N.V.E.U"

Instance: INVALID-Communication-DispenseRequest-INV-flowType
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "UNGÜLTIG: DiGA-Abgabe-Anfrage mit falschem FlowType"
Description: "Ungültiges Beispiel für eine DiGA-Abgabe-Anfrage mit inkorrektem FlowType zur Validierung"
Usage: #example
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#162 "Flowtype für Digitale Gesundheitsanwendungen"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "8-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)

Instance: INVALID-Communication-DispenseRequest
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "UNGÜLTIG: Abgabe-Anfrage ohne Payload"
Description: "Ungültiges Beispiel für eine Abgabe-Anfrage ohne erforderlichen Payload-Inhalt zur Validierung"
Usage: #example
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
*/