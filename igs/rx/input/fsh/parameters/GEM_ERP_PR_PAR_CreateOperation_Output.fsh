Profile: EFlowRxPARCreateOperationOutput
Parent: Parameters
Id: eflow-rx-par-create-operation-output
Title: "GEM ERP PR CreateOperation Output"
Description: "Dieses Profil definiert die Parameter für die Erstellung einer Aufgabe von PVS zum E-Rezept-Fachdienst. Dies kann für die $create-Operation verwendet werden."
* insert Versioning

* parameter 1..1

* parameter ^slicing.discriminator.type = #pattern
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed

* parameter contains return 1..1

* parameter[return]
  * name MS
  * name = "return"
  * value[x] 0..0
  * resource 1..1
  * resource only GEM_ERP_PR_Task
  * part 0..0
