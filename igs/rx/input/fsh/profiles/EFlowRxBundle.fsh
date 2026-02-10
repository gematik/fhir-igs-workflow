Profile: EFlowRxBundle
Parent: Bundle
Id: eflow-rx-bundle
Title: "GEM ERP PR Bundle"
Description: "Dokumentenbündel für Quittung"
* insert Versioning
* id 1..1
* identifier 1.. MS
* identifier only EPrescriptionId
* identifier ^short = "E-Rezept-ID"
* type = #document (exactly)
* type MS
* timestamp 1..

* entry SU
* entry ^slicing.discriminator.type = #type // Da es verschiedene Resource-Typen gibt, wird hier nach dem Typ unterschieden
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    DocumentInformation 1..1 and
    SigningDevice 1..1 and
    PrescriptionDigest 1..1

* entry[DocumentInformation] MS
  * resource only EFlowRxComposition
  * resource 1..1
  * fullUrl 1..1
  * link 0..0
  * search 0..0
  * request 0..0
  * response 0..0
* entry[SigningDevice] MS
  * resource only EFlowRxDevice
  * resource 1..
  * fullUrl 1..
  * link ..0
  * search ..0
  * request ..0
  * response ..0
* entry[PrescriptionDigest] MS
  * resource only EFlowRxDigest
  * resource 1..
  * fullUrl 1..
  * link ..0
  * search ..0
  * request ..0
  * response ..0
* signature MS
* signature only EFlowRxSignature
  * ^short = "Enveloping Signatur auf die Quittung angewendet"
