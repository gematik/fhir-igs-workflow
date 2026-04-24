Profile: TIFlowOpAcceptBundle
Parent: Bundle
Id: tiflow-op-accept-bundle
Title: "Bundle der $accept Operation"
Description: "Antwort des TI-Flow-Fachdienst auf die $accept-Operation"
* insert Meta

* type = #collection (exactly)
* entry 2..2
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Die Aufgabe und das QES signierte Bundle."

* entry contains task 1..1 and binary 1..1

* entry[task].resource only TIFlowTask
* entry[binary].resource only GEM_ERP_PR_Binary
