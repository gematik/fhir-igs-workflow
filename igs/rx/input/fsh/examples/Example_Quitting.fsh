Instance: ReceiptBundleQuittung
InstanceOf: GEM-ERP-PR-Bundle
Title: "Quittungs-Bundle für abgeschlossene Rezeptabgabe"
Description: "Beispiel für ein Quittungs-Bundle nach erfolgter Abgabe eines E-Rezepts"
Usage: #example
* id = "dffbfd6a-5712-4798-bdc8-07201eb77ab8"
* meta.tag.display = "Receipt Bundle 'Quittung' for completed dispensation of a prescription"
* identifier[+].system = "https://gematik.de/fhir/erp/NamingSystem/GEM_ERP_NS_PrescriptionId"
* identifier[=].value = "160.000.033.491.280.78"
* type = #document
* insert DateTime(timestamp)
* entry[DocumentInformation].fullUrl = "urn:uuid:c624cf47-e235-4624-af71-0a09dc9254dc"
* entry[DocumentInformation].resource = ReceiptBundleComposition
* entry[SigningDevice].fullUrl = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Device/ReceiptBundleDevice"
* entry[SigningDevice].resource = ReceiptBundleDevice
* entry[PrescriptionDigest].fullUrl = "urn:uuid:b939a82a-9c23-4b6d-a139-f468d1b9d652"
* entry[PrescriptionDigest].resource = ReceiptBundleBinary
* signature.type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* signature.type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* insert DateTime(signature.when)
* signature.who.reference = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Device/ReceiptBundleDevice"
* signature.sigFormat = #application/pkcs7-mime
* signature.data = "dGhpcyBibG9iIGlzIHNuaXBwZWQ="