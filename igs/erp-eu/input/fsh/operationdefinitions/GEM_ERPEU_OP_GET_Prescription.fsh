Instance: GET-Prescription-EU
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(GET-Prescription-EU)
* description = "The Operation gets Presciption Information from the ERP System for usage in the e-prescription workflow for EU countries"
* code = #get-eu-prescriptions
* affectsState = false
* system = true
* type = false
* instance = false

* inputProfile = Canonical(GEM_ERPEU_PR_PAR_GET_Prescription_Input)
* outputProfile = Canonical(GEM_ERPEU_PR_PAR_GET_Prescription_Output)

// in
* parameter[+]
  * name = #requestData
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Additional request information"
  * part[+]
    * name = #requesttype
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
  * part[+]
    * name = #kvnr
    * use = #in
    * min = 1
    * max = "1"
    * type = #Identifier
  * part[+]
    * name = #accessCode
    * use = #in
    * min = 1
    * max = "1"
    * type = #Identifier
  * part[+]
    * name = #countryCode
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
  * part[+]
    * name = #prescription-id
    * use = #in
    * min = 0
    * max = "*"
    * type = #Identifier
  * part[+]
    * name = #practitionerName
    * use = #in
    * min = 1
    * max = "1"
    * type = #string
  * part[+]
    * name = #practitionerRole
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding
  * part[+]
    * name = #pointOfCare
    * use = #in
    * min = 1
    * max = "1"
    * type = #string
  * part[+]
    * name = #healthcare-facility-type
    * use = #in
    * min = 1
    * max = "1"
    * type = #Coding

// out
* parameter[+]
  * name = #return
  * use = #out
  * min = 0
  * max = "1"
  * type = #Bundle
  * documentation = "Depending on the requesttype this operation returns a Bundle containing eRezept KBV_PR_ERP_Bundle Prescription-Bundles."