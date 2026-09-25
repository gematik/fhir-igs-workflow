Instance: Example-DiGA-Receipt-Composition
InstanceOf: TIFlowDiGAReceiptComposition
Title: "Zusammenstellung für Quittungs-Bundle"
Description: "Beispiel für eine Zusammenstellung (Composition) für ein DiGA-Quittungs-Bundle"
Usage: #inline
* status = #final
* extension[Beneficiary].url = $GEM_ERP_EX_Beneficiary
* insert KTRTelematik_Identifier(extension[Beneficiary].valueIdentifier)
* type.coding = $GEM_ERP_CS_DocumentType#3 "Receipt"
* insert DateTime(date)
* insert DateTime(event.period.start)
* insert DateTime(event.period.end)
* author.reference = $URN-device-DiGA
* title = "Quittung"
* section[+].entry.reference = $URN-binary-DiGA

Instance: Example-Device-DiGA
InstanceOf: GEM_ERP_PR_Device
Title: "Gerät für Quittungs-Bundle"
Description: "Beispiel für ein Gerät, das für die Erstellung von DiGA-Quittungen verwendet wird"
Usage: #example
* id = $UUID-device-DiGA
* status = #active
* serialNumber = "2.0.0"
* deviceName.name = "TI-Flow-Fachdienst"
* deviceName.type = #user-friendly-name
* version.value = "2.0.0"
* contact.system = #email
* contact.value = "betrieb@gematik.de"
