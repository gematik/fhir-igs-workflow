Instance: Example-GEM-ERP-Bundle
InstanceOf: GEM_ERP_PR_Bundle
Usage: #example
* identifier.value = "160.000.000.000.000.01"
* insert DateTimeStamp(timestamp)
* link.relation = "self"
* link.url = "https://erp-ref.zentral.erp.splitdns.ti-dienste.de/Task/160.000.000.000.000.01/$close/"
* entry[DocumentInformation].fullUrl = $URN_GEM_ERP_Composition
* entry[DocumentInformation].resource = Example-GEM-ERP-Composition
* entry[SigningDevice].fullUrl = $URN_GEM_ERP_Device
* entry[SigningDevice].resource = Example-GEM-ERP-Device
* entry[PrescriptionDigest].fullUrl = $URN_GEM_ERP_Digest
* entry[PrescriptionDigest].resource = Example-GEM-ERP-Digest
* signature = GEM-ERP-PR-Signature

Instance: Example-GEM-ERP-Composition
InstanceOf: GEM_ERP_PR_Composition
Usage: #example
* id = $UUID_GEM_ERP_Composition
* extension[Beneficiary].valueIdentifier.value = "3-SMC-B-Testkarte-883110000129070"
* type = $GEM_ERP_CS_DocumentType#3 "Receipt"
* insert DateTimeStamp(date)
* author = Reference($URN_GEM_ERP_Device)
* insert DateTimeStamp(event.period.start)
* insert DateTimeStampPlus1Hr(event.period.end)
* section.entry = Reference($URN_GEM_ERP_Digest)

Instance: Example-GEM-ERP-Device
InstanceOf: GEM_ERP_PR_Device
Usage: #inline
* id = $UUID_GEM_ERP_Device
* status = #active
* insert FachdienstVersion(serialNumber)
* insert FachdienstVersion(version.value)
* deviceName.name = "E-Rezept-Fachdienst"
* deviceName.type = #user-friendly-name
* contact.system = #email
* contact.value = "betrieb@gematik.de"

Instance: Example-GEM-ERP-Digest
InstanceOf: GEM_ERP_PR_Digest
Usage: #inline
* id = $UUID_GEM_ERP_Digest
* meta.versionId = "1"
* data = "tJg8c5ZtdhzEEhJ0ZpAsUVFx5dKuYgQFs5oKgthi17M="

Instance: GEM-ERP-PR-Signature
InstanceOf: GEM_ERP_PR_Signature
Usage: #inline
* type[AuthorsSignature].system = "urn:iso-astm:E1762-95:2013"
* type[AuthorsSignature].code = #1.2.840.10065.1.12.1.1
* insert DateTimeStamp(when)
* who = Reference($URN_GEM_ERP_Device)
* sigFormat = urn:ietf:bcp:13#application/pkcs7-mime
* data = "RGllcyBpc3QgZWluIEJlaXNwaWVs"
