Profile: GEM_ERPEU_PR_Organization
Parent: TIOrganization
Id: GEM-ERPEU-PR-Organization
Title: "Organization Information Received from the EU"
Description: "This Organization Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERPEU_PR_Organization)

* identifier 1..* MS
  * ^short = "Organization Identifier"
  * ^definition = "An identifier for the organization"
  * ^comment = "There are not yet specific identifier systems defined. Therefore the field system is optional, but has to be used if there is a known identifier system."
  * system MS
  * value 1..1 MS

* name 1..1 MS

* address 0..1 MS
  * ^comment = "The address information is required for a dispensing organization. That means that the data can either be given or also stated with a data absent reason."
  * line 1..* MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * city 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * postalCode 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * state 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
  * country 1..1 MS
    * ^comment = "This information is required. That means that the data can either be given or also stated with a data absent reason."
