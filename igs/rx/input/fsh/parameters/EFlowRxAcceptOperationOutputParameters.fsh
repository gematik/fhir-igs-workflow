Profile: EFlowRxAcceptOperationOutputParameters
Parent: Parameters
Id: eflow-rx-accept-operation-output-parameters
Title: "GEM ERP PR AcceptOperation Output"
Description: "Dieses Profil definiert die Parameter für die Annahme eines Medikaments von AVS zum E-Rezept-Fachdienst. Dies kann für die $accept-Operation verwendet werden."
* insert Meta

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
  * resource only GEM_ERP_PR_Bundle_OP_Accept
  * part 0..0
