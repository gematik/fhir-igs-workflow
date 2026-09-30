Instance: Example-POST-Close-Response
InstanceOf: TIFlowDiGACloseOperationOutput //Parameters //TODO: Eigenes Parameters Definition für die Schnittstelle $close
Usage: #example
Title: "Output-Parameter für $close beim Abrufen der Quittung durch den Kostenträger"
Description: "Beispiel der Output-Parameter der FHIR-Operation $close, die verwendet wird, wenn der Kostenträger die Quittung zu einer Verordnung beim TI-Flow-Fachdienst abruft."
* parameter[return]
  * resource = Example-Receipt-Bundle


Instance: Example-Receipt-Bundle
InstanceOf: TIFlowDiGAReceiptBundle
Usage: #example
Title: "DiGA-E-Rezept abschließen ($close)"
Description: "Bereitstellung des Freischaltcodes (oder Ablehnungsbegründung) via $close-Operation; Rückgabe des signierten Quittungs-Bundles als Bestätigung."
* type = #document
* insert Prescription_Identifier(identifier)
* insert DateTime(timestamp)
* entry[DocumentInformation].fullUrl = $URN-DiGA-receipt-composition
* entry[DocumentInformation].resource = Example-DiGA-Receipt-Composition
* entry[SigningDevice].fullUrl = $URN-device-DiGA
* entry[SigningDevice].resource = Example-Device-DiGA
* entry[PrescriptionDigest].fullUrl = $URN-binary-DiGA
* entry[PrescriptionDigest].resource = Example-Binary-DiGA
* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* insert DateTime(signature.when)
* signature.who.reference = $URN-device-DiGA
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="