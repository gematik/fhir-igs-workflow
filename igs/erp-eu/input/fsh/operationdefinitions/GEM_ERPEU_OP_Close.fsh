Instance: EUCloseOperation
InstanceOf: OperationDefinition
Usage: #definition
* insert Operation(EUClose)
* description = "The operation $close finishes the e-prescription workflow and creates a receipt. The Output of this operation is a signed Bundle, to be used for further financial processing. The status of the Task then changes into #completed"
* code = #eu-close
* system = false
* type = false
* instance = true
* resource = #Task

* inputProfile = Canonical(GEM_ERPEU_PR_PAR_CloseOperation_Input)

// in
* parameter[+]
  * name = #requestData
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Additional request information"
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

* parameter[+]
  * name = #practitionerData
  * use = #in
  * type = #Practitioner
  // * targetProfile[+] = Canonical(GEM_ERPEU_PR_Practitioner) opd-3 "A targetProfile can only be specified for parameters of type Reference or Canonical"
  * min = 1
  * max = "1"
  * documentation = "Information on the practitioner who dispensed"
* parameter[+]
  * name = #organizationData
  * use = #in
  * type = #Organization
  // * targetProfile[+] = Canonical(GEM_ERPEU_PR_Organization) opd-3 "A targetProfile can only be specified for parameters of type Reference or Canonical"
  * min = 1
  * max = "1"
  * documentation = "Information on the organization where the dispensation happened"
* parameter[+]
  * name = #practitionerRoleData
  * type = #PractitionerRole
  // * targetProfile[+] = Canonical(GEM_ERPEU_PR_PractitionerRole) opd-3 "A targetProfile can only be specified for parameters of type Reference or Canonical"
  * use = #in
  * min = 1
  * max = "1"

* parameter[+]
  * name = #rxDispensation
  * use = #in
  * min = 1
  * max = "*"
  * documentation = "Information on dispensed Medication(s)"
  * part[+]
    * name = #medicationDispense
    * type = #MedicationDispense
    * use = #in
    * min = 1
    * max = "1"
  * part[+]
    * name = #medication
    * type = #Medication
    * use = #in
    * min = 1
    * max = "1"