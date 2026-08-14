RuleSet: TaskExtension(flowType)
//* extension[flowType].valueCoding = $GEM_ERP_CS_FlowType#{flowType}
* insert AcceptDate(extension[acceptDate].valueDate)
* insert ExpiryDate(extension[expiryDate].valueDate)

RuleSet: Task162Extension
//* extension[flowType].valueCoding = $cs-flowtype#162 "Muster 16 (Digitale Gesundheitsanwendungen)"
* insert DiGAExpiryDate(extension[acceptDate].valueDate) // Expiry, weil so festgelegt beide Daten 3 Monate
* insert DiGAExpiryDate(extension[expiryDate].valueDate)

RuleSet: TaskIdentifierAccessCode
* identifier[AccessCode].use = #official
* identifier[AccessCode].value = "777bea0e13cc9c42ceec14aec3ddee2263325dc2c6c699db115f58fe423607ea"

RuleSet: TaskSecret
* identifier[Secret].use = #official
* identifier[Secret].value = "c36ca26502892b371d252c99b496e31505ff449aca9bc69e231c58148f6233cf"

RuleSet: TaskInputQES(ref)
* input[ePrescription].type = $GEM_ERP_CS_DocumentType#1
* input[ePrescription].valueReference = Reference({ref})

RuleSet: TaskInputReceipt(ref)
* input[patientReceipt].type = $GEM_ERP_CS_DocumentType#2
* input[patientReceipt].valueReference = Reference({ref})

RuleSet: TaskOutputReceipt(ref)
* output[receipt].type = $GEM_ERP_CS_DocumentType#3
* output[receipt].valueReference = Reference({ref})

RuleSet: KVNR(field)
* {field} = "X123456789"

RuleSet: PKV_Identifier(field)
* {field}.value = "P987654321"
* {field}.system = "http://fhir.de/sid/gkv/kvid-10"

RuleSet: ApoTelematikID(field)
* {field}.system = "https://gematik.de/fhir/sid/telematik-id"
* {field}.value = "3-2-APO-XanthippeVeilchenblau01"

RuleSet: ArztTelematikID(field)
* {field} = "1-2-DOC-Testkarte-012423424"

RuleSet: KTRTelematikID(field)
* {field}.system = "https://gematik.de/fhir/sid/telematik-id"
* {field}.value = "8-SMC-B-Testkarte-883110000116873"

RuleSet: GKV_Task(status)
* status = #{status}
* insert TaskExtension(160)
* extension[flowType].valueCoding.display = "Muster 16 (Apothekenpflichtige Arzneimittel)"
* insert TaskIdentifier(160)
* insert GKV_Identifier(for.identifier)
* insert TaskMiscInfo
* performerType = $GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* performerType.text = "Öffentliche Apotheke"

RuleSet: RS_DiGA_VerordnungsDatensatz(task-id)
* identifier.value = "{task-id}"
* type = #document
* insert DateTimeStamp(timestamp)
* entry[DokumentenInformation].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Composition/55eb2cd5-27f0-46ef-87d1-1ffc30e85fd9"
* entry[DokumentenInformation].resource = 55eb2cd5-27f0-46ef-87d1-1ffc30e85fd9
* entry[VerordnungDiGA].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/DeviceRequest/a1533e28-4631-4afa-b5e6-f233fad87f53"
* entry[VerordnungDiGA].resource = a1533e28-4631-4afa-b5e6-f233fad87f53
* entry[Patient].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Patient/40acd463-b25d-4ede-8b1f-2b0994f29aa5"
* entry[Patient].resource = 40acd463-b25d-4ede-8b1f-2b0994f29aa5
* entry[AusstellendeVerschreibendeVerantwortlichePerson].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Practitioner/1228772e-1c72-493b-8b5c-5ae54d25843d"
* entry[AusstellendeVerschreibendeVerantwortlichePerson].resource = 1228772e-1c72-493b-8b5c-5ae54d25843d
* entry[Einrichtung].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Organization/b87b9d90-c8db-4660-93eb-fed916caa2da"
* entry[Einrichtung].resource = b87b9d90-c8db-4660-93eb-fed916caa2da
* entry[Kostentraeger].fullUrl = "http://pvs.praxis-topp-gluecklich.local/fhir/Coverage/2d3a92c2-c93c-47ad-8ab5-49b275be97ee"
* entry[Kostentraeger].resource = 2d3a92c2-c93c-47ad-8ab5-49b275be97ee