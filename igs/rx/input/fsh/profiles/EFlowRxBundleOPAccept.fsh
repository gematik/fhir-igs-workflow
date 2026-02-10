Profile: EFlowRxBundleOPAccept
Parent: Bundle
Id: eflow-rx-bundle-op-accept
Title: "GEM ERP PR Bundle OP Accept"
Description: "Antwort des E-Rezept-Fachdienst auf die $accept-Operation"
* insert Versioning

* type = #collection (exactly)
* entry 2..2
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Die Aufgabe und das QES signierte Bundle."

* entry contains erxTask 1..1 and erxBinary 1..1

* entry[erxTask].resource only EFlowRxTask
* entry[erxBinary].resource only EFlowRxBinary