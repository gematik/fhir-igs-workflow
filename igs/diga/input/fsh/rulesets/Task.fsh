RuleSet: TaskIdentifier(flowType)
* identifier[PrescriptionID].use = #official
* identifier[PrescriptionID].value = "{flowType}.000.000.000.000.01"

RuleSet: TaskDates
* insert DateTime(authoredOn)
* insert DateTimeStamp(lastModified)

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

RuleSet: TaskPerformerPharmacy
* performerType = $GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.54 "Öffentliche Apotheke"
* performerType.text = "Öffentliche Apotheke"

RuleSet: TaskPerformerInsurance
* performerType = $GEM_ERP_CS_OrganizationType#urn:oid:1.2.276.0.76.4.59 "Kostenträger"
* performerType.text = "Kostenträger"