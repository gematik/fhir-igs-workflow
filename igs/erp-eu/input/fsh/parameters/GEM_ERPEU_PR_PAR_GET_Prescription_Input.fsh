Profile: GEM_ERPEU_PR_PAR_GET_Prescription_Input
Parent: Parameters
Id: GEM-ERPEU-PR-PAR-EU-GET-Prescription-Input
Title: "GEM ERPEU PR PAR GET Prescription Input"
Description: "This profile defines the parameters for receiving dispense information for a prescription that was redeemed in the EU"
* insert Profile(GEM_ERPEU_PR_PAR_GET_Prescription_Input)

* parameter 1..1 MS

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains 
  requestData 1..1

* parameter[requestData]
  * obeys workflow-parameters-get-prescription-eu-1
  * name MS
  * name = "requestData"
  * value[x] 0..0
  * resource 0..0
  * part MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "name"
    * ^slicing.rules = #closed
  * part contains
    requesttype 1..1 MS and
    kvnr 1..1 MS and
    accessCode 1..1 MS and
    countryCode 1..1 MS and
    prescription-id 0..* MS and
    practitionerName 1..1 MS and
    practitionerRole 1..1 MS and
    pointOfCare 1..1 MS and
    healthcare-facility-type 1..1 MS
  * part[requesttype]
    * name MS
    * name = "requesttype"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding from GEM_ERPEU_VS_RequestType (required)
      * system 1..1 MS
    * resource 0..0
    * part 0..0
  * part[kvnr]
    * name MS
    * name = "kvnr"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only IdentifierKvid10
    * resource 0..0
    * part 0..0
  * part[accessCode]
    * name MS
    * name = "accessCode"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only GEM_ERPEU_PR_Access_Code
    * resource 0..0
    * part 0..0
  * part[countryCode]
    * name MS
    * name = "countryCode"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding.system 1..1
    * valueCoding.system = $cs-iso-3166
    * valueCoding from Iso3166-1-2 (required) // Nach VZD Profil NCPeHCountryEx
    * resource 0..0
    * part 0..0
  * part[prescription-id]
    * name MS
    * name = "prescription-id"
    * value[x] 1..1
    * value[x] only Identifier
    * valueIdentifier only EPrescriptionId
    * resource 0..0
    * part 0..0
  * part[practitionerName]
    * name MS
    * name = "practitionerName"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[practitionerRole]
    * name MS
    * name = "practitionerRole"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding from EPAStructuralRoleofHealthcareProfessionalVS (required)
      * system 1..1 MS
    * resource 0..0
    * part 0..0
  * part[pointOfCare]
    * name MS
    * name = "pointOfCare"
    * value[x] 1..1
    * value[x] only string
    * resource 0..0
    * part 0..0
  * part[healthcare-facility-type]
    * name MS
    * name = "healthcare-facility-type"
    * value[x] 1..1
    * value[x] only Coding
    * valueCoding from TIOrganizationProfessionTypeOidVS (required)
      * system 1..1 MS
    * resource 0..0
    * part 0..0

Invariant: workflow-parameters-get-prescription-eu-1
Description: "Prescription IDs must be present if the request type is 'e-prescriptions-retrieval'"
Expression: "part.where(name = 'requesttype').value.code = 'e-prescriptions-retrieval' implies part.where(name = 'prescription-id').exists()"
Severity: #error

