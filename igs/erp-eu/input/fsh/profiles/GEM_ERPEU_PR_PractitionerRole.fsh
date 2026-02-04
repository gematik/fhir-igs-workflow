Profile: GEM_ERPEU_PR_PractitionerRole
Parent: TIPractitionerRole
Id: GEM-ERPEU-PR-PractitionerRole
Title: "PractitionerRole Information Received from the EU"
Description: "This PractitionerRole Profile is sent by the NCPeH when redeeming a Prescription in the EU"
* insert Profile(GEM_ERPEU_PR_PractitionerRole)

* practitioner 1..1 MS
* practitioner only Reference(GEM_ERPEU_PR_Practitioner)

* organization 1..1 MS
* organization only Reference(GEM_ERPEU_PR_Organization)

