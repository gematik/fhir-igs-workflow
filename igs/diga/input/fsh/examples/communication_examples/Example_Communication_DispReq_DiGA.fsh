Instance: Communication_DispenseRequest_DiGA
InstanceOf: GEM_ERP_PR_Communication_DispReq
Title: "DiGA-Zuweisung des Patienten an die Krankenkasse"
Description: "Beispiel für eine Nachricht des Patienten an die Krankenkasse zur Anfrage der DiGA-Abgabe mit AccessCode"
Usage: #example
* id = "2be1c6ac-5d10-47f6-84ee-8318b2c22c76"
* meta.tag[+].display = "Dispense Request from Patient to Health Care Provider"
* meta.tag[+].display = "Communication message sent by patient to Health Care Provider to request the redeemCode for a DiGA"
* extension[flowType].url = "https://gematik.de/fhir/erp/StructureDefinition/GEM_ERP_EX_PrescriptionType"
* extension[flowType].valueCoding = https://gematik.de/fhir/erp/CodeSystem/GEM_ERP_CS_FlowType#162 "Flowtype für Digitale Gesundheitsanwendungen"
* basedOn.reference = "Task/162.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "8-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
