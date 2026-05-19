Profile: GEM_ERP_PR_PAR_ActivateOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-Activate-Operation-Input
Title: "GEM ERP PR ActivateOperation Input"
Description: "Dieses Profil definiert die Parameter für das Einstellen eines E-Rezeptes von PVS zum TI-Flow-Fachdienst."
* insert Meta

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains ePrescription 1..1

* parameter[ePrescription]
  * name MS
  * name = "ePrescription"
  * part 0..0
  * value[x] 0..0
  * resource 1..1 MS
  * resource only GEM_ERP_PR_Binary