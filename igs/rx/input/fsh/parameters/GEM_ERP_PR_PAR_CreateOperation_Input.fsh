Profile: GEM_ERP_PR_PAR_CreateOperation_Input
Parent: Parameters
Id: GEM-ERP-PR-PAR-Create-Operation-Input
Title: "GEM ERP PR CreateOperation Input"
Description: "Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum TI-Flow-Fachdienst. Dies kann für die $create-Operation verwendet werden."
* insert Meta

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains workflowType 1..1

* parameter[workflowType]
  * name MS
  * name = "workflowType"
  * resource 0..0
  * part 0..0
  * value[x] only Coding
  * valueCoding from GEM_ERP_VS_FlowType (required)
    * system 1..1 MS
    * code 1..1 MS