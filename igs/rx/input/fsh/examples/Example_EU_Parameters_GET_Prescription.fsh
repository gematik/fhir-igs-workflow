Instance: ExampleEUGETPrescriptionDEMOGRAPHICS
InstanceOf: GEM_ERPEU_PR_PAR_GET_Prescription_Input
Usage: #example
Title: "Example EU-GET Prescription Parameters"

* parameter[requestData]
  * name = "requestData"
  * part[requesttype]
    * name = "requesttype"
    * valueCoding = GEM_ERPEU_CS_RequestType#demographics
  * part[kvnr]
    * name = "kvnr"
    * valueIdentifier.value = "X123456789"
  * part[accessCode]
    * name = "accessCode"
    * valueIdentifier.value = "ABC123"
  * part[countryCode]
    * name = "countryCode"
    * valueCoding.code = #BE
  * part[practitionerName]
    * name = "practitionerName"
    * valueString = "Sanches"
  * part[practitionerRole]
    * name = "practitionerRole"
    * valueCoding = $cs-oid-practitioner-role#2262 "Pharmacists"
  * part[pointOfCare]
    * name = "pointOfCare"
    * valueString = "Super Pharmacia"
  * part[healthcare-facility-type]
    * name = "healthcare-facility-type"
    * valueCoding = $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"



Instance: ExampleEUGETPrescriptionE-PRESCRIPTIONS-LIST
InstanceOf: GEM_ERPEU_PR_PAR_GET_Prescription_Input
Usage: #example
Title: "Example EU-GET Prescription Parameters"

* parameter[requestData]
  * name = "requestData"
  * part[requesttype]
    * name = "requesttype"
    * valueCoding = GEM_ERPEU_CS_RequestType#e-prescriptions-list
  * part[kvnr]
    * name = "kvnr"
    * valueIdentifier.value = "X123456789"
  * part[accessCode]
    * name = "accessCode"
    * valueIdentifier.value = "123456"
  * part[countryCode]
    * name = "countryCode"
    * valueCoding.code = #BE
  * part[practitionerName]
    * name = "practitionerName"
    * valueString = "Sanches"
  * part[practitionerRole]
    * name = "practitionerRole"
    * valueCoding = $cs-oid-practitioner-role#2262 "Pharmacists"
  * part[pointOfCare]
    * name = "pointOfCare"
    * valueString = "Super Pharmacia"
  * part[healthcare-facility-type]
    * name = "healthcare-facility-type"
    * valueCoding = $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"

Instance: ExampleEUGETPrescriptionE-PRESCRIPTIONS-RETRIEVAL
InstanceOf: GEM_ERPEU_PR_PAR_GET_Prescription_Input
Usage: #example
Title: "Example EU-GET Prescription Parameters"
* parameter[requestData]
  * name = "requestData"
  * part[requesttype]
    * name = "requesttype"
    * valueCoding = GEM_ERPEU_CS_RequestType#e-prescriptions-retrieval
  * part[prescription-id][+]
    * name = "prescription-id"
    * valueIdentifier.value = "160.000.000.000.000.01"
  * part[prescription-id][+]
    * name = "prescription-id" 
    * valueIdentifier.value = "160.000.000.000.000.02"
  * part[prescription-id][+]
    * name = "prescription-id" 
    * valueIdentifier.value = "160.000.000.000.000.03"
  * part[prescription-id][+]
    * name = "prescription-id" 
    * valueIdentifier.value = "160.000.000.000.000.04"
  * part[kvnr]
    * name = "kvnr"
    * valueIdentifier.value = "X123456789"
  * part[accessCode]
    * name = "accessCode"
    * valueIdentifier.value = "123456"
  * part[countryCode]
    * name = "countryCode"
    * valueCoding.code = #BE
  * part[practitionerName]
    * name = "practitionerName"
    * valueString = "Sanches"
  * part[practitionerRole]
    * name = "practitionerRole"
    * valueCoding = $cs-oid-practitioner-role#2262 "Pharmacists"
  * part[pointOfCare]
    * name = "pointOfCare"
    * valueString = "Super Pharmacia"
  * part[healthcare-facility-type]
    * name = "healthcare-facility-type"
    * valueCoding = $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"

/*
Instance: INVALID-workflow-parameters-get-prescription-eu-1
InstanceOf: GEM_ERPEU_PR_PAR_GET_Prescription_Input
Usage: #example
Title: "Invalid Example EU-GET Prescription Parameters"
* parameter[requestData]
  * name = "requestData"
  * part[requesttype]
    * name = "requesttype"
    * valueCoding = GEM_ERPEU_CS_RequestType#e-prescriptions-retrieval
  * part[kvnr]
    * name = "kvnr"
    * valueIdentifier.value = "X123456789"
  * part[accessCode]
    * name = "accessCode"
    * valueIdentifier.value = "123456"
  * part[countryCode]
    * name = "countryCode"
    * valueCoding.code = #BE
  * part[practitionerName]
    * name = "practitionerName"
    * valueString = "Sanches"
  * part[practitionerRole]
    * name = "practitionerRole"
    * valueCoding = $cs-oid-practitioner-role#2262 "Pharmacists"
  * part[pointOfCare]
    * name = "pointOfCare"
    * valueString = "Super Pharmacia"
  * part[healthcare-facility-type]
    * name = "healthcare-facility-type"
    * valueCoding = $cs-organization-profession-oid#1.2.276.0.76.4.54 "Öffentliche Apotheke"
*/