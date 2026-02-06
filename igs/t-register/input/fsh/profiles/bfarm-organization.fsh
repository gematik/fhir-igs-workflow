Profile: ERP_TPrescription_Organization
Parent: TIOrganization
Id: erp-tprescription-organization
Title: "E-T-Rezept Organization"
Description: "Angaben zur Apotheke, die das T-Rezept beliefert hat."
* insert Profile(erp-tprescription-organization)

* telecom MS
* name MS
* address MS
* identifier 1..1
* identifier[TelematikID]

// Forbidden Elements
* active 0..0
* type 0..0
* alias 0..0
* partOf 0..0
* contact 0..0
* endpoint 0..0