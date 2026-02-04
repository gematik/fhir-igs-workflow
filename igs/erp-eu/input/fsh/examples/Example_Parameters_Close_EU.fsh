Instance: ExampleEUCloseInputParameters
InstanceOf: GEM_ERPEU_PR_PAR_CloseOperation_Input
Usage: #example
Title: "Example EU-Close Parameters"

* parameter[requestData]
  * name = "requestData"
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

* parameter[practitionerData]
  * name = "practitionerData"
  * resource = Example-EU-Practitioner
* parameter[organizationData]
  * name = "organizationData"
  * resource = Example-EU-Organization
* parameter[practitionerRoleData]
  * name = "practitionerRoleData"
  * resource = Example-EU-PractitionerRole

* parameter[rxDispensation]
  * name = "rxDispensation"
  * part[medicationDispense]
    * name = "medicationDispense"
    * resource = Example-MedicationDispense-EU
  * part[medication]
    * name = "medication"
    * resource = SumatripanMedication
