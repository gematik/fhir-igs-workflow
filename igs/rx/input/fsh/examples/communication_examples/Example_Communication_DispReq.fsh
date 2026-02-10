Instance: Communication_DispenseRequest
InstanceOf: EFlowRxCommunicationDispReq
Title: "Zuweisung des Patienten an die Apotheke"
Description: "Beispiel für eine Nachricht des Patienten an die Apotheke zur Anfrage der Medikamentenabgabe mit AccessCode"
Usage: #example
* id = "a218a36e-f2fd-4603-ba67-c827acfef01b"
* meta.tag[+].display = "Dispense Request from Patient to Pharmacy"
* meta.tag[+].display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].valueCoding = https://gematik.de/fhir/eflow-rx/CodeSystem/EFlowRxFlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
* payload.contentString = "{ \"version\": \"1\", \"supplyOptionsType\": \"delivery\", \"name\": \"Dr. Maximilian von Muster\", \"address\": [ \"wohnhaft bei Emilia Fischer\", \"Bundesallee 312\", \"123. OG\", \"12345 Berlin\" ], \"hint\": \"Bitte im Morsecode klingeln: -.-.\", \"phone\": \"004916094858168\" }"

/*
Instance: INVALID-Communication-DispenseRequest
InstanceOf: EFlowRxCommunication_DispReq
Title: "UNGÜLTIG: Abgabe-Anfrage ohne Payload"
Description: "Ungültiges Beispiel für eine Abgabe-Anfrage ohne erforderlichen Payload-Inhalt zur Validierung"
Usage: #example
* meta.tag.display = "Communication message sent by patient to pharmacy to request the dispensation of medicine by providing the AccessCode"
* extension[flowType].url = "https://gematik.de/fhir/eflow-rx/StructureDefinition/EFlowRxPrescriptionTypeExtension"
* extension[flowType].valueCoding = https://gematik.de/fhir/eflow-rx/CodeSystem/EFlowRxFlowType#160 "Flowtype für Apothekenpflichtige Arzneimittel"
* basedOn.reference = "Task/160.000.033.491.280.78/$accept?ac=777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"
* status = #unknown
* recipient[+].identifier.system = $identifier-telematik-id
* recipient[=].identifier.value = "3-SMC-B-Testkarte-883110000123465"
* sender.identifier.system = $identifier-kvid-10
* sender.identifier.value = "X234567890"
* insert DateTimeStamp(sent)
*/